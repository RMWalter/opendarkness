import std.json;

auto JSONConvert(JSONvalue value)
{
  switch(value.type)
  {
    case "array" :
      value = value.array;
      break;
    case "integer" :
      value = value.integer;
      break;
    case "uinteger" :
      value = value.uinteger;
      break;
    case "string" :
      value = value.string;
      break;
    default:
      break;
  }
}
