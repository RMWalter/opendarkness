import std.json;
import std.conv : to;

auto JSONConvert(ref JSONValue value)
{
  switch(value.type)
  {
    case "array" :
      value = value.array;
      auto temp;
      
      switch(value[0].type)
      {
        case "integer" :
          foreach(i; value)
          {
            temp ~= to!int(i);
          }
          return temp;
          break;
        case "uinteger" :
          foreach(i; value)
          {
            temp ~= to!uint(i);
          }
          return temp;
          break;
        case "string" :
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
  
  JSONConvert(parsed["A"]).typeid.Should.Equal("int").Because("A is an integer");
  JSONConvert(parsed["B"]).typeid.Should.Equal("string").Because("B is a string");
  JSONConvert(parsed["C"]).typeid.Should.Equal("int[]").Because("C is an array of integers");
}
