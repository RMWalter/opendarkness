import std.stdio;
import std.json;

class Mob
{
  string name;
  string job;

  int Pattack;
  int Mattack;
  int Pdefense;
  int Mdefense;
  int speed;
  int agility;
  
  int[2] health;
  int[2] stamina;
  int[2] mana;

  string[] COMBAT_FLAGS;
  
  this(ref JSONValue master, string entry, int lvl)
  {
    auto dict = master[entry];
    alias C = statCalc;

    this.name = dict["name"].str;
    this.job = dict["job"].str;
      
    this.Pattack = C(dict["Pattack"], lvl);
    this.Mattack = C(dict["Mattack"], lvl);
    this.Pdefense = C(dict["Pdefense"], lvl);
    this.Mdefense = C(dict["Mdefense"], lvl);
    this.speed = C(dict["speed"], lvl);
    this.agility = C(dict["agility"], lvl);
    
    this.health = C(dict["health"], lvl);
    this.stamina = C(dict["stamina"], lvl);
    this.mana = C(dict["mana"], lvl);

  }

  void CalcFlags()
  {
    foreach(flag; COMBAT_FLAGS)
    {
      FLAGS[flag]();
    }
  }

  int statCalc (ref JSONValue a, int lv)
  {
    import std.random : uniform;
    import std.conv : to;
    import std.stdio : writeln;
    
    //writeln("converting to array");
    auto value = a.array;
    int[] var;
    
    foreach(number; value)
    {
      var ~= to!int(number.toString);
    }
    
    int mod = var[1] * lv;
    int rand = uniform(1, mod + 1);
  //    writeln("var[1]: ",var[1]);
  //    writeln("lv: ", lv);
  //    writeln("mod: ", mod);
  //    writeln("rand: ", rand);
    return var[0] + rand;
  }
}

class Hero : Mob
{
  string job;
  int level;

  string MainHand;
  string OffHand;
  string Body;
  string Head;
  string[2] Misc;

  int exp;
  int NEXTexp;

  this(ref JSONValue master, string entry, string name, int lvl)
  {
    super(master, entry, lvl);

    auto dict = master[entry];

    this.name = name;
    
    this.job = dict["job"].str;
    this.level = lvl;

    this.MainHand = dict["MainHand"].str;
    this.OffHand = dict["OffHand"].str;
    this.Body = dict["Body"].str;
    this.Head = dict["Head"].str;
    this.Misc[0] = dict["Misc"][0].str;
    this.Misc[1] = dict["Misc"][1].str;
    
    this.exp = 0;
    this.NEXTexp = lvl * 1000;
  }  
}

/*
struct Mob
{  
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

Mob createMob(ref JSONValue master, string entry, int lvl)
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
*/
