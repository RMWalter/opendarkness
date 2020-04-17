/*
For defining constrained battle systems for games where there is a stark 
difference between when a player is in or out of combat.

EXAMPLES

A turn based battle system where a party of heros fights one party of 
monsters lined up on each side of a field.

A chess like battle system where each character moves and acts independently based on the turn order and range to other units.

LEGEND

Time:

Turn Based - charactersd act one at a time.

Real - all actions for all character happen based on player input 
and a common field time.

Hybrid - characters generally act based on turn order or initiative 
bars, but players can provide inputs dynamically to affect results.

Field:
Static - characters are rooted in place and cannot move

Dynamic - characters can move freely around the stage. Range, manual 
aim and obstacles may affect actions.

*/

version(unittest) import fluent.asserts;

class TB_SF_Battle
{
  /*
   Turn Based Static Field Battle system

   Generates a static battlefield that contains one party of one or more
   heros versus one or more enemies. Each character takes turns acting, such 
   as attacking and using items.
  */
  
  import mob;
  import std.random : uniform;
  import std.conv : to;
  
  auto party;
  auto enemies;

  void initiative()
  {
    
  }
  
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
      character, though most will be the same. Likewise this should also handle 
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
