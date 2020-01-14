class FF_Battle
{
  /*
   Old school final fantasy turn based battle system. Inteded to be used with 
   FF_Mob mob classes and subclasses.
  */
  
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
    PHASE 1
    
    Handle condition calculations that happen before a characters turn. Things 
    like sleep, stun and confusion.
    */
    if(unit.stunned == false)
    {
      /*
      PHASE 2
      
      Handle user input and the resulting character actions.

      Input should be very modular so that it can handle a wide variety of 
      methods, like pure text input to keybopard event handling with GTK+ or 
      network input for multiplayer.
      
      Action's should be similarly modular, handled as a tree unique to each 
      character, though most will be teh same. Likewise this should also handle 
      AI behaviour which can vary from mob to mob.

      Ideally this should be handled with a single pair of functions that are 
      called here but should be modular in and of themselves to generically 
      handle all this different behaviour without changing anything here.

      Below is the placeholder function pair to be defined elsewhere.
      */

      action(userinput()); 

      /*
      :::NOTE TO SELF:::
      Need to create action tree class elsewhere to handle everything from 
      dialogue trees to what actions show up in a characters move list 
      during battles.
      */
    }
    /*
    PHASE 3
    
    Calculate conditions like poison that do damage or otherwise have their 
    effect at the end of a characters turn.
    */
  }

  void Phase_2(Mob unit)
  {
    import std.stdio : readln;
    import std.string : strip;

//    message["turn"]([unit.name]);

    Phase_3(unit);
  }
    /*
//    writeln(userinput);

    string action = to!string(userinput[0]);
    int selection = (to!int(userinput[1]) - 48) - 1;
//    writeln(typeid(selection), " : ", selection);

    switch(action)
    {
      case "a":
        if(selection < enemies.length && enemies[selection].health[0] > 0)
        {
          unit.Attack(enemies[selection]);//, message);
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
    */

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
