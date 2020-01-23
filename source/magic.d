struct Effect
{
  string name;
  auto target; //stat or ability it affects
  uint magnitude; //Power of the effect
  uint duration; //How long it lasts

  function auto() custom; //anonymous function for custom behaviour
}

struct Spell
{
  Effect effect[];
}
