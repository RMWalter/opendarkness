class TBB_Party
{
  import inventory;
  
  TBB_Hero[] Party;

  TBB_Inventory Inventory; //holds the names of items and it's amount in each slot
  
  this(TBB_Hero[] party, TBB_Inventory inventory)
  {
    this.Party = party;
    this.Inventory = inventory;
  }
}
