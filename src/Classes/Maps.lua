local app = select(2, ...);
local L = app.L;

-- App locals
local contains, IsQuestFlaggedCompleted = app.contains, app.IsQuestFlaggedCompleted;

-- Global locals
local coroutine, ipairs, pairs, rawset, tinsert, tonumber, math_floor, math_sqrt
	= coroutine, ipairs, pairs, rawset, tinsert, tonumber, math.floor, math.sqrt;
local CreateVector2D, GetRealZoneText, GetSubZoneText, InCombatLockdown
	= CreateVector2D, GetRealZoneText, GetSubZoneText, InCombatLockdown;
local C_Map_GetMapArtID = C_Map.GetMapArtID;
local C_Map_GetMapLevels = C_Map.GetMapLevels;
local C_Map_GetBestMapForUnit = C_Map.GetBestMapForUnit;
local C_Map_GetPlayerMapPosition = C_Map.GetPlayerMapPosition;
local C_Map_GetMapInfo, C_Map_GetAreaInfo = C_Map.GetMapInfo, C_Map.GetAreaInfo;
local C_Map_GetMapChildrenInfo = C_Map.GetMapChildrenInfo;
local C_Map_GetWorldPosFromMapPos = C_Map.GetWorldPosFromMapPos;
local C_MapExplorationInfo_GetExploredMapTextures = C_MapExplorationInfo.GetExploredMapTextures;
local C_MapExplorationInfo_GetExploredAreaIDsAtPosition = C_MapExplorationInfo.GetExploredAreaIDsAtPosition;

-- Current Map Detection
local CurrentMapID;
local MapIDToMapName = setmetatable({}, {
	__index = L.MAP_ID_TO_ZONE_TEXT,
});
local function distance( x1, y1, x2, y2 )
	return math_sqrt( (x2-x1)^2 + (y2-y1)^2 )
end
local function GetCurrentMapID()
	local originalMapID = C_Map_GetBestMapForUnit("player");
	if originalMapID then
		local remap = app.MapRemapping[originalMapID];
		if not remap then return originalMapID; end
		
		local info = C_Map_GetMapInfo(originalMapID);
		--print("GetCurrentMapID (original): ", originalMapID, info and info.name, not not remap);
		
		local substitutions = remap.artIDs;
		if substitutions then
			local artID = C_Map_GetMapArtID(originalMapID);
			if artID then
				local mapID = substitutions[artID];
				if mapID then
					--print(" SUBBED (artID): ", artID, mapID);
					return mapID;
				end
			end
		end
		
		local zoneTexts = {};
		local name = GetRealZoneText();
		if name and name:len() > 0 then
			zoneTexts[name] = 1;
		end
		name = GetSubZoneText();
		if name and name:len() > 0 then
			zoneTexts[name] = 1;
		end
		name = GetZoneText();
		if name and name:len() > 0 then
			zoneTexts[name] = 1;
		end
		
		substitutions = remap.areaIDs;
		if substitutions then
			for areaID,mapID in pairs(substitutions) do
				local info = C_Map_GetAreaInfo(areaID);
				if info and zoneTexts[info] then
					--print(" SUBBED (areaID): ", areaID, info, mapID);
					return mapID;
				end
			end
		end
		substitutions = remap.names;
		if remap.isContinent and not remap.compiledList then
			remap.compiledList = true;
			local childMaps = C_Map_GetMapChildrenInfo(originalMapID);
			if childMaps then
				if not substitutions then
					substitutions = {};
					remap.names = substitutions;
				end
				for j,childMapInfo in ipairs(childMaps) do
					substitutions[childMapInfo.name] = childMapInfo.mapID;
					local subChildMaps = C_Map_GetMapChildrenInfo(childMapInfo.mapID);
					if subChildMaps then
						for k,subChildMapInfo in ipairs(subChildMaps) do
							substitutions[subChildMapInfo.name] = subChildMapInfo.mapID;
						end
					end
				end
			end
		end
		if substitutions then
			for name,mapID in pairs(substitutions) do
				if zoneTexts[name] then
					--print(" SUBBED (name): ", name, info, mapID);
					return mapID;
				end
			end
			if remap.isContinent then
				-- Attempt to find the closest map.
				local position = C_Map_GetPlayerMapPosition(originalMapID, "player");
				if position then
					local continentID, worldPosition = C_Map_GetWorldPosFromMapPos(originalMapID, position);
					local closestDistance, closestMapID = 99999999;
					local px, py = worldPosition:GetXY();
					for _,mapID in pairs(substitutions) do
						position = C_Map_GetPlayerMapPosition(mapID, "player")
						if position then
							continentID, worldPosition = C_Map_GetWorldPosFromMapPos(mapID, position);
							if worldPosition then
								local dist = distance(px, py, worldPosition:GetXY());
								if dist < closestDistance then
									closestDistance = dist;
									closestMapID = mapID;
								end
							end
						end
					end
					if closestMapID then
						--print(" SUBBED (closest): ", closestMapID);
						return closestMapID;
					end
				end
			end
		end
	else
		local zoneTexts,substitutions = {};
		local name = GetRealZoneText();
		if name and name:len() > 0 then
			zoneTexts[name] = 1;
		end
		name = GetSubZoneText();
		if name and name:len() > 0 then
			zoneTexts[name] = 1;
		end
		name = GetZoneText();
		if name and name:len() > 0 then
			zoneTexts[name] = 1;
		end
		for mapID,remap in pairs(app.MapRemapping) do
			substitutions = remap.areaIDs;
			if substitutions then
				for areaID,mapID in pairs(substitutions) do
					local info = C_Map_GetAreaInfo(areaID);
					if info and zoneTexts[info] then
						--print(" SUBBED (areaID): ", areaID, info, mapID);
						return mapID;
					end
				end
			end
			substitutions = remap.names;
			if substitutions then
				for name,mapID in pairs(substitutions) do
					if zoneTexts[name] then
						--print(" SUBBED (name): ", name, info, mapID);
						return mapID;
					end
				end
			end
		end
	end
	return originalMapID;
