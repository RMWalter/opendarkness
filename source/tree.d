class Node
{
  /*
  Nodes contain the text that is displayed on the screen for its selection, it's
  resulting behaviour that runs as soon as it's chosen, and pointers to connected    nodes. For example, a node for a dialogue tree would contain the dialogue your
  character says as its title, Its behaviour would be running any persuade or 
  similar checks that need to be passed before moving on, as well as returning 
  the dialogue the NPC says back to your character and any other resulting 
  behaviour and the list of nodes for possible resulting dialogue choices. A 
  combat action tree would list the title of the action, like "attack", "magic" 
  or "item", which would link to / run the behaviour to be performed and/or a 
  series of other nodes. Like the spells in a spell book or consumable items in 
  inventory.
  */
     
  auto head;
  auto prev;
  auto branch;

  this()
  {

  }

  hookup(Node H, Node P, Node[] B)
  {
    this.head = H;
    this.prev = P;
    this.branch = B;
  }
}

class Tree
{
  /*
  Trees contain a tree of Nodes and are mainly here to keep track of 
  where you are in the structure and organizing the whole thing. For example, A 
  dialogue tree contains every possible dialogue option and resulting behaviour a 
  particular NPC is capable of saying. A combat action tree contains a particular 
  characters selectable actions during battle. Such as a mage having "magic" show 
  up in their list of actions, which brings up a list of known spells when 
  selected. Whereas fighters have no such option.
  */
}

class Dialogue : Node
{
  string message; //what is said when you get to this node
  auto condition; //condition that needs to be met to progress to this node
  string[] say; //What you can say
  
  this(string M, auto C = null, string[] S)
  {
    super();
    
    this.message = M;
    this.condition = C;
    this.say = S;
  }
}

void main()
{
  Node[] tree;
  tree ~= Node("Hello, can I help you?", ["Yes", "No", "Bye"]);
  tree ~= Node("With what?",["What\'s your Favorite colour?", "What\'s your name?", "Do you like bees?"]);
  tree ~= Node("Oh, why are you here then?",["I'm bored", "Because why not?."]);  tree ~= Node("Green, I guess.",[]);
  tree ~= Node("Emma.",[]);
  tree ~= Node("I don't like things that sting me",[]);
  tree ~= Node("Ummm... fair enough",[]);
  tree ~= Node("",[]);
}
