import std.conv;

/* 
The thing that holds the party information for travelling 
and the save, load, options buttons and all that. The main menu and status menu sort of thing
*/

struct Manifest
{
  import std.math : floor;
  import conv : to;
  string[] data;
  
  ubyte PAGE_SIZE = 5;
  ubyte current_page = 1;
  ubyte total_pages = floor(data.length / PAGE_SIZE);

  string list()
  {  
    ubyte p1 = (PAGE_SIZE * current_page) - PAGE_SIZE;
    ubyte p2 = p1 + PAGE_SIZE <= data.length - 1 ? p1 + PAGE_SIZE : data.length - 1
    string slice = data[p1..p2]
  
    string output;

    ubyte i = 1;
    foreach(element; slice)
    {
      output ~= (to!string(i) + ": " + element);
      
    }
    return output;
  }

  auto mode;

  void display()
  {

  }  
}

struct StatusScreen
{
  import mob;
  
  string[] menuitems = ["Save Game", "Load Game", "Status", "Options", "Quit"];

  Hero[] party;

  int money = 0;
  
  void Status()
  {

  }

  void LoadGame()
  {

  }

  void SaveGame()
  {

  }

  void Options()
  {

  }

  void Quit()
  {

  }
}
/*
struct MainMenu
{
  string[] selection = ["New Game", "Load Game", "Options", "Quit"];

  
  
  void NewGame()
  {

  }

}

struct InGameMenu
{

  string[] selection = ["Save Game","Status"];

  void Status()
  {

  }
}
*/
