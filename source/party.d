class TBB_Party
{
  static struct TBB_Inventory
  {
    static struct ItemSlot
    {
      Item* Name; //points to an item definition
      ubyte Amount;

      delegate void Use()
      {

      }
    }
    ItemSlot[] Slot;
  }
  
  TBB_Hero[] Party;

  TBB_Inventory Inventory; //holds the names of items and it's amount in each slot
  
  this(TBB_Hero[] party)
  {
    this.Party = party;
  }
}
