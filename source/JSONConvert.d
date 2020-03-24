version(unittest) import fluent.asserts;
import std.json;
import omni;

omni JSONConvert(ref JSONValue value)
{
  import std.conv : to;

  static omni list(ref JSONValue value)
  {
    value = value.array;      
    switch(to!string(value[0].type))
    {
      case "integer" :
        int[] sub;
        for(int i; i < value.array.length; i++)
        {
          sub ~= to!int(value[i].integer);
        }
      omni temp = {_INTA : sub};
      return temp;
      break;
      case "uinteger" :
        uint[] sub;
        for(int i; i < value.array.length; i++)
        {
          sub ~= to!uint(value[i].uinteger);
        }
        omni temp = {_UINTA : sub};
        return temp;
        break;
      case "string" :
        string[] sub;
        for(int i; i < value.array.length; i++)
        {
          sub ~= to!string(value[i].str);
        }
        omni temp = {_STRINGA : sub};
        return temp;
        break;
      default:
        omni temp;
        return temp;
        break;
    }
  }

  static omni single(ref JSONValue value)
  {
    switch(to!string(value.type))
    {
      case "integer" :
        value = value.integer;
        omni temp = {_INT : to!int(value.integer)};
        return temp;
        break;
      case "uinteger" :
        value = value.uinteger;
        omni temp = {_UINT : to!uint(value.uinteger)};
        return temp;
        break;
      case "string" :
        value = value.str;
        omni temp = {_STRING : to!string(value)};
        return temp;
        break;
      default:
        omni temp;
        return temp;
        break;
    }
  }
  
  if(to!string(value.type) == "array")
  {
    return list(value);
  }
  else
  {
    return single(value);
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
