version(unittest) import fluent.asserts;

/*
  uint roll(uint stat)
  {// A simple stat roll method
    if(stat > 1)
    {
      return uniform(1, stat + 1);
    }
    else
    {
      return 1;
    }
  }

  unittest
  {
    roll(20).Should.Not.Equal(21).Because(`That's out of range`);
  }

  uint rollC(uint Min, uint Max)
  {// for custom single stat roll ranges.
  
    uint min = Min;
    uint max = Max;
    
    if(min < max)
    {
      return uniform(min, max + 1)
    }
    else
    {
      return min;
    }
  }

  unittest
  {
    rollC(0, 20).Should.Not.Equal(21).Because(`That's out of range`);
  }

  uint rollX(uint[] Stats, function uint(uint[] S) cb)
  {// used for calculations made from 2 or more stat rolls such as evasion from a combination of speed and agility.

    uint[] temp =  function uint[]()
    { 
      uint[] A;

      foreach(stat; Stats) 
      {
        A ~= roll(stat);
      } 
      return A;
    }
      return cb(temp);
  }

  unittest
  {
    rollX([5,5], function uint(uint[] S) {return S[0] + S[1];}).Should.Not.Equal(11).Because(`That's out of range`);
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

template mixin TBB_Class()
{
  class TBB_Mob
  {
    mixin property_maker()
    {
      @property VAL()
      {

      }
    }
  }
}
*/

class TBB_Mob
{
  // old school final fantasy style mob, has same types of stats and abilities, intended for use in similar styled games.

  string Job; // the mob's class, determines stats, AI behaviour if applicable, and abilities. Example: Fighter, Mage, Healer.

  immutable ubyte Level;

  immutable ubyte PAttack;
  immutable ubyte MAttack;
  immutable ubyte PAttack;
  immutable ubyte MDefense;
  immutable ubyte Agility;

  immutable uint Health;
  immutable uint Mana;
  immutable uint Stamina;
  
  int[string[string]] FLAGS; // flags for things like conditions, like poison.
/*
  bool guarding;
  bool poisoned;
  bool paralysed;
  bool sleeping;
  bool stunned;
  bool confused;
  bool burning;
*/

  this(string job = "Generic", ubyte level, ubyte[5] stats = 0, uint[3] body = 0)
  {
    this.Job = job;

    this.Level = level;

    this.PAttack = stats[0];
    this.PDefense = stats[1];
    this.MAttack = stats[2];
    this.MDefense = stats[3];
    this.Agility = stats[4];

    this.Health = body[0];
    this.Mana = body[1];
    this.Stamina = body[2];
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
}
/*
  uint[] Fill(ref JSONValue master, string entry, int lvl)
  {
    import JSONConvert;
    alias C = statCalc;
    alias J = JSONConvert;
    
    auto D = master[entry];
    uint[] temp;

    //D["name"].J;
    //D["job"].J;

    temp[0] = C(D["agility"], lvl);
    temp[1] = C(D["speed"], lvl);

    temp[2] = C(D["Pattack"], lvl);
    temp[3] = C(D["Mattack"], lvl);
    temp[4] = C(D["Pdefense"], lvl);
    temp[5] = C(D["Mdefense"], lvl);
       
    temp[6..7] = C(D["health"], lvl);
    temp[8..9] = C(D["stamina"], lvl);
    temp[10..11] = C(D["mana"], lvl);
    temp[12] = lvl;

    return temp;
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
*/

unittest
{
  uint[13] array = 10;
  auto test = new TBB_Mob("Human", array, "Fighter")

  test.Pattack.Should.Equal(10).Because(`That's what I set it at`);
  test.name.Should.Equal("Human").Because(`That's what I set it at`);
  test.job.Should.Equal("Fighter").Because(`That's what I set it at`);
}

class TBB_Hero : TBB_Mob
{

}


class TBB_Hero : TBB_Mob
{
  immutable string Name;

  string MainHand;
  string OffHand;
  string Body;
  string Head;
  string[2] Misc;

  int XP;
  immutable int NEXP;

  this(string job = "Generic", ubyte level, ubyte[5] stats = 0, uint[3] body = 0, string name = "Generic", string[6] equip = "Generic", int xp = 0)
  {
    super(job, level, stats, body);

    this.Name = name;

    this.MainHand = equip[0];
    this.OffHAnd = equip[1];
    this.Body = equip[2];
    this.Head = equip[3];
    this.Misc[0] = equip[4];
    this.Misc[1] = equip[5];

    this.XP = xp;
  }

  @property NEXP()
  {
    return Level * 1000;
  }

  TBB_Mob LevelUp()
  {
    XP -= NEXP;
    Level ++;
    
    if(XP >= NEXP)
    {
      LevelUp();
    }

    return new Hero();
  }

  void GainXP(int xpVal)
  {
    XP += xpVal;
    if (XP >= NEXP)
    {
      LevelUp();
    }
  }
}

class TBB_Battler : TBB_Hero
{

  this()
  {
    super();
  }
}

class OD_Mob
{

  immutable ubyte mind;
  immutable ubyte spirit;
  immutable ubyte perception;
  immutable ubyte luck;
    
  immutable ubyte strength;
  immutable ubyte endurance;
  immutable ubyte agility;
  immutable ubyte speed;
  
  this()
  {
    this.mind = 1;
    this.spirit = 1;
    this.perception = 1;
    this.luck = 1;

    this,strength = 1;
    this.endurance = 1;
    this.agility = 1;
    this.speed = 1;
  }
}
