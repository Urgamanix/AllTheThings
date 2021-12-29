﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace ATT
{
    /// <summary>
    /// A collection of extensions used to simplify the data access requirements of a commonly formatted string/object dictionary.
    /// </summary>
    public static class Extensions
    {
        /// <summary>
        /// Convert the version number array to a version number.
        /// </summary>
        /// <typeparam name="T">The generic type.</typeparam>
        /// <param name="arr">The array.</param>
        /// <returns>The version number.</returns>
        public static long ConvertVersion<T>(this T[] arr)
        {
            if (arr == null || arr.Length < 1) return 0;
            try
            {
                return long.Parse(new StringBuilder().Append(Convert.ToString(arr[0]).Trim())
                    .Append((arr.Length >= 2 ? Convert.ToString(arr[1]).Trim() : "").PadLeft(3, '0'))
                    .Append((arr.Length >= 3 ? Convert.ToString(arr[2]).Trim() : "").PadLeft(3, '0'))
                    .Append((arr.Length >= 4 ? Convert.ToString(arr[1]).Trim() : "").PadLeft(6, '0')).ToString());
            }
            catch(Exception e)
            {
                Console.WriteLine(MiniJSON.Json.Serialize(arr));
                throw e;
            }
        }

        /// <summary>
        /// Convert the version number into a valid version string.
        /// </summary>
        /// <param name="version">The version number.</param>
        /// <returns>The version string.</returns>
        public static string ConvertToVersionString(this long version)
        {
            var s = version.ToString();
            var leadingZeros = new char[] { '0' };
            var len = s.Length;
            var major = s.Substring(0, len - 12).TrimStart(leadingZeros);
            if (major.Length == 0) major = "0";
            var minor = s.Substring(len - 12, 3).TrimStart(leadingZeros);
            if (minor.Length == 0) minor = "0";
            var patch = s.Substring(len - 9, 3).TrimStart(leadingZeros);
            if (patch.Length == 0) patch = "0";
            return $"{major}.{minor}.{patch}";
        }

        /// <summary>
        /// Get a boolean from the dictionary.
        /// </summary>
        /// <param name="dict">The dictionary.</param>
        /// <param name="key">The key.</param>
        /// <returns>The boolean.</returns>
        public static bool GetBoolean(this IDictionary<string, object> dict, string key)
        {
            return dict.TryGetValue(key, out object o) ? Convert.ToBoolean(o) : false;
        }

        /// <summary>
        /// Try to get a boolean from the dictionary.
        /// </summary>
        /// <param name="dict">The dictionary.</param>
        /// <param name="key">The key.</param>
        /// <param name="value">The variable to write to.</param>
        /// <returns>Whether or not a value was found for the key.</returns>
        public static bool TryGetValue(this IDictionary<string, object> dict, string key, out bool value)
        {
            if (dict.TryGetValue(key, out object o))
            {
                value = Convert.ToBoolean(o);
                return true;
            }
            value = false;
            return false;
        }

        /// <summary>
        /// Try to get a long from the dictionary.
        /// </summary>
        /// <param name="dict">The dictionary.</param>
        /// <param name="key">The key.</param>
        /// <param name="value">The variable to write to.</param>
        /// <returns>Whether or not a value was found for the key.</returns>
        public static bool TryGetValue(this IDictionary<string, object> dict, string key, out long value)
        {
            if (dict.TryGetValue(key, out object o))
            {
                value = Convert.ToInt64(o);
                return true;
            }
            value = 0;
            return false;
        }

        /// <summary>
        /// Try to get a decimal from the dictionary.
        /// </summary>
        /// <param name="dict">The dictionary.</param>
        /// <param name="key">The key.</param>
        /// <param name="value">The variable to write to.</param>
        /// <returns>Whether or not a value was found for the key.</returns>
        public static bool TryGetValue(this IDictionary<string, object> dict, string key, out decimal value)
        {
            if (dict.TryGetValue(key, out object o))
            {
                value = Convert.ToDecimal(o);
                return true;
            }
            value = 0;
            return false;
        }

        /// <summary>
        /// Get a string from the dictionary.
        /// </summary>
        /// <param name="dict">The dictionary.</param>
        /// <param name="key">The key.</param>
        /// <returns>The string.</returns>
        public static string GetString(this IDictionary<string, object> dict, string key)
        {
            return dict.TryGetValue(key, out object o) ? Convert.ToString(o) : null;
        }

        /// <summary>
        /// Try to get a string from the dictionary.
        /// </summary>
        /// <param name="dict">The dictionary.</param>
        /// <param name="key">The key.</param>
        /// <param name="value">The variable to write to.</param>
        /// <returns>Whether or not a value was found for the key.</returns>
        public static bool TryGetValue(this IDictionary<string, object> dict, string key, out string value)
        {
            if (dict.TryGetValue(key, out object o))
            {
                value = Convert.ToString(o);
                return true;
            }
            value = null;
            return false;
        }

        /// <summary>
        /// Get a list of objects from the dictionary.
        /// </summary>
        /// <param name="dict">The dictionary.</param>
        /// <param name="key">The key.</param>
        /// <returns>The list.</returns>
        public static List<object> GetList(this IDictionary<string, object> dict, string key)
        {
            return dict.TryGetValue(key, out object o) ? o as List<object> : null;
        }

        /// <summary>
        /// Try to get a list of objects from the dictionary.
        /// </summary>
        /// <param name="dict">The dictionary.</param>
        /// <param name="key">The key.</param>
        /// <param name="value">The variable to write to.</param>
        /// <returns>Whether or not a value was found for the key.</returns>
        public static bool TryGetValue(this IDictionary<string, object> dict, string key, out List<object> value)
        {
            if (dict.TryGetValue(key, out object o) && o is List<object> value2)
            {
                value = value2;
                return true;
            }
            value = null;
            return false;
        }

        /// <summary>
        /// Try to get a strongly-typed list of objects from the dictionary.
        /// </summary>
        /// <param name="dict">The dictionary.</param>
        /// <param name="key">The key.</param>
        /// <param name="value">The variable to write to.</param>
        /// <returns>Whether or not a value was found for the key.</returns>
        public static bool TryGetValue<T>(this IDictionary<string, object> dict, string key, out List<T> value)
        {
            if (dict.TryGetValue(key, out object o) && o is List<T> value2)
            {
                value = value2;
                return true;
            }
            value = null;
            return false;
        }

        /// <summary>
        /// Get a dictionary from the dictionary.
        /// </summary>
        /// <param name="dict">The dictionary.</param>
        /// <param name="key">The key.</param>
        /// <returns>The dictionary.</returns>
        public static Dictionary<string, object> GetDictionary(this IDictionary<string, object> dict, string key)
        {
            return dict.TryGetValue(key, out object o) ? o as Dictionary<string, object> : null;
        }

        /// <summary>
        /// Returns if the dictionary contains any of the provided keys
        /// </summary>
        /// <typeparam name="TKey"></typeparam>
        /// <typeparam name="TValue"></typeparam>
        /// <param name="dict"></param>
        /// <param name="keys"></param>
        /// <returns></returns>
        public static bool ContainsAnyKey<TKey, TValue>(this IDictionary<TKey, TValue> dict, IEnumerable<TKey> keys)
        {
            if (keys == null || dict == null || !keys.Any())
                return false;

            foreach (TKey key in keys)
                if (dict.ContainsKey(key))
                    return true;

            return false;
        }

        /// <summary>
        /// Performs the expected .Contains logic for the provided object on a list containing objects,
        /// but attempts to verify matching objects even when there are slightly different underlying Types
        /// and passes-out the proper Typed-value if it is found in the List
        /// </summary>
        /// <param name="list"></param>
        /// <param name="value"></param>
        /// <returns></returns>
        public static bool TrySmartContains(this List<object> list, object value, out object typedValue)
        {
            // if the types are already matching
            if (list.Contains(value))
            {
                typedValue = value;
                return true;
            }

            // otherwise attempt conversions
            // float
            try
            {
                Type listType = null;
                foreach (object item in list)
                {
                    try
                    {
                        typedValue = Convert.ChangeType(value, listType ?? (listType = item.GetType()));
                        if (Equals(item, typedValue))
                            return true;
                    }
                    // either all objects in the list convert, or none do
                    catch { break; }
                }
            }
            catch { }

            typedValue = null;
            return false;
        }

        /// <summary>
        /// Try to get a dictionary from the dictionary.
        /// </summary>
        /// <param name="dict">The dictionary.</param>
        /// <param name="key">The key.</param>
        /// <param name="value">The variable to write to.</param>
        /// <returns>Whether or not a value was found for the key.</returns>
        public static bool TryGetValue(this IDictionary<string, object> dict, string key, out Dictionary<string, object> value)
        {
            if (dict.TryGetValue(key, out object o) && o is Dictionary<string, object> value2)
            {
                value = value2;
                return true;
            }
            value = null;
            return false;
        }

        // https://stackoverflow.com/questions/1749966/c-sharp-how-to-determine-whether-a-type-is-a-number
        private static readonly HashSet<Type> NumericTypes = new HashSet<Type>
        {
            typeof(int),  typeof(double),  typeof(decimal),
            typeof(long), typeof(short),   typeof(sbyte),
            typeof(byte), typeof(ulong),   typeof(ushort),
            typeof(uint), typeof(float)
        };

        public static bool IsNumeric(this Type myType)
        {
            return NumericTypes.Contains(Nullable.GetUnderlyingType(myType) ?? myType);
        }

        /// <summary>
        /// Returns whether the sequence matches the content of another sequence regardless of ordering<para/>
        /// NOTE: Not well-optimized for long sequences
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="sequence"></param>
        /// <param name="sequence"></param>
        /// <returns></returns>
        public static bool Matches<T>(this IEnumerable<T> x, IEnumerable<T> y)
        {
            // check counts
            int xCount = x?.Count() ?? -1;
            int yCount = y?.Count() ?? -1;
            if (xCount != yCount)
            {
                return false;
            }
            // matching count is only valid if both are null
            else if (xCount == -1)
            {
                return true;
            }

            // check elements regardless of ordering
            List<T> copy = y.ToList();
            foreach (T item in x)
            {
                if (!copy.Remove(item))
                    return false;
            }
            return true;
        }
    }
}