end
local function GetMapName(mapID)
	if mapID then
		local mapName = MapIDToMapName[mapID];
		if mapName then return mapName; end

		local info = C_Map_GetMapInfo(mapID);
		return (info and info.name) or ("Map ID #" .. mapID);
	else
		return "Map ID #???";
	end
end
local UpdateLocationCoroutine;
if app.GameBuildVersion < 30000 then
	-- Before Wrath Classic we didn't have mapIDs in the world proper, so ATT had to make a guess.
	-- This relied on the map name and stuff.
	UpdateLocationCoroutine = function()
		-- Wait a second, will ya? The position detection is BAD.
		for i=1,30,1 do coroutine.yield(); end

		-- Acquire the new map ID.
		local mapID = GetCurrentMapID();
		while not mapID do
			coroutine.yield();
			mapID = GetCurrentMapID();
		end
		if CurrentMapID ~= mapID then
			CurrentMapID = mapID;
			app.CurrentMapID = mapID;
			app.CurrentMapInfo = C_Map_GetMapInfo(mapID);
			app.HandleEvent("OnCurrentMapIDChanged");
		end
	end
else
	-- After Wrath Classic you don't need to wait for a bit before checking.
	UpdateLocationCoroutine = function()
		-- Acquire the new map ID.
		local mapID = GetCurrentMapID();
		while not mapID do
			coroutine.yield();
			mapID = GetCurrentMapID();
		end
		if CurrentMapID ~= mapID then
			CurrentMapID = mapID;
			app.CurrentMapID = mapID;
			app.CurrentMapInfo = C_Map_GetMapInfo(mapID);
			app.HandleEvent("OnCurrentMapIDChanged");
		end
	end
end
local function UpdateLocation()
	app:StartATTCoroutine("UpdateLocation", UpdateLocationCoroutine);
end
app.events.ZONE_CHANGED = UpdateLocation;
app.events.ZONE_CHANGED_INDOORS = UpdateLocation;
app.events.ZONE_CHANGED_NEW_AREA = UpdateLocation;
app.events.PLAYER_INTERACTION_MANAGER_FRAME_HIDE = UpdateLocation;
app:RegisterEvent("ZONE_CHANGED");
app:RegisterEvent("ZONE_CHANGED_INDOORS");
app:RegisterEvent("ZONE_CHANGED_NEW_AREA");
pcall(app.RegisterEvent, app, "PLAYER_INTERACTION_MANAGER_FRAME_HIDE");
app.AddEventHandler("OnReady", UpdateLocation);
app.GetMapName = GetMapName;
UpdateLocation();

