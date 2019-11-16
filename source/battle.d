struct Battle
{

  import mob;
  import std.random : uniform;  
  import std.stdio : writeln, readln;
  import std.conv: to;
  
  Mob[] allies;
  Mob[] enemies;

  void round()
  {
    while(allies.length > 0 && enemies.length > 0)
    {
    
      foreach(actor; allies)
      {
        if(enemies.length > 0)
        {
          turn(actor);
        }
        else
        {
          break;
        }
      }

      

      foreach(actor; enemies)
      {
        if(allies.length > 0)
        {
          attack(actor, allies[uniform(0, allies.length)]);
        }
        else
        {
          break;
        }
      }
    }

    if(allies.length > 0)
    {
      writeln("Win!");
    }
    else
    {
      writeln("Lose!");
    }
  }

  void turn(Mob unit)
  {
    import std.string : strip;
    writeln(unit.name, "'s turn", "\n");
  
    string userinput = readln();

//    writeln(userinput);

    string action = to!string(userinput[0]);
    int selection = to!int(userinput[1]) - 48;
//    writeln(typeid(selection), " : ", selection);

    switch(action)
    {
      case "a":      
        if(selection - 1 < enemies.length && enemies[selection - 1].health[0] > 0)
        {
          attack(unit, enemies[selection - 1]);
        }
        else
        {
          writeln("Invalid Target");
          turn(unit);
        }
        break;
      case "g":
        guard();
        break;
      case "i":
        item();
        break;
      case "m":
        magic();
        break;
      case "e":
        escape();
        break;
      default:
        break;
    }
  }  
  void attack(ref Mob attacker, ref Mob defender)
  {
    writeln(attacker.name, " Attacks ", defender.name);

    if(uniform(1, attacker.agility) > uniform(0, defender.agility))
    {
      int change = uniform(1, attacker.Pattack + 1) - uniform(0, defender.Pdefense + 1);
      change = change >= 0 ? change : 0;
      defender.health[0] -= change;

      writeln(defender.name, " takes ", change, " damage!", "\n" );
      if(defender.health[0] <= 0)
      {
        writeln(defender.name, " dies!", "\n");
        Graveyard(defender);
      }
    }
    else
    {
      writeln(attacker.name, " misses", "\n");
    }
  }

  void guard()
  {
    writeln("guard");
  }

  void item()
  {
    writeln("item");
  }

  void magic()
  {
    writeln("magic");
  }

  void escape()
  {
    writeln("escape");
  }

  void Graveyard(ref Mob entity)
  {
    Mob[] slice;
  
    if(entity.job == "Monster")
    {
      foreach(unit; enemies)
      {
        if(unit.health[0] <= 0)
        {
          slice ~= unit;
        }
      }
  
      enemies = slice;
//      writeln(slice.length, "\n", enemies.length);
    }
    else
    {
      foreach(unit; allies)
      {
        if(unit.health[0] <= 0)
        {
          slice ~= unit;
        }
      }
      allies = slice;
      
//      writeln(slice.length, "\n", allies.length);
    }
  }
}



/*
  void Calculate_Initiative()
  {

    foreach(Mob unit; OrderOfAction)
    {
      unit.Initiative = uniform(0, unit.speed);      
    }

    for(int index; index < OrderOfAction.length - 2; index++)
    {
      Mob A = OrderOfAction[index];
      Mob B = OrderOfAction[index + 1];
            
      if(A.Initiative > B.Initiative)
      {
        OrderOfAction[index] = B;
        OrderOfAction[index + 1] = A;
      }
    }
  }
*/
