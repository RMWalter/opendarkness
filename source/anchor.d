import std.conv;

/* 
The thing that holds the party information for travelling 
and the save, load, options buttons and all that. The main menu and status menu sort of thing
*/

struct Anchor
{
  import display;
  import mob;

  Mob[] Party;
  
  Display screen = Display();

  static string UserInput()
  {
    import std.string : strip;
    import std.stdio : readln;

    string msg = strip(readln());

    return msg;
  }

  void Random_Battle(Mob[] b)
  {
    import battle;

    Display.Display_Battle BD = Display.Display_Battle();

    Battle fight = Battle(Party, b);

    BD.Party_Hookup(fight.allies);
    BD.Enemy_Hookup(fight.enemies);
    auto pass = BD.action_message();
    fight.round(pass);
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
