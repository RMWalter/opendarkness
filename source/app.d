import std.stdio;
//import anchor;
import battle;
import mob;
import mobdefs;
import std.json;

void testbattle()
{
//  writeln("starting program");
 
//  writeln("assigning mobs bestiary");
  JSONValue mobs = parseJSON(bestiary);
//  writeln("mobs assigned");

//  writeln("creating test mob");
  Mob[4] bad = createMob(mobs, "Goblin", 1);
//  writeln("test mob created");

  Mob[4] good = createMob(mobs, "Human", 1);
  good[0].name = "Bob";
  good[1].name = "Jim";
  good[2].name = "Hank";
  good[3].name = "Mary";

  Battle test = Battle(good, bad);
//  writeln(test.allies);
//  writeln(test.enemies);

  test.round();
}

void main()
{
  testbattle();
}
