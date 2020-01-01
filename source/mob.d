import std.stdio;
import std.json;

abstract class Mob
{
  import std.random : uniform;

  string name;

  this()
  {
    this.name = "NULL";
  }
}


class FF_Mob : Mob
{
  // old school final fantasy stye mob, has same types of stats and abilities, intended for use in similar styled games.
  
  string job; // the mob's class, determines stats, AI behaviour if applicable, and abilities. Example: fighter, Mage, Healer.

  this()
  {
    super.this();
    this.job = "NULL";
  }
}
  ubyte agility; // governs accuracy and evasiveness
  ubyte speed; // how physically fast a mob can act , move, and similar.

  ubyte Pattack; // Physical damage
  ubyte Mattack; // Magic damage
  ubyte Pdefense;// Physical defense
  ubyte Mdefense;// Magic defense
  
  ushort[2] health;
  ushort[2] stamina;
  ushort[2] mana;

  bool guarding;
  bool poisoned;
  bool paralysed;
  bool sleeping;
  bool stunned;
  bool confused;
  bool burning;
      
  this(inout ref JSONValue master, string entry, int lvl)
  {
    alias C = statCalc;
    auto D = master[entry];

    this.name = D["name"].str;
    this.job = D["job"].str;

    this.agility = C(D["agility"], lvl);
    this.speed = C(D["speed"], lvl);

    this.Pattack = C(D["Pattack"], lvl);
    this.Mattack = C(D["Mattack"], lvl);
    this.Pdefense = C(D["Pdefense"], lvl);
    this.Mdefense = C(D["Mdefense"], lvl);
       
    this.health = C(D["health"], lvl);
    this.stamina = C(D["stamina"], lvl);
    this.mana = C(D["mana"], lvl);
  }

//  alias DP = void delegate(string[])[string];

  uint stat_roll(ref uint stat)
  {
    return uniform(0, stat);
  }
  
  void CalcFlags(string id)
  {
    switch(id)
    {
      case "COMBAT" :
        break;
      case "CONDITION" :
        break;
      case "BUFF" :
        break;
      case "DEBUFF" :
        break;
      default :
        break;
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

class OD_Mob: Mob
{

  ubyte[3] mind;
  ubyte[3] spirit;
  ubyte[3] perception;
  ubyte[3] luck;
    
  ubyte[3] strength;
  ubyte[3] endurance;


  this()
  {
    super.this()
    
    this.mind = 1;
    this.spirit = 1;
    this.perception = 1;
    this.luck = 1;

    this,strength = 1;
    this.endurance = 1;

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

  void LevelUp()
  {

  }

  void GainXP()
  {

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