-- Exploration
if not app.ExplorationDB then app.ExplorationDB = {}; end
if not app.ExplorationAreaPositionDB then app.ExplorationAreaPositionDB = {}; end
app.CreateExploration = app.CreateClass("Exploration", "explorationID", {
	["text"] = function(t)
		return C_Map_GetAreaInfo(t.explorationID) or RETRIEVING_DATA;
	end,
	["title"] = function(t)
		return t.maphash;
	end,
	["description"] = function(t)
		if not TomTom then
			return "You can use Alt+Right Click to plot the coordinates with TomTom installed. If this refuses to be marked collected for you in ATT, try reloading your UI or relogging.";
		else
			return "You can use Alt+Right Click to plot the coordinates. If this refuses to be marked collected for you in ATT, try reloading your UI or relogging.";
		end
	end,
	["preview"] = function(t)
		local exploredMapTextureInfo = t.exploredMapTextureInfo;
		if exploredMapTextureInfo then
			local texture = exploredMapTextureInfo.fileDataIDs[1];
			if texture then
				rawset(t, "preview", texture);
				return texture;
			end
		end
	end,
	["artID"] = function(t)
		return t.parent and (t.parent.artID or (t.parent.parent and t.parent.parent.artID));
	end,
	["icon"] = function(t)
		return app.asset("Category_Exploration");
	end,
	["mapID"] = function(t)
		return t.parent and (t.parent.mapID or (t.parent.parent and t.parent.parent.mapID));
	end,
	["collectible"] = function(t)
		return app.Settings.Collectibles.Exploration;
	end,
	["collected"] = function(t)
		if app.CurrentCharacter.Exploration[t.explorationID] then return 1; end
		if app.Settings.AccountWide.Exploration and ATTAccountWideData.Exploration[t.explorationID] then return 2; end

		local maphash = t.maphash;
		if maphash then
			local exploredMapTextures = C_MapExplorationInfo_GetExploredMapTextures(t.mapID)
			if exploredMapTextures then
				for i,info in ipairs(exploredMapTextures) do
					local hash = info.textureWidth..":"..info.textureHeight..":"..info.offsetX..":"..info.offsetY;
					if hash == maphash then return app.SetCollected(nil, "Exploration", t.explorationID, true); end
				end
				--[[
				if not app.MAPHASHTHING then app.MAPHASHTHING = {}; end
					if not app.MAPHASHTHING[t.explorationID] then
					app.MAPHASHTHING[t.explorationID] = true;
					print("Failed to detect maphash '" .. maphash .. "' on map " .. t.mapID .. ".");
				end
				]]--
			end
		end
		--[[
		if not app.MAPTHING then app.MAPTHING = {}; end
		local exploredMapTextures = C_MapExplorationInfo_GetExploredMapTextures(t.mapID);
		if not app.MAPTHING[t.mapID] and exploredMapTextures then
			app.MAPTHING[t.mapID] = true;
			local hashes = {};
			for i,o in ipairs(t.parent.g) do
				if o.maphash then hashes[o.maphash] = o; end
			end
			for i,info in ipairs(exploredMapTextures) do
				local hash = info.textureWidth..":"..info.textureHeight..":"..info.offsetX..":"..info.offsetY;
				if hash and not hashes[hash] then
					print("Failed to find areaID for maphash '" .. hash .. "' on map " .. t.mapID .. ".");
				end
			end
		end
		local coords = t.coords;
		if coords and #coords > 0 then
			local c = coords[1];
			local explored = C_MapExplorationInfo_GetExploredAreaIDsAtPosition(c[2], CreateVector2D(c[1] / 100, c[2] / 100, c[2]));
			if explored then
				for _,areaID in ipairs(explored) do
					if areaID == t.explorationID then
						app.SetCollected(nil, "Exploration", areaID, true);
						return 1;
					end
				end
			end
		end
		]]--
	end,
	["coords"] = function(t)
		local coords = app.ExplorationAreaPositionDB[t.explorationID];
		if not coords then
			local maphash = t.maphash;
			if maphash then
				local coords = {};
				local width, height, offsetX, offsetY = (":"):split(maphash);
				tinsert(coords, {((offsetX + (width * 0.5)) * 100) / WorldMapFrame:GetWidth(), ((offsetY + (height * 0.5)) * 100) / WorldMapFrame:GetHeight(), t.mapID});
				return coords;
			end
		end
		return coords;
	end,
	["exploredMapTextureInfo"] = function(t)
		local maphash = t.maphash;
		if maphash then
			local exploredMapTextures = C_MapExplorationInfo_GetExploredMapTextures(t.mapID)
			if exploredMapTextures then
				for i,info in ipairs(exploredMapTextures) do
					local hash = info.textureWidth..":"..info.textureHeight..":"..info.offsetX..":"..info.offsetY;
					if hash == maphash then
						rawset(t, "exploredMapTextureInfo", info);
						return info;
					end
				end
			end
		end
	end
});

