import std.stdio;
import std.json;

abstract class Mob
{
  import std.random : uniform;

  string name;

  uint[] Attribute;
  
  // Stats and skills in subclassess will be properties associated with values in the Attribute array. That way it's easier to create however many stats you want, call them whatever you want, and have them interact however you want.

  this()
  {
    this.name = "Name";
    // this.Attribute = Attr;
  }

  uint roll(uint stat)
  {// A simple stat roll method
    return uniform(1, stat + 1);
  }

  unittest
  {
    roll(20).Should.Not.Equal(21).Because("That\'s out of range");
  }

  uint rollC(uint Min, uint Max)
  {// for custom single stat roll ranges.
  
    uint min = Min;
    uint max = Max;
    
    return uniform(min, max)
  }

  unittest
  {
    rollC(0, 20).Should.Not.Equal(21).Because("That\'s out of range");
  }

  uint rollX(uint[] Stats, function uint(uint[] S) cb)
  {// used for calculations made from 2 or more stat rolls such as evasion from a combination of speed and agility.

    uint[] temp = ()=> foreach(stat; Stats) {temp ~= roll(stat);};
    return cb(temp);
  }

  unittest
  {
    rollX([5,5], function uint(uint[] S) {return S[0] + S[1];}).Should.Not.Equal(11).Because("That\'s out of range");
  }

  bool check(uint CR, uint PR)
  {
    // used for checks like a reflex save against a trap
    // CR = Challenge rating
    // PR = Player Roll

    return PR >= CR ? true : false;

    // Greater than or equal to because its checking if the player MEETS the challenge. Any higher is extra.
  }

  unittest
  {
    check(1, 1).Should.Equal(true).Because("Player roll met the challenge rating");
    check(1, 2).Should.Equal(true).Because("Player roll beat the challenge rating");
    check(2, 1).Should.Equal(false).Because("Player roll didn\'t meet the challenge rating");
  }
}

class FF_Mob : Mob
{
  // old school final fantasy style mob, has same types of stats and abilities, intended for use in similar styled games.

  alias A = Attribute;
  
  string job; // the mob's class, determines stats, AI behaviour if applicable, and abilities. Example: fighter, Mage, Healer.

  int[string[string]] FLAGS;
/*
  bool guarding;
  bool poisoned;
  bool paralysed;
  bool sleeping;
  bool stunned;
  bool confused;
  bool burning;
*/
  this(inout ref JSONValue master, string entry, int lvl)
  {
    super();

    alias C = statCalc;
    alias J = JSONConvert;
    auto D = master[entry];

    this.name = D["name"].J;
    this.job = D["job"].J;

    this.A[0] = C(D["agility"], lvl);
    this.A[1] = C(D["speed"], lvl);

    this.A[2] = C(D["Pattack"], lvl);
    this.A[3] = C(D["Mattack"], lvl);
    this.A[4] = C(D["Pdefense"], lvl);
    this.A[5] = C(D["Mdefense"], lvl);
       
    this.A[6..7] = C(D["health"], lvl);
    this.A[8..9] = C(D["stamina"], lvl);
    this.A[10..11] = C(D["mana"], lvl);
  }

  @property auto agility()
  {
    // governs accuracy and evasiveness
    return A[0];
  }

  @property auto speed()
  {
    // how physically fast a mob can act , move, and similar.
    return A[1];
  }
  
  @property auto Pattack()
  {
    // Physical damage
    return A[2];
  }

  @property auto Mattack()
  {
    // Magic damage
    return A[3];  
  }

  @property auto Pdefense()
  {
    // Physical defense
    return A[4];
  }

  @property auto Mdefense()
  {
    // Magic defense
    return A[5];
  }  

  @property auto health()
  {
    return A[6];
  }

  @property auto stamina()
  {
    return A[8];
  }

  @property auto mana()
  {
    return A[10];
  }

//  alias DP = void delegate(string[])[string];
  
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

  auto statCalc (ref JSONValue a, int lv)
  {
    import std.random : uniform;
    import std.conv : to;
    import std.stdio : writeln;
    
    //writeln("converting to array");
    auto value = JSONConvert(a);
    int[] var;
    
    foreach(number; value)
    {
      var ~= number;
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
