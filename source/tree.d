struct Menu
{
  string mode;
  /*
  determines behavior of menu, combat mode pulls of combat commands, inventory mode list items in inventory, magic mode lists avaliable spells, etc. Should correspond to name of relevant dictnary.
  */

  string[] list; // list to be populated with relevant options.
}
