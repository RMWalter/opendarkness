import std.stdio;
import std.json;
import anchor;
import battle;
import mob;
import mobdefs;
import herodefs;

void testbattle()
{
//  writeln("starting program");
 
//  writeln("assigning mobs bestiary");
  JSONValue mobs = parseJSON(bestiary);
//  writeln("mobs assigned");


//  writeln("assigning heros academy");
  JSONValue heros = parseJSON(academy);
//  writeln("heros assigned");


//  writeln("creating test mobs");
  Mob[4] bad = 
  [
  new Mob(mobs, "Goblin", 1),
  new Mob(mobs, "Goblin", 1),
  new Mob(mobs, "Goblin", 1),
  new Mob(mobs, "Goblin", 1)
  ];
//  writeln("test mobs created");

//  writeln("creating test heros");
  Mob[4] good = 
  [
    new Hero(heros, "Fighter", "Bob", 1),
    new Hero(heros, "Fighter", "Jim", 1),
    new Hero(heros, "Fighter", "Hank", 1),
    new Hero(heros, "Fighter", "Mary", 1)
  ];
//  writeln("test heros created");

  Battle test = Battle(good, bad);
//  writeln(test.allies);
//  writeln(test.enemies);

  test.round();
}

void main()
{
  testbattle();
}