local ExplorationGrid = {};
local levelOfDetail = -1;--200;
for i=0,levelOfDetail,1 do
	for j=0,levelOfDetail,1 do
		tinsert(ExplorationGrid, CreateVector2D(i / levelOfDetail, j / levelOfDetail));
	end
end
local DiscoveredNewArea = {};
local simplifyExplorationData = function()
	local i = 100;
	while InCombatLockdown() do coroutine.yield(); end
	while i > 0 do i = i - 1; coroutine.yield(); end
	app.print("Simplifying Exploration Data...");
	local allMapData = {};
	local explorationDB = {};
	local explorationAreaPositionDB = {};
	for areaID,coords in pairs(app.ExplorationAreaPositionDB) do
		for i,coord in ipairs(coords) do
			local mapID = coord[3];
			if mapID then
				local x, y = math_floor(coord[1] * 100), math_floor(coord[2] * 100);
				local hash = x .. ":" .. y;
				local mapData = allMapData[mapID];
				if not mapData then
					mapData = {};
					mapData.areas = {};
					mapData.areaList = {};
					mapData.hits = {};
					allMapData[mapID] = mapData;
					explorationDB[mapID] = mapData.areaList;
				end
				if not mapData.areas[areaID] then
					mapData.areas[areaID] = 1;
					tinsert(mapData.areaList, areaID);
				end
				if not mapData.hits[hash] then
					mapData.hits[hash] = { areaID };
				else
					tinsert(mapData.hits[hash], areaID);
				end
			end
		end
	end
	app.print("Determining best coordinates for areas...");
	coroutine.yield();
	local sortMethod = function(a, b)
		return a[1] > b[1];
	end;
	for mapID,mapData in pairs(allMapData) do
		app.print("Determining best coordinates for map ".. mapID);
		local hitsByAreaID, hitsByCount = {}, {};
		for i,areaID in ipairs(mapData.areaList) do
			hitsByAreaID[areaID] = {};
		end
		for hash,hits in pairs(mapData.hits) do
			tinsert(hitsByCount, { #hits, hash, hits});
		end
		app.Sort(hitsByCount, sortMethod);
		coroutine.yield();

		-- Now randomly grab hashes until every area has a few hashes
		while #hitsByCount > 0 do
			local index = math.random(#hitsByCount);
			local hit = hitsByCount[index];
			tremove(hitsByCount, index);
			for i,areaID in ipairs(hit[3]) do
				local hits = hitsByAreaID[areaID];
				if #hits < 10 then tinsert(hits, hit[2]); end
			end
		end

		-- Now that each has some hashes (probably), let's simplfy that data table.
		for areaID,hits in pairs(hitsByAreaID) do
			local positions = explorationAreaPositionDB[areaID];
			if not positions then
				positions = {};
				explorationAreaPositionDB[areaID] = positions;
			end
			for i,hash in ipairs(hits) do
				local x, y = hash:match("(%d+):(%d+)");
				tinsert(positions, { tonumber(x) * 0.01, tonumber(y) * 0.01, mapID });
			end
		end
	end
	AllTheThingsAD.ExplorationDB = explorationDB;
	AllTheThingsAD.ExplorationAreaPositionDB = explorationAreaPositionDB;
	app.ExplorationDB = explorationDB;
	app.ExplorationAreaPositionDB = explorationAreaPositionDB;
	app.print("Done Simplifying Exploration Data.");
end
local onMapUpdate = function(t)
	local explorationByAreaID = {};
	local explorationHeader = nil;
	local coordinates = {};
	if t.g then
		for i,o in ipairs(t.g) do
			if o.key == "headerID" and o.headerID == app.HeaderConstants.EXPLORATION then
				explorationHeader = o;
				if o.g then
					for j,e in ipairs(o.g) do
						explorationByAreaID[e.explorationID] = e;
						if e.coords and #e.coords > 0 then
							tinsert(coordinates, e.coords[1]);
						else
							--print("Missing Coordinates for areaID", e.explorationID);
						end
					end
				end
				break;
			end
		end
	end

	local id = t.mapID;
	local newExplorationObjects = {};
	local areaIDs = app.ExplorationDB[id];
	if not areaIDs then
		areaIDs = {};
		app.ExplorationDB[id] = areaIDs;
	end
	for _,pos in ipairs(coordinates) do
		local explored = C_MapExplorationInfo_GetExploredAreaIDsAtPosition(pos[3] or id, CreateVector2D(pos[1] / 100, pos[2] / 100));
		if explored then
			for _,areaID in ipairs(explored) do
				app.SetCollected(nil, "Exploration", areaID, true);
				local o = explorationByAreaID[areaID];
				if not o and not DiscoveredNewArea[areaID] and #app.SearchForField("explorationID", areaID) < 1 then
					DiscoveredNewArea[areaID] = true;
					o = app.CreateExploration(areaID);
					explorationByAreaID[areaID] = o;
					tinsert(newExplorationObjects, o);
					print("Found New AreaID:", id, t.text, areaID, o.text);
					tinsert(areaIDs, areaID);
				end
			end
		end
	end
	for _,pos in ipairs(ExplorationGrid) do
		local explored = C_MapExplorationInfo_GetExploredAreaIDsAtPosition(id, pos);
		if explored then
			for _,areaID in ipairs(explored) do
				app.SetCollected(nil, "Exploration", areaID, true);
				local o = explorationByAreaID[areaID];
				if not o and not DiscoveredNewArea[areaID] then
					DiscoveredNewArea[areaID] = true;
					o = app.CreateExploration(areaID);
					explorationByAreaID[areaID] = o;
					tinsert(newExplorationObjects, o);
					print("Found New AreaID:", id, t.text, areaID, o.text);
					tinsert(areaIDs, areaID);
					coroutine.yield();
				end
				local coords = app.ExplorationAreaPositionDB[areaID];
				if not coords then
					coords = {};
					app.ExplorationAreaPositionDB[areaID] = coords;
					local missing = AllTheThingsAD.ExplorationAreaPositionDB;
					if not missing then
						missing = {};
						--AllTheThingsAD.ExplorationAreaPositionDB = missing;
					end
					missing[areaID] = coords;
				end
				tinsert(coords, {pos.x * 100, pos.y * 100, id});
			end
		end
	end
	if #newExplorationObjects > 0 then
		if explorationHeader then
			if not explorationHeader.g then
				explorationHeader.g = {};
			end
			for i,o in ipairs(newExplorationObjects) do
				tinsert(explorationHeader.g, o);
				o.parent = explorationHeader;
			end
		else
			explorationHeader = app.CreateNPC(app.HeaderConstants.EXPLORATION, newExplorationObjects);
			explorationHeader.u = t.u;
			for i,o in ipairs(newExplorationObjects) do
				o.parent = explorationHeader;
				if not o.u then o.u = t.u; end
			end
			explorationHeader.parent = t;
			tinsert(t.g, 1, explorationHeader);
		end
	end
	if explorationHeader and explorationHeader.g then
		explorationHeader.SortType = "text";
	end
	rawset(t, "OnUpdate", nil);
	--app:StartATTCoroutine("Simplifying Exploration Data", simplifyExplorationData);
end;
app.SortExplorationDB = function()
	local e,t=ATTC.ExplorationDB,{};
	for mapID,areas in pairs(e) do
		local mapData = {};
		t[mapID] = mapData;
		for i,areaID in ipairs(areas) do
			tinsert(mapData, { areaID, C_Map_GetAreaInfo(areaID) });
		end
		app.Sort(mapData, function(a, b)
			return a[2] < b[2];
		end);
	end
	AllTheThingsAD.NamedExplorationDB = t;
end

-- Maps
local createMap = app.CreateClass("Map", "mapID", {
	["text"] = function(t)
		return t.isRaid and ("|c" .. app.Colors.Raid .. t.name .. "|r") or t.name;
	end,
	["name"] = function(t)
		return GetMapName(t.mapID);
	end,
	["icon"] = function(t)
		return app.asset("Category_Zones");
	end,
	["back"] = function(t)
		if t.isCurrentMap then
			return 1;
		end
	end,
	["artID"] = function(t)
		return C_Map_GetMapArtID(t.mapID);
	end,
	["lvl"] = function(t)
		return C_Map_GetMapLevels(t.mapID);
	end,
	["playerCoord"] = function(t)
		local position = C_Map_GetPlayerMapPosition(t.mapID, "player")
		if position then
			local x,y = position:GetXY()
			return { math_floor(x * 1000) / 10, math_floor(y * 1000) / 10, t.mapID };
		end
	end,
	["isCurrentMap"] = function(t)
		if CurrentMapID == t.mapID then
			return true;
		end
		local maps = t.maps;
		if maps and contains(maps, CurrentMapID) then
			return true;
		end
	end,
	["ignoreSourceLookup"] = function(t)
		return true;
	end,
},
"WithHeader", {
	["name"] = function(t)
		return app.NPCNameFromID[t.headerID] or GetMapName(t.mapID);
	end,
	["icon"] = function(t)
		return L.HEADER_ICONS[t.headerID] or app.asset("Category_Zones");
	end,
	["lore"] = function(t)
		return L.HEADER_LORE[t.headerID];
	end,
	["description"] = function(t)
		return L.HEADER_DESCRIPTIONS[t.headerID];
	end,
}, (function(t)
	local creatureID = t.creatureID or t.npcID;
	if creatureID and creatureID < 0 then
		t.headerID = creatureID;
		t.creatureID = nil;
		t.npcID = nil;
		return true;
	elseif t.headerID then
		return true;
	end
end));
app.CreateMap = app.IsRetail and createMap or function(id, t)
	local t = createMap(id, t);
	local artID = t.artID;
	if artID and t.g then
		local explorationByAreaID = {};
		local explorationHeader = nil;
		for i,o in ipairs(t.g) do
			if o.headerID == app.HeaderConstants.EXPLORATION then
				explorationHeader = o;
				if o.g then
					for j,e in ipairs(o.g) do
						local explorationID = e.explorationID;
						if explorationID then
							explorationByAreaID[explorationID] = e;
						end
					end
				end
				break;
			end
		end

		local newExplorationObjects = {};
		local areaIDs = app.ExplorationDB[id];
		if not areaIDs then
			areaIDs = {};
			app.ExplorationDB[id] = areaIDs;
			--AllTheThingsAD.ExplorationDB = ATTC.ExplorationDB;
		else
			for _,areaID in ipairs(areaIDs) do
				if not explorationByAreaID[areaID] then
					o = app.CreateExploration(areaID);
					explorationByAreaID[areaID] = o;
					tinsert(newExplorationObjects, o);
				end
			end
		end
		if #newExplorationObjects > 0 then
			if explorationHeader then
				if not explorationHeader.g then
					explorationHeader.g = {};
				end
				for i,o in ipairs(newExplorationObjects) do
					tinsert(explorationHeader.g, o);
					o.parent = explorationHeader;
				end
			else
				explorationHeader = app.CreateNPC(app.HeaderConstants.EXPLORATION, newExplorationObjects);
				explorationHeader.u = t.u;
				for i,o in ipairs(newExplorationObjects) do
					o.parent = explorationHeader;
					if not o.u then o.u = t.u; end
				end
				explorationHeader.parent = t;
				tinsert(t.g, 1, explorationHeader);
			end
		end
		if explorationHeader and explorationHeader.g then
			explorationHeader.SortType = "text";
		end
		if not rawget(t, "OnUpdate") then
			t.OnUpdate = onMapUpdate;
		end
	end
	return t;
end
app.CreateMapWithStyle = function(id)
	local mapObject = app.CreateMap(id, { progress = 0, total = 0 });
	for _,data in ipairs(app.SearchForField("mapID", id)) do
		if data.mapID and data.icon then
			mapObject.text = data.text;
            mapObject.icon = data.icon;
            mapObject.lvl = data.lvl;
            mapObject.lore = data.lore;
            mapObject.description = data.description;
			break;
		end
	end

	if not mapObject.text then
		local mapInfo = C_Map_GetMapInfo(id);
		if mapInfo then
			mapObject.text = mapInfo.name;
		end
	end
	return mapObject;
end

-- Instances
local instanceFields = {
	["text"] = function(t)
		return t.isRaid and ("|c" .. app.Colors.Raid .. t.name .. "|r") or t.name;
	end,
	["name"] = function(t)
		local mapID = t.mapID;
		return mapID and GetMapName(mapID);
	end,
	["icon"] = function(t)
		return app.asset("Category_Zones");
	end,
	["back"] = function(t)
		if t.isCurrentMap then
			return 1;
		end
	end,
	["mapID"] = function(t)
		return t.maps and t.maps[1];
	end,
	["lvl"] = function(t)
		local mapID = t.mapID;
		return mapID and C_Map_GetMapLevels(mapID);
	end,
	["locks"] = function(t)
		local savedInstanceID = t.savedInstanceID;
		if savedInstanceID then
			local lockouts = app.CurrentCharacter.Lockouts;
			local locks = lockouts[savedInstanceID];
			if locks then
				t.locks = locks;
				return locks;
			end
		end
	end,
	["saved"] = function(t)
		return t.locks;
	end,
	["isCurrentMap"] = function(t)
		if CurrentMapID == t.mapID then
			return true;
		end
		local maps = t.maps;
		if maps and contains(maps, CurrentMapID) then
			return true;
		end
	end,
	["isLockoutShared"] = app.ReturnFalse,
	["ignoreSourceLookup"] = function(t)
		return true;
	end,
};
local EJ_GetInstanceInfo = EJ_GetInstanceInfo;
if EJ_GetInstanceInfo then
	local cache = app.CreateCache("instanceID");
	local function CacheInfo(t, field)
		local _t, id = cache.GetCached(t);
		local name, lore, _, _, _, icon, _, link = EJ_GetInstanceInfo(id);
		_t.name = name;
		_t.lore = lore;
		_t.icon = icon;
		_t.link = link;
		if field then return _t[field]; end
	end
	instanceFields.icon = function(t) return cache.GetCachedField(t, "icon", CacheInfo); end;
	instanceFields.name = function(t) return cache.GetCachedField(t, "name", CacheInfo); end;
	instanceFields.lore = function(t) return cache.GetCachedField(t, "lore", CacheInfo); end;
	instanceFields.silentLink = function(t) return cache.GetCachedField(t, "link", CacheInfo); end;
end
app.CreateInstance = app.CreateClass("Instance", "instanceID", instanceFields,
"WithHeader", {
	["name"] = function(t)
		return app.NPCNameFromID[t.headerID] or instanceFields.name(t);
	end,
	["icon"] = function(t)
		return L.HEADER_ICONS[t.headerID] or app.asset("Category_Zones");
	end,
	["lore"] = function(t)
		return L.HEADER_LORE[t.headerID];
	end,
	["description"] = function(t)
		return L.HEADER_DESCRIPTIONS[t.headerID];
	end,
}, (function(t)
	local creatureID = t.creatureID;
	if creatureID and creatureID < 0 then
		t.headerID = creatureID;
		t.creatureID = nil;
		t.npcID = nil;
		return true;
	end
end));

if app.IsClassic then
-- Register for Map Exploration Events
app:RegisterEvent("MAP_EXPLORATION_UPDATED");
app:RegisterEvent("UI_INFO_MESSAGE");
app.events.MAP_EXPLORATION_UPDATED = function()
	app:StartATTCoroutine("RefreshExploration", function()
		while not CurrentMapID do
			coroutine.yield();
		end
		local pos = C_Map_GetPlayerMapPosition(CurrentMapID, "player");
		if pos then
			local px, py = pos:GetXY();
			px, py = px * 100, py * 100;
			local explored = C_MapExplorationInfo_GetExploredAreaIDsAtPosition(CurrentMapID, pos);
			if explored then
				local newArea = false;
				for _,areaID in ipairs(explored) do
					if not app.CurrentCharacter.Exploration[areaID] then
						app.SetCollected(nil, "Exploration", areaID, true);
						newArea = true;
						if not app.ExplorationAreaPositionDB[areaID] then
							local coord = {px, py, CurrentMapID};
							print("New Coordinate: ", C_Map_GetAreaInfo(areaID), coord);
							app.ExplorationAreaPositionDB[areaID] = { coord };
						end
					end
				end
				if newArea then app:RefreshDataQuietly("RefreshExploration", true); end
			end
		end
	end);
end
app.events.UI_INFO_MESSAGE = function(messageID)
	if messageID == 372 then
		app.events.MAP_EXPLORATION_UPDATED();
	end
end
app.AddEventHandler("OnRecalculate", app.events.MAP_EXPLORATION_UPDATED);
end