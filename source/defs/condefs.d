struct Modifier
{
  string attribute;
  int magnitude;
}
/*
struct Condition
{
  string name;
  ubyte duration;
  string[] special = JSONConvert!string(D["special"]);
  Modifier[] effect = set_effect();
  
  Modifier[] set_effects()
  {
    Modifier[] temp;

    foreach()
    {
      temp ~= Modifier(JSONConvert!string(key), JSONConvert!int(D[key]);
    }    
  }
}
*/

string conditions =
`
{
  "Poison" :
  {
    "health0" :
    {
      "duration" : "1",
      "strength" : "1",
      "effect" : "damage"
    }
  },
  "Paralysis" :
  {
    "special" : ["NO_TURN"]
  }
}
`;
