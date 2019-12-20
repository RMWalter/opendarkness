import std.conv;

/* 
The thing that holds the party information for travelling 
and the save, load, options buttons and all that. The main menu and status menu sort of thing
*/



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
