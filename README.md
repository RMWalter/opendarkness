This README is heavily work in progress and all sections are subject to change. Markdown is not yet in use.

Open Darkness is intended to be a combination turn based RPG and guild management game written in D.

This project is meant to be the first part of a larger game logic engine project that has accessibility features built in.

Current version is only a battle framework test.

You should be able to use Dub to build and run the program. Otherwise if you need to recompile the battle demo manually it currently only needs:

opendarkness.d
battle.d
mob.d
mobdefs.d (in the defs folder)
JSONConvert.d
equipment.d

All the other files aren't utilized yet and some may be deleted in the future.

When run, it generates a simple 4v4 battle. The only implemented action right now is "attack". ou can choose your target from 1-4. valid input is "a#" I.E "a1" to "a4" which stands for "attack, place #" you can also type "g", "m", "i", and "e" without any number after which are teh standins for "guard", "magic", "item", and "escape" respectively, but all they will do right now is write their corrosponding name.


INTENDED GAMEPLAY SYSTEMS:

Combat:

Basically just the old school final fantasy style turn based party combat. However I'd like to mix in multi character techniques ala chrono trigger as well. Spells use mana as per normal, but there's also a physical equivalent called "skills" that cost stamina to use. Stamina is also used during normal physical attacks and to regenerate mana over time. Stamina regen lowers over time to reflect character tiredness or fatigue. Resting restores both.

Characters:

Each adventurer is a unique individual. Having their own personality, likes and dislikes, ambitions and history. All of which affect their development and performance in various situations. Some care about money more than anything else, some hate a particular monster and perform better against them. Some are afraid of the dark, some are looking for love, some are looking for revenge, some feel awkward around others, and so on. Using the right person for the right job makes all the difference. Oh, and death is permanent.

Bonds:

Characters that work together often become increasingly emotionally bonded to each other. Bonds can be positive, negative, or a mix of both. Positively bonded characters will enjoy going out on quest together and work better as a team. Conversley they may not enjoy working with strangers and may even refuse to. As characters bonds grow stronger and their skills improve they may unlock synergistic combo techniques. If a bonded character dies or otherwise has bad things happen to them, their friends can become depressed, enraged, inspired, etc.

Classes:

There's going to be more than just the basic "fighter", "mage", "rogue" archetypes in this game. Some jobs are avaliable through raw experience or training at the academy, some only unlock due to specific highly emotional events or encountering special adventurers during certain events or quests and getting them to join you. How many different classes and what they will all do I don't know yet so we're going to start with the basics.

Guild Management:

Hire adventurers, outfit them with equipment from your blacksmiths, give them potions from the apothecary and provisions from the kitchen, train them in various jobs at the academy, send them on quests from the guildhall to make money. NPC's of varying types can be hired for tasks ranging from baking bread to building roads and bridges to guarding towns. Become more than just the local guild, become the central institution holding the fabric of society together.

Overworld Map:

Travel is not instantaneous. time passes when parties are heading out to, undertaking, and returning from quests and anything can happen on the open road. You can hire npc guards to patrol the roads and keep them clear of creatures, highway men and debris so your adventurers don't have to.


Quests:

Quests can range from the mundane to the insane and completing them is how your guild earns its money and reputation. Some quests are commissioned by local citizens or organizations of a given town with a reward but some can be initiated by the guild itself. These quests pay for themselves via loot found. Your adventurers will take a certain percentage of loot from every quest completed as their payment. The rest goes to the guild as per their contract with you. Although money isn't the main motivator for all adventurers, its certainly a good place to start if you want to keep them happy. Unhappy adventurers may leave and chase their ambitions elsewhere. This could be a rival guild, banditry, or worse.

It will be possible to send multiple parties on a single quest, such as clearing a dungeon. Though this won't be the case for all quests. Parties can be dynamically resized as the situation changes, such as restructuring two two character parties into a single four character party after each suffers casualties. Reinforcements can be called in during some quests via various means, though as time passes equally in and out of quests you may not have time to wait if your task is time sensitive.

Curios:

These are everything from simple chests that contain loot that can be found in dungeons to minigame puzzles that have effects when completed or failed. These are somewhat inspired by Darkest Dungeon's curios, but 'd like them to become a little more interactive, indepth and important at times. For example, flipping a switch in one part of a dungeon that opens a door in another part.

STRETCH FEATURES:

These are things that I don't intend on neccessarily doing myself because I'm trying to avoid scope creep but they're things I'd really love to see implemented.

Adventure Mode:

Ignore all the guild management nonesense and play the game from the perspective of a single group of adventurers and anyone you befriend. Become legendary heros or nameless nobodies rotting in the ditch right outside of town.

Multiplayer:

co-op and guild vs guild with a mixture of some players in guild mode and some in adventure mode.

Advanced Combat System:

I'd like to have far more player input in the damage they do and take. Implementing many quick time event type things for everythign from basic attacks, spells , evasions and counters. creating a semi-real time battle system. I would like it to be possible to take very low level charactgers through a very high lecvel quest and win provided the player has enough skill to pull it off. Combined with multiplyer, this could make for some exciting PvP matches. However the challenge would be creating a system that a totally blind player could use. Which I think would require a high amount of sound work that I simply cannot do.

INTENDED STORY CONCEPT:

Stage 1

