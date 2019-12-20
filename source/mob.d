import std.stdio;
import std.json;
import display;

class Mob
{
  string name;
  string job;
/*
  ubyte[3] mind;
  ubyte[3] spirit;
  ubyte[3] perception;
  ubyte[3] luck;
    
  ubyte[3] strength;
  ubyte[3] endurance;
*/
  ubyte agility;
  ubyte speed;

  int Pattack;
  int Mattack;
  int Pdefense;
  int Mdefense;
  
  int[2] health;
  int[2] stamina;
  int[2] mana;

  bool guarding;
  bool poisoned;
  bool paralysed;
  bool sleeping;
  bool stunned;
  bool confused;
  bool burning;
      
  this(ref JSONValue master, string entry, int lvl)
  {
    alias C = statCalc;
    auto D = master[entry];

    this.name = D["name"].str;
    this.job = D["job"].str;
/*
    this.mind = 1;
    this.spirit = 1;
    this.perception = 1;
    this.luck = 1;

    this,strength = 1;
    this.endurance = 1;
*/

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

  void Attack(Mob defender)
  {
    Display.attacking(defender); //calls Display struct for messege, will fix later

    if(uniform(1, this.agility) > uniform(0, defender.agility))
    {
      int change = uniform(1, this.Pattack + 1) - uniform(0, defender.Pdefense + 1);
      change = change >= 0 ? change : 0;
      defender.health[0] -= change;

      writeln(defender.name, " takes ", change, " damage!", "\n" );
      if(defender.health[0] <= 0)
      {
        writeln(defender.name, " dies!", "\n");
        Graveyard(defender);
      }
    }
    else
    {
      writeln(attacker.name, " misses", "\n");
    }
  }

  void Guard()
  {   
    this.guarding = true;
      
    if(this.stamina[0] < this.stamina[1])
    {
      this.stamina++;
    
    }
  }

  void Magic(Mob target)
  {

  }

  void Item(Mob target)
  {

  }

  void Escape()
  {

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
