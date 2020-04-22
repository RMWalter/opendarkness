struct TBB_Inventory
{
  static struct ItemSlot
  {
    Item* item;
    ubyte amount;
  }
  ItemSlot[] inventory;
}