Start with one town and no roads.Your first goal is to remove the  bandit checkpointright outside of town preventing travel and trade. Complete it with first group of adventurers as tutorial. Then take quests, hire more adventurers, and upgrade your buildigs to learn about each system as you go. 

Quests are almost exclusively about clearing and exploring the surrounding roads and forests to reestablish the town's economy at this stage. Enemies are a combination of bandits and low level monsters. The major story quest is to clear the local mines of whatever now inhabits it. Probably bandits, maybe goblins or equivalet. Once you do, and if you've found the next town and removed it's bandit checkpoint, you will unlock the trade caravan quest for it.

Stage 2

Set up trade with that other town to improve your reputation with them until they let you set up a guildhall there. They've been getting besieged by monsters for awhile now and the bandits had been protecting them. For their own interests of course. But now that they're gone the task falls to you. Rebuild their town and secure the surrounding areas. Major story event will be a town raid defense. After which the attackers are tracked back to their home for you to raid yourself. Kill the leader and move onto the next stage.

Quests at this stage will still include the standard clear and explore types but now trade caravan quests become avaliable. This stage will focus more heavily on teh economics of the game rahter than the combat. The town raid event happens automaticaly and will use whatever forces you have in your barracks at the time to defend.

Stage 3

Town raiding prties regularly spawn and move towards a target town, which can be any on teh map, including those you don't own. They can be scouted on the roads before they arrive allowing you to track their movements on teh world map. Giving you time to head them off yourself or prepare accordingly. If a town you own is conquered, all buildings and improvements are destroyed or commandeered by your enemies, potentially making further raids that much more difficult to deend against. If a town you don't own is conquered, it becomes a new hold for the raiding forces to launch raiding parties from. Increasing their spawns.

It becomes possible for radining parties to kidnap your adventurers, whcih can cause emotional trauma to thos bonded to them and potentially generate rescue quests among other special events. Quest at this stage start to focus on the reasons why the world is in the state it is. As rumors abound of artifacts and ancient empries. Major story quest for this stage will be something like investgating an ancient temple that appears to be active and releasing some giant creature within.

Stage 4

Boss Raids now occur occasionally. Single massive creatures that threaten to destroy everything in their path. Vorpal crystals begin appearing in various parts of the world, including previously secure forests, caverns and ruins. repopulating  and reinforcing them over time with monsters and animals mutated by the otherworldly energies. Raids will be launched from these areas after awhile to drag people off to the crystals to be transformed into who knows what. Closing these gates becomes a new and pertinent quest and take the form of a dungeon clearing quest with a miniboss and good loot.

Main story quest at this stage is to enter a dimensional gate in another temple and destroy its planar anchor, thus stopping the spawning of vorpal crystals. Though this will provoke a response from the other side.

Stage 5

Dimensional gates spawn occassionally around the world, sending forth creatures directly from teh other side. Whenever a dimensional gate is present, vorpal crystals will begin to spawn. dimensional forces will travel to vorpal crystal locations in an attempt to reinforce them further. Naturally they will also engange in their own raids on towns. Further research into history reveals a way to shut down teh gates permanently. The major story quest involves securing aother site that the dimensional creatures seemed unnatturally drawn to. Unfortunately one of these is a mega boss that seems intent on destroying the site and anything else that gets in its way. Kill it and learn what you can from the place.

Stage 6

You are working on deciphering a way to stop the invasion. But in the meantime you need to defend against the myriad of things trying to destroy you. Keep trade going, keep clearing the world of everything from lowly bandit camps to demonic fortresses. Eventually you will learn why the dimensional xreatuyres were trying to destroy that crystal. You learn how to build them yourself and need to build a certain amount, one per town, to survive. These towns will have a large amount of raids sent at them in order to stop you. But once you have enough you can force open your own portal directly into teh heart of the swarm. If you can clear the dungeon and kill the ultra boss at the end the entire swarm will die, as all are a part of it. Restoring peace and safety to the world. Congrats, you win!

DEVELOPMENT ROADMAP:

My plan right now is to get the battle system working with all it's basic features. Then I want to implement the experience, leveling and loot system, turning the game into an infinite series of random fights. At which point I'd probably work on the bassic GtkD GUI. After that I'm planning on working on the curio system turning the game into a series of alternating battles and curios. then a shop system for resting, buying and selling items and replacing party members with new ones. After that I want to work on teh basic guild functions. Transitioning the game from an infinite series of fuights, curious, and shops into one where you take quests, go a linear numgber of tiles which may be fights, curios or empty, and then return to where you have shops.

After that I think it would be time to work on the map system, probably dungeons first so that things aren't all stright linear shots anymore. Then the overworld map can be worked on. Once multiple towns can be generated caravan quests, raids and similar can get implemented. After that the whole story can come together and the project will be effectively finished.

I want it to be fully accessible for the blind and visually impaired (like me) and will be doing absolutely no graphical work as a result. I will code a basic GUI using GtkD mainly for direct keyboard input and to provide others a place to hook into for graphics and sound output. I will initially use Espeak to provide audio feedback for accessibility. But I wouldn't mind expanding the system to be compatible with existing screen readers and similar later. But I will be doning no advanced sound work beyond that. If you guys want it to look fancy and have cool music and stuff, that's on you to create and implement.

CONTACT:

minds.com/rmwalter

I blog about this and other projects here. I use Tox for instant messaging, if you want to join in on this project, or just wannna chat, pm me on Minds and I'll send you my Tox ID. We can set up a group chat or something as we go.
