import std.json;

int statCalc (JSONValue a, int lv)
  {
    import std.random : uniform;
    import std.conv : to;
    import std.stdio : writeln;
    
    //writeln("converting to array");
    auto value = a.array;
    int[] var;
    
    foreach(number; value)
    {
      var ~= to!int(number.toString);
    }


    
    int mod = var[1] * lv;
    int rand = uniform(1, mod + 1);
//    writeln("var[1]: ",var[1]);
//    writeln("lv: ", lv);
//    writeln("mod: ", mod);
//    writeln("rand: ", rand);
    return var[0] + rand;
  }
