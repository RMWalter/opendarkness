struct omni
{
  static union OMNI
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

  string TYPE;
  OMNI VALUE;
  static immutable string[string] TYPEDICT;
  
  void set(T)(in T input)
  {
    TYPE = typeid(input);
    VALUE.TYPEDICT[TYPE] = input;
  }

  void get(T)(out T LVal)
  {
    LVal = VALUE.TYPEDICT[TYPE];
  }
}

/*
void main()
{
  import std.stdio : writeln;

  omni test;
  test.TYPEDICT = ["ubyte[]" : "UBYTEA",
  "byte[]" : "BYTEA",
  "ushort[]" : "USHORTA",
  "short[]" : "SHORTA",
  "uint[]" : "UINTA",
  "int[]" : "INTA",
  "float[]" : "FLOATA",
  "ulong[]" : "ULONGA",
  "long[]" : "LONGA",
  "double[]" : "DOUBLEA",
  "string[]" : "STRINGA",
  "char[]" : "CHARA",
  "ubyte" : "UBYTE",
  "byte" : "BYTE",
  "ushort" : "USHORT",
  "short" : "SHORT",
  "uint" : "UINT",
  "int" : "INT",
  "float" : "FLOAT",
  "ulong" : "ULONG",
  "long" : "LONG",
  "double" : "DOUBLE",
  "string" : "STRING",
  "char" : "CHAR"];

  test.set = 98;

  ubyte a = test.get;
  char b = test.get;
  
  writeln(a);
  writeln(b);
}
*/
