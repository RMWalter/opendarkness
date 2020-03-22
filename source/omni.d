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

  @property auto UBYTE()
  {
    return _UBYTE;
  }
  @property auto BYTE()
  {
    return _BYTE;
  }
  @property auto USHORT()
  {
    return _USHORT;
  }
  @property auto SHORT()
  {
    return _SHORT;
  }
  @property auto UINT()
  {
    return _UINT;
  }
  @property auto INT()
  {
    return _INT;
  }
  @property auto ULONG()
  {
    return _ULONG;
  }
  @property auto LONG()
  {
    return _LONG;
  }
  @property auto FLOAT()
  {
    return _FLOAT;
  }
  @property auto DOUBLE()
  {
    return _DOUBLE;
  }
  @property auto CHAR()
  {
    return _CHAR;
  }
  @property auto STRING()
  {
    return _STRING;
  }

  @property auto UBYTEA()
  {
    return _UBYTEA;
  }
  @property auto BYTEA()
  {
    return _BYTEA;
  }
  @property auto USHORTA()
  {
    return _USHORTA;
  }
  @property auto SHORTA()
  {
    return _SHORTA;
  }
  @property auto UINTA()
  {
    return _UINTA;
  }
  @property auto INTA()
  {
    return _INTA;
  }
  @property auto ULONGA()
  {
    return _ULONGA;
  }
  @property auto LONGA()
  {
    return _LONGA;
  }
  @property auto FLOATA()
  {
    return _FLOATA;
  }
  @property auto DOUBLEA()
  {
    return _DOUBLEA;
  }
  @property auto CHARA()
  {
    return _CHARA;
  }
  @property auto STRINGA()
  {
    return _STRINGA;
  }
}
