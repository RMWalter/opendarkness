version(unittest) import fluent.asserts;
import std.json;
import std.conv : to;

auto JSONConvert(JSONValue value)
{
  switch(to!string(value.type))
  {
    case "array" :
      value = value.array;
      
      switch(value[0].type)
      {
        case "integer" :
          int[] temp;

          foreach(i; value)
          {
            temp ~= to!int(i);
          }
         return temp;
         break;
        case "uinteger" :
          uint[] temp;
          foreach(i; value)
          {
            temp ~= to!uint(i);
          }
          return temp;
          break;
        case "string" :
          string[] temp;
          foreach(i; value)
          {
            temp ~= to!string(i);
          }
          return temp;
          break;
        default:
          break;
      }
      break;
    case "integer" :
      value = value.integer;
      return to!int(value);
      break;
    case "uinteger" :
      value = value.uinteger;
      return to!uint(value);
      break;
    case "string" :
      value = value.string;
      return to!string(value);
      break;
    default:
      break;
  }
}

unittest
{
  string test = `"A" : 1, "B" : "1", "C" : [1, 2]`;
  auto parsed = parseJSON(test);
  
  typeid(JSONConvert(parsed["A"])).Should.Equal("int").Because("A is an integer");
  typeid(JSONConvert(parsed["B"])).Should.Equal("string").Because("B is a string");
  typeid(JSONConvert(parsed["C"])).Should.Equal("int[]").Because("C is an array of integers");
}
