import std.stdio;
import std.json;

struct Mob
{
  import mobdefs;
  import equipment;
  
  string job;
  string name;
  int level;
  
  int Pattack;
  int Mattack;
  int Pdefense;
  int Mdefense;
  int speed;
  int agility;
  
  int[2] health;
  int[2] stamina;
  int[2] mana;

  string MainHand;
  string OffHand;
  string Body;
  string Head;
  string Misc;

  int exp;
  int NEXTexp;

}

Mob createMob(JSONValue master, string entry, int lvl)
{
  import std.stdio : writeln;
  import JSONConvert;
  
//  writeln("starting createMob, importing");

//  writeln("importing dict");
//  writeln(master[entry].toString);
  auto dict = master[entry];
//  writeln("dict imported");
  
//  writeln("aliasing statCalc");
  alias C = statCalc;
//  writeln("statCalc aliased");
  
//  writeln("creating tempMob");
  Mob tempMob;
//  writeln("tempMob created");

//  writeln("assigning job");
  tempMob.job = dict["job"].str;
//  writeln("Job assigned");

//  writeln("assigning name");
  tempMob.name = dict["name"].str;
//  writeln("name assigned");
  
//  writeln("assigning level");
  tempMob.level = lvl;
//  writeln("level assigned");

//  writeln("calcluating Pattack");
  tempMob.Pattack = C(dict["Pattack"], lvl);
//  writeln("Done");

//  writeln("calcluating Mattack");
  tempMob.Mattack = C(dict["Mattack"], lvl);
//  writeln("Done");

//  writeln("calcluating Pdefense");
  tempMob.Pdefense = C(dict["Pdefense"], lvl);
//  writeln("Done");

//  writeln("calcluating Mdefense");
  tempMob.Mdefense = C(dict["Mdefense"], lvl);
//  writeln("Done");

//  writeln("calcluating speed");
  tempMob.speed = C(dict["speed"], lvl);
//  writeln("Done");

//  writeln("calcluating agility");
  tempMob.agility = C(dict["agility"], lvl);
//  writeln("Done");

//  writeln("calcluating health");  
  tempMob.health = C(dict["health"], lvl);
//  writeln("Done");

//  writeln("calcluating stamina");
  tempMob.stamina = C(dict["stamina"], lvl);
//  writeln("Done");

//  writeln("calcluating mana"); 
  tempMob.mana = C(dict["mana"], lvl);
//  writeln("Done");


  tempMob.MainHand = dict["MainHand"].toString;
  tempMob.OffHand = dict["OffHand"].toString;
  tempMob.Body = dict["Body"].toString;
  tempMob.Head = dict["Head"].toString;
  tempMob.Misc = dict["Misc"].toString;

  tempMob.exp = 0;
  tempMob.NEXTexp = 0;
  
  return tempMob;
}
