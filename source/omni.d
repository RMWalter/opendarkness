union omni
{
  ubyte[] _UBYTEA;
  byte[] _BYTEA;
  ushort[] _USHORTA;
  short[] _SHORTA;
  uint[] _UINTA;
  int[] _INTA; 
  float[] _FLOATA;
  ulong[] _ULONGA;
  long[] _LONGA;
  double[] _DOUBLEA;
  string[] _STRINGA;
  char[] _CHARA;

  ubyte _UBYTE;
  byte _BYTE;
  ushort _USHORT;
  short _SHORT;
  uint _UINT;
  int _INT;
  float _FLOAT;
  ulong _ULONG;
  long _LONG;
  double _DOUBLE;
  string _STRING;
  char _CHAR;

  @property auto ref UBYTE()
  {
    return _UBYTE;
  }
  @property auto refBYTE()
  {
    return _BYTE;
  }
  @property auto ref USHORT()
  {
    return _USHORT;
  }
  @property auto ref SHORT()
  {
    return _SHORT;
  }
  @property auto ref UINT()
  {
    return _UINT;
  }
  @property auto ref INT()
  {
    return _INT;
  }
  @property auto ref ULONG()
  {
    return _ULONG;
  }
  @property auto ref LONG()
  {
    return _LONG;
  }
  @property auto ref FLOAT()
  {
    return _FLOAT;
  }
  @property auto ref DOUBLE()
  {
    return _DOUBLE;
  }
  @property auto ref CHAR()
  {
    return _CHAR;
  }
  @property auto ref STRING()
  {
    return _STRING;
  }

  @property auto ref UBYTEA()
  {
    return _UBYTEA;
  }
  @property auto ref BYTEA()
  {
    return _BYTEA;
  }
  @property auto ref USHORTA()
  {
    return _USHORTA;
  }
  @property auto ref SHORTA()
  {
    return _SHORTA;
  }
  @property auto ref UINTA()
  {
    return _UINTA;
  }
  @property auto ref INTA()
  {
    return _INTA;
  }
  @property auto ref ULONGA()
  {
    return _ULONGA;
  }
  @property auto ref LONGA()
  {
    return _LONGA;
  }
  @property auto ref FLOATA()
  {
    return _FLOATA;
  }
  @property auto ref DOUBLEA()
  {
    return _DOUBLEA;
  }
  @property auto ref CHARA()
  {
    return _CHARA;
  }
  @property auto ref STRINGA()
  {
    return _STRINGA;
  }
}
/*
void main()
{
  import std.stdio : writeln;

  omni test;

  test.UBYTE = 98;

  ubyte a = test.UBYTE;
  char b = test.CHAR;
  
  writeln(a);
  writeln(b);
}
*/
