version(unittest) import fluent.asserts;
/*
import std.stdio;

struct Display
{

  string[] buffer;
  string frame = " ";

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
    
    Hero[]* Party;
    Mob[]* Enemy;
    string* whos_turn;

    string[] Hero_display;
    string[] Enemy_display;
    string[] Battle_Menu;

    string[] battle_log;

    string turn()
    {
      string msg = &whos_turn + "'s turn";
      return msg;
    }

    string attacking(Mob target)
    {
      string msg = &whos_turn + " attacks " + target.name;
      return msg;
    }
  
    string damaged(Mob Target)
    {
      string msg;

      return msg;
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
*/
