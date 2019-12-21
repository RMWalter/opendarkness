struct Battle
{

  import mob;
  import display;
  import std.random : uniform;  
  import std.stdio : writeln, readln;
  import std.conv : to;
  
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
          //disp.whos_turn = &actor;
          Phase_1(actor);
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
          actor.Attack(allies[uniform(0, allies.length)]);
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

  void Phase_1(Mob unit)
  {

    if(unit.stunned == false)
    {
      Phase_2(unit);
    }
    else
    {
      Phase_3(unit);
    }
  }

  void Phase_2(Mob unit)
  {
    import std.string : strip;
    //disp.turn();
  
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
          unit.Attack(enemies[selection - 1]);
        }
        else
        {
          writeln("Invalid Target");
          Phase_2(unit);
        }
        break;
      case "g":
        unit.Guard();
        break;
      case "i":
        unit.Item();
        break;
      case "m":
        unit.Magic();
        break;
      case "e":
        unit.Escape();
        break;
      default:
        break;
    }
    Phase_3(unit);
  }
  
  void Phase_3(Mob unit)
  {
  
  }

  void Graveyard(Mob entity)
  {
    Mob[] slice;
  
    if(entity.job == "Monster")
    {
      foreach(unit; enemies)
      {
        if(unit !is entity)
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
        if(unit !is entity)
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
