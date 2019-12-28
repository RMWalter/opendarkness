struct Battle
{

  import mob;
  import std.random : uniform;  
  import std.stdio : writeln, readln;
  import std.conv : to;
  
  Mob[] allies;
  Mob[] enemies;

//  alias DP = void delegate(string[])[string];

  void round()
  {
    /*
      includes an associative array of function pointers to pass to each action to      output custom data for the display struct to output custom messages with.
    */
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
    import std.stdio : readln;
    import std.string : strip;

//    message["turn"]([unit.name]);
  
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
          unit.Attack(enemies[selection - 1]);//, message);
        }
        else
        {
          writeln("Invalid Target");
          Phase_2(unit);//, message);
        }
        break;
      case "g":
        unit.Guard();//message);
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
