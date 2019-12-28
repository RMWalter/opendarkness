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
    buffer = ["\n"];
    writeln(frame);
    frame = "\n";
  }
}
  class Display_Battle
  {
    import battle;

    static struct C_Vital // Vital battle data of a given character
    {
      import std.conv : to;
    
      string* Name;
      int*[2] Health;
      int*[2] Stamina;
      int*[2] Mana;

      string statDisplay(int[2] stat)
      {
        GLYPH;
        OPEN;
        SEPARATOR;
        CLOSE;
        
        return GLYPH ~ OPEN ~ to!string(stat[0]) ~ SEPARATOR ~ to!string(stat[1]) ~ CLOSE;
      }

      @property string H_Val()
      {
        return " H[" ~ to!string(*Health[0]) ~ "/" ~ to!string(*Health[1]) ~ "]";
      }

      @property string S_Val()
      {
        return " S[" ~ to!string(*Stamina[0]) ~ "/" ~ to!string(*Stamina[1]) ~ "]";
      }

      @property string M_Val()
      {
        return " M[" ~ to!string(*Mana[0]) ~ "/" ~ to!string(*Mana[1]) ~ "]";
      }
    }

    C_Vital[] CS; //pointers to name, health, stamina and mana values for each hero.
    string*[] Enemy; //pointers to names of enemies
//    string* whos_turn; // tracks who's turn it currently is.
    
    string[] Battle_Menu = ["Attack", "Guard", "Magic", "Item", "Escape"]; // holds possible actions for character.

    string[] battle_log = ["battle start!"]; // keeps track of recent actions and their effects.

    this(Mob[] a, Mob[] b)
    {
      &Party_Hookup(a);
      &Enemy_Hookup(b);
    }

    void Party_Hookup(Mob[] group)
    {
      foreach(i; group)
      {
        this.CS ~= C_Vital(&i.name,
                      [&i.health[0]
                      &i.health[1]],
                      [&i.stamina[0]
                      &i.stamina[1]],
                      [&i.mana[0]
                      &i.mana[1]]);
      }
    }

    void Enemy_Hookup(Mob[] group)
    {
      foreach(i; group)
      {
        this.Enemy ~= &i.name;
      }
    }

    string Hero_Line(C_Vital guy)
    {
      import std.conv : to;
      
      string temp with guy = *name ~ H_Val ~ S_Val ~ M_Val;
      
      return temp;
    }

    string Enemy_Line(ref string* thug)
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
      buffer ~= temp;
    }

    void Battle_Buffer(out string[] buf)
    {
      buf ~= this.battle_log[$ - 5..$];

      Combatants();

//      Battle_Menu();

//      update();
    }

    void turn(string[] msg)
    {
      writeln(msg, "\n", msg.length);
      string temp = msg[0] ~ "'s turn";
      battle_log ~= temp;
    }

    void attacking(string[] msg)
    {
      string temp = msg[0] ~ " attacks " ~ msg[1];
      battle_log ~= temp;
    }

    void missed(string[] msg)
    {
      string temp = msg[0] ~ " missed";
      battle_log ~= temp;
    }

    void guarding(string[] msg)
    {
      string temp = msg[0] ~ " puts their guard up";
      battle_log ~= temp;
    }

    void damaged(string[] msg)
    {
      string temp = msg[0] ~ " takes " ~ msg[1] ~ " damage";
      battle_log ~= temp;
    }

    void killed(string[] msg)
    {
      string temp = msg[0] ~ " dies!";
      battle_log ~= temp;
    }

    void no_stamina(string[] msg)
    {
      battle_log ~= msg[0];
    }

    void delegate(string[])[string] action_message()
    {
     return ["turn" : &turn, "attack" : &attacking, "missed" : &missed, "guard" : &guarding, "damaged" : &damaged, "killed" : &killed, "no stamina" : &no_stamina];
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
      int p1 = (PAGE_SIZE * current_page) - PAGE_SIZE;
      auto p2 = p1 + PAGE_SIZE <= data.length - 1 ? p1 + PAGE_SIZE : data.length - 1;
      string[] slice = data[p1..p2];

      string output = "[" ~ to!string(current_page) ~ "/" ~ to!string(total_pages) ~ "]\n";
    
      ubyte i = 1;
      foreach(element; slice)
      {
        output ~= (to!string(i) ~ ": " ~ element ~ "\n");
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

