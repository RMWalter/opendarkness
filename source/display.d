version(unittest) import fluent.asserts;

struct Display
{
  import std.stdio;

  string[] buffer = ["\n"];
  string frame = "\n";

  void update()
  {
    foreach(i; buffer)
    {
      frame ~= i;
      frame ~= "\n";
    }
    writeln(frame);
  }
  
  struct Display_Battle
  {
    import mob;

    string*[] Names = [];
    int*[][] Stats = [[]]; //pointers to name, health, stamina and mana values for each hero
    string*[] Enemy; //pointers to names of enemies
//    string* whos_turn; // tracks who's turn it currently is
    
    string[] Battle_Menu = ["Attack", "Guard", "Magic", "Item", "Escape"]; // holds possible actions for character

    string[] battle_log = ["battle start!"]; // keeps track of recent actions and their effects

    void Party_Hookup(Mob[] group)
    {    
      Names.length, Stats.length = group.length;

      ubyte x = 0;

      foreach(i; group)
      {
        Names ~= &i.name;
        Stats[x] ~= &i.health[0];
        Stats[x] ~= &i.health[1];
        Stats[x] ~= &i.stamina[0];
        Stats[x] ~= &i.stamina[1];
        Stats[x] ~= &i.mana[0];
        Stats[x] ~= &i.mana[1];
        x++;
      }
    }

    void Enemy_Hookup(Mob[] group)
    {
      Enemy.length = group.length;
      
      foreach(i; group)
      {
        Enemy ~= &i.name;
      }
    }

    string Hero_Line(string* name, int*[] stats)
    {
      import std.conv : to;
      
      string temp = *name ~ " H[" ~ to!string(*stats[0]) ~ "/" ~ to!string(*stats[1]) ~ "] S[" ~ to!string(*stats[2]) ~ "/" ~ to!string(*stats[3]) ~ "] M[" ~ to!string(*stats[4]) ~ "/" ~ to!string(*stats[5]) ~ "]";
      
      return temp;
    }

    string Enemy_Line(string* thug)
    {
      string temp = *thug;

      return temp;
    }

    void Combatants()
    {
      string temp;
      
      if(Names.length == Enemy.length)
      {
        for(ubyte i; i < Names.length; i++)
        {
          temp ~= Hero_Line(Names[i], Stats[i]) ~ " " ~ Enemy_Line(Enemy[i]);
        }  
      }
      else if(Enemy.length > Names.length)
      {
        
        for(ubyte i; i < Enemy.length; i++)
        {
          if(i < Names.length)
          {
            temp ~= Hero_Line(Names[i], Stats[i]) ~ " " ~ Enemy_Line(Enemy[i]); 
          }
          temp ~= Enemy_Line(Enemy[i]);
        }
      }
      else
      {

        for(ubyte i; i < Names.length; i++)
        {
          if(i < Enemy.length)
          {
            temp ~= Hero_Line(Names[i], Stats[i]) ~ " " ~ Enemy_Line(Enemy[i]);
          }
          temp ~= Hero_Line(Names[i], Stats[i]);
        }
      }
      Display.buffer ~ this.temp;
    }

    void Battle_Buffer()
    {
      Display.buffer ~= this.battle_log[$ - 5..$];

      Combatants();

//      Battle_Menu();

//      update();
    }
    void function(string[])[string] action_message = ["turn" : &turn, "attack" : &attacking, "missed" : &missed, "guard" : &guarding, "damaged" : &damaged, "killed" : &killed];

    void turn(string[] msg)
    {
      string temp = msg[0] + "'s turn";
      battle_log ~= temp;
    }

    void attacking(string[] msg)
    {
      string temp = msg[0] + " attacks " + msg[1];
      battle_log ~= temp;
    }

    void missed(string[] msg)
    {
      string temp = msg[0] + " missed";
      battle_log ~= temp;
    }

    void guarding(string[] msg)
    {
      string temp = msg[0] + " puts their guard up";
      battle_log ~= temp;
    }

    void damaged(string[] msg)
    {
      string temp = msg[0] + " takes " + msg[1] + " damage";
      battle_log ~= temp;
    }

    void killed(string[] msg)
    {
      string temp = msg[0] + " dies!";
      battle_log ~= temp;
    }
  }
  
  struct Manifest
  {
    import std.math;
    import std.conv : to;

    string[] data;
    
    ubyte PAGE_SIZE = 5;
    ubyte current_page = 1;
    ubyte total_pages;// = round(data.length / PAGE_SIZE);

    string list()
    {  
      ubyte p1 = (PAGE_SIZE * current_page) - PAGE_SIZE;
      ubyte p2 = p1 + PAGE_SIZE <= data.length - 1 ? p1 + PAGE_SIZE : data.length - 1;
      string slice = data[p1..p2];

      string output = "[" + to!string(current_page) + "/" + to!string(total_pages) + "]\n";
    
      ubyte i = 1;
      foreach(element; slice)
      {
        output ~= (to!string(i) + ": " + element + "\n");
      }
      return output;
    }
  }
}    

unittest
{
  string[] data = ["a","b","c","d","e"];

  list().should.equal("[1/1]\n1: a\n2: b\n3: c\n4: d\n5:e\n").because("items should be ordered");
}

unittest
{
  string[] data = ["a","b","c","d","e","aa","bb","cc","dd","ee","aaa","bbb","ccc","ddd","eee","aaaa","bbbb","cccc","dddd","eeee"];

  list().should.equal("[1/4]\n1: a\n2: b\n3: c\n4: d\n5:e\n").because("items should be ordered"); 
}

