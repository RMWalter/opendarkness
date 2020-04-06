struct omni
{
  string TYPE;
  omni VALUE;

  void set()
  {

  }

  void get()
  {

  }
}

union omni
{
  ubyte[] UBYTEA;
  byte[] BYTEA;
  ushort[] USHORTA;
  short[] SHORTA;
  uint[] UINTA;
  int[] INTA; 
  float[] FLOATA;
  ulong[] ULONGA;
  long[] LONGA;
  double[] DOUBLEA;
  string[] STRINGA;
  char[] CHARA;

  ubyte UBYTE;
  byte BYTE;
  ushort USHORT;
  short SHORT;
  uint UINT;
  int INT;
  float FLOAT;
  ulong ULONG;
  long LONG;
  double DOUBLE;
  string STRING;
  char CHAR;
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
