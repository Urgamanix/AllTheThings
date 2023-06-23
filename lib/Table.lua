
-- Table Lib
local _, app = ...;

-- Dependencies

-- Concepts:
-- Encapsulates the functionality concerning consistent and complex operations on Lua Tables

-- Global locals
local ipairs, pairs, tinsert, select, table_concat
	= ipairs, pairs, tinsert, select, table.concat;

-- App locals

-- Module locals

app.contains = function(arr, value)
	for _,value2 in ipairs(arr) do
		if value2 == value then return true; end
	end
end
app.containsAny = function(arr, arr2)
	for _,v in ipairs(arr) do
		for _,w in ipairs(arr2) do
			if v == w then return true; end
		end
	end
end
app.containsValue = function(dict, value)
	for _,value2 in pairs(dict) do
		if value2 == value then return true; end
	end
end
app.indexOf = function(arr, value)
	for i,value2 in ipairs(arr) do
		if value2 == value then return i; end
	end
end
-- Performs table.concat(tbl, sep, i, j) on the given table, but uses the specified field of table values if provided,
-- with a default fallback value if the field does not exist on the table entry
app.TableConcat = function(tbl, field, def, sep, i, j)
	if tbl then
		if field then
			local tblvals = {};
			for _,val in ipairs(tbl) do
				tinsert(tblvals, val[field] or def);
			end
			return table_concat(tblvals, sep, i, j);
		else
			return table_concat(tbl, sep, i, j);
		end
	end
	return "";
end
-- Allows efficiently appending the content of multiple arrays (in sequence) onto the end of the provided array, or new empty array
app.ArrayAppend = function(a1, ...)
	local arrs = select("#", ...);
	if arrs > 0 then
		a1 = a1 or {};
		local i, a = #a1 + 1;
		for n=1,arrs do
			a = select(n, ...);
			if a then
				for ai=1,#a do
					a1[i] = a[ai];
					i = i + 1;
				end
			end
		end
	end
	return a1;
end
-- Allows for returning a reversed array. Will do nothing for un-ordered tables or tables with a single entry
app.ReverseOrder = function(a)
	if a[1] and a[2] then
		local b, n, j = {}, #a, 1;
		for i=n,1,-1 do
			b[j] = a[i];
			j = j + 1;
		end
		return b;
	end
	return a;
end