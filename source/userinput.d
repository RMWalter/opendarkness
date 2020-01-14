version(unittest) import fluent.asserts;

char[] userinput()
{
  import std.stdio : readln;

  string temp = readln();
  char[] input;

  foreach(i; temp)
  {
    input ~= i.dup;
  }
  return input;
}
