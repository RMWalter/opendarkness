class TBB_Party
{
  import inventory;
  
  TBB_Hero[] Party;

  TBB_Inventory Inventory; //holds the names of items and it's amount in each slot
  
  this(TBB_Hero[] party)
  {
    this.Party = party;
  }
}
