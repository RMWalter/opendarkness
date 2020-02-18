version(unittest) import fluent.asserts;
import std.json;

union USON 
{
  ubyte[] UBYTEA;
  int INT;
  int[] INTA;
  uint UINT;
  uint[] UINTA;
  string STRING;
  string[] STRINGA;
}

USON JSONConvert(inout ref JSONValue value)
{
  import std.conv : to;

  USON temp;
  switch(to!string(value.type))
  {
    case "array" :
    value = value.array;      
      switch(to!string(value[0].type))
      {
        case "integer" :
          foreach(i; value)
          {
            temp.INTA ~= to!int(i);
          }
         return temp;
         break;
        case "uinteger" :
          foreach(i; value)
          {
            temp.UINTA ~= to!uint(i);
          }
          return temp;
          break;
        case "string" :
          foreach(i; value)
          {
            temp.STRINGA ~= to!string(i);
          }
          return temp;
          break;
        default:
          break;
      }
      break;
    case "integer" :
      value = value.integer;
      temp.INT = to!int(value);
      return temp;
      break;
    case "uinteger" :
      value = value.uinteger;
      temp.UINT = to!uint(value);
      return temp;
      break;
    case "string" :
      value = value.string;
      temp.STRING = to!string(value);
      return temp;
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
