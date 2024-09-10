# "Chronicles: Rise of Rome" - Game Design Document

## Battle representation Sep-10 2024

### Enemy Representation and Mechanics

- **Player and Enemy Representation**: 
  - Player is represented by a **single Roman figure**.
  - Enemies (e.g., Caenina, Crustumerium, Antemnae) are represented by **tribal figurines**.
  - **Next action** is shown above each enemy (e.g., attack Fortune, call reinforcements).

- **Dragging Cards**:
  - **Army Cards**: Dragging an Army card to an enemy immediately reduces its **Battle Strength**.
  - **Money Cards**: Bribing an enemy requires **2 Money cards**. 
    - Dragging the first Money card to an enemy shows a **gold icon** above their head, indicating they can be bribed with one more Money card.
    - Once the second Money card is dragged, the bribe succeeds, and the enemy’s Battle Strength decreases by 1.
  - **Defending Fortune**: Dragging 2 Money cards to the player shields Fortune for 1 turn. A **shield icon** appears on the player figure after the second card.

- **On-Hover Instructions**:
  - **Enemy Tooltip**: Displays enemy **Battle Strength**, **next action**, and **what can be done** to them (e.g., “Bribe with 1 more Money card”).
  - **Player Tooltip**: Displays **Fortune shield status**, remaining actions, and what actions the player can take (e.g., "Drag Money to shield Fortune").

### Visual Cues:
- **Gold Icon**: Appears above an enemy when the first Money card is played, indicating the enemy can be bribed.
- **Shield Icon**: Appears on the player after shielding Fortune with 2 Money cards.
- **Tooltips**: Ensure that the player's actions and enemy states are clearly explained on hover.


## Implementation Sep-10 2024

### Action Cards (Prototype)

The following Action cards will be used in the prototype. They provide **Army value**, **Money value**, **extra actions**, or **card draw** to offer strategic variety during encounters and battles.

- **Roman Phalanx**: Provides 2 Army value.  
- **Grain Harvest**: Provides 2 Money value.  
- **Patrician Clans**: Provides 1 Army value and gains 1 extra action.  
- **Plebs**: Draw 2 cards and gain 1 extra action.  
- **Regional Trade**: Provides 1 Money value and draws 1 card.
   
### Battle System (Prototype)

The **Battle System** involves tactical decisions during encounters with enemy forces. Both player and enemy actions are turn-based.

#### Player Actions:
- **Army Cards**: Used to attack enemies and reduce their Battle Strength.
- **Money Cards**: Used to bribe enemies or build defenses to protect Fortune.
- **Action Cards**: Provide tactical bonuses such as drawing extra cards or gaining extra actions.
- **Extra Actions**: Some cards allow the player to perform additional actions in a single turn.
- **Card Draw**: Cards like "Council of Elders" allow the player to refresh their hand and increase available options.

#### Enemy Actions:
- **Enemy Types**: Enemies can attack Fortune, call reinforcements (increase their Battle Strength), or reduce player actions. 
- **AI Behavior**: Enemies perform one action per turn, selected randomly from their abilities.

#### Turn Structure:
- Each battle turn consists of the player performing up to 3 actions, followed by the enemy's action. Battles continue until all enemies' Battle Strength is reduced to 0 or the player’s Fortune reaches 0.

#### Next Turn Mechanics:
- After both player and enemy have taken their actions, a new turn begins:
  - **Player draws cards** from the deck to maintain a full hand (e.g., up to 5 cards).
  - **Actions reset**: Players regain their available actions for the new turn (e.g., 3 actions).
  - The **state machine** transitions into the next phase, ensuring smooth handoffs between player and enemy turns.

#### Victory/Failure Conditions:
- **Victory**: All enemy forces' Battle Strength reaches 0.
- **Failure**: The player's Fortune reaches 0 or the player runs out of viable resources to act.

## Implementation Sep-9 2024

- Fortune counter/badge on map screen and encounter screen
- Encounter: player's hand, deck, discard pile 
- Encounter: player's hand "expands/shrinks" based on number of cards
- Encounter: Deck browsing, discard pile browsing
- Map: visuals instead of icons for resolved encounters
- Browsing hand, deck, discard pile from the Map screen (maybe it could make sense to have them on the bottom at all times, but they expand/minimize when on-hovered)
- offering options 
- data model for options for each encounter
- choosing options (including animations)
- playing a card from hand (including animations)
- playing a card from deck, trashing a card (incl.anim.)
- drawing a card, reshuffling the deck (incl.anim.)
- discarding a card (incl.anim.)
- data model for turns, hand, deck, discard pile, trash pile, fortune, available actions
- data model for cards (specify what player can do with them)
- data model for encounters (steps, options, actions, and outcomes)
- Data model for enemies (visual, strength indicators, attack types).
- player battle moves (attack enemy, bribe enemy, defend fortune)
- enemy battle moves (attack fortune, reinforce, reduce player actions, force discard)
- AI rules for computer turn in battle
- state machine for battle
- encounter victory / failure
- tutorial / onboarding / hand-holding
- fortune balancing

TODO:
- implement action cards => which actions ?!?
- encounter system with steps
- event system with options and outcomes
- battle system

### Battle Mechanics Sep-7 2024

- **Player Starts** with 5 cards in hand and 3 actions per turn (due to 3 enemy tribes).
- **Player Turn**:
  - **Play up to 3 actions**:
    - **Army cards**: Reduce an enemy tribe's **Battle Strength** by 1 per card.
    - **2 Money cards (1 action)**:
      - **Bribe**: Lowers an enemy tribe's **Battle Strength** by 1.
      - **Build Defenses**: Blocks 1 **Fortune loss** from enemy attacks for 2 turns.
    - **Action cards**: Provide tactical effects, such as drawing extra cards, negating enemy reinforcements, or boosting Army/Money effects.
  - **Spend 1 Fortune** to draw an extra card or take an additional action.

- **Enemy Turn**:
  - First battle is against 3 tribes
  - Each tribe randomly performs one of two actions:
    - **Attack Fortune**: Reduces the player's **Fortune** by 1.
    - **Call Reinforcements**: Increases the tribe's **Battle Strength** by 1.
  - **Later enemies** can also perform:
    - **Reduce Actions**: Lowers the player's available actions next turn by 1.
    - **Force Discard**: Randomly discards 1 card from the player's hand.

- **Card Draw**: At the start of each turn, the player **draws 3 cards**.

- **End Condition**:
  - **Victory**: Reduce all enemy tribes' **Battle Strength to 0**.
  - **Failure**: The player's **Fortune reaches 0** or they run out of viable resources to act.


## Encounters Sep-7 2024

- **Card Draw**: At the start of each encounter, the player draws enough cards to have 5 in hand (e.g., if 3 cards remain, 2 more are drawn).
- **Encounter Steps**: Most encounters consist of multiple steps, each offering different options that require resources (Army, Money, or Fortune).
- **Battle Encounters**: Battle encounters follow a 3-step structure:
  1. **Pre-Battle**: Preparation with choices or actions.
  2. **Battle**: Core battle mechanics (separate from other encounters).
  3. **Post-Battle**: Aftermath with rewards or consequences.
- **Origins** encounter is the game starting screen (when player clicks "Play"), resolution opens the map

## Gameplay Sep-6 2024

- **Fortune** is a carry-over resource, represented in Roman numerals on the top dashboard, and persists between encounters.
- Each **encounter** consists of multiple steps, with each step presenting a short historical snippet (2-3 sentences).
- A step can either be a **battle** (resolved through cards) or offer **options** (choices based on Army, Money, or Fortune).
- The **deck**, **hand**, and **discarded pile** carry over between encounters, allowing for long-term resource management.
- Under certain circumstances (such as **failure** or specific options), a card can be **permanently trashed**, removing it from the deck permanently.
- **Encounter Steps** can be resolved either by playing cards from the deck or choosing between different options.
- **Army** and **Money cards** are played directly or replaced with **Action cards** that generate resources without losing the card.
- **Rewards** for completing steps can include Fortune, new cards, or other benefits.
- **Player Choices**: When a player chooses to spend **Fortune**, it's deducted from their Fortune total. Playing Army or Money cards results in those cards going to the **discard pile** (unless they use an Action card, which preserves the resource).
- **Carry-Over Mechanic**: If a card is **discarded**, it remains in the discard pile and can return to the player’s deck when reshuffled. **Trashed cards** are permanently removed from the game.
- **Visual Layout**: Each encounter has a **single visual** that stays consistent through multiple steps to reduce complexity.- **Each encounter type** (Event, Battle, Treasure, Shop, Rest) has a unique **icon** representing it
- The player can choose the **next encounter** from a map, similar to the approach used in "Slay the Spire."
- **After completing an encounter**, the encounter's **icon** is replaced on the map with a **smaller version** of the encounter's **main visual** (to mark it as completed).


## Goal
Goal is to create Solitaire Deck Building game that educates the player about Roman era. If successful, I can continue doing this into my retirement.

- Gameplay: Aims to play like Dominion, but single player.
- Examples: Slay the Spire, Balatro
- Historical flavor: Interesting but accurate historical information

## Implementation
Cheapest possible, since the whole idea is to do this solo.
- Use pen-and-paper cards to prototype
- Use GPT to create visuals, in "Pompeii fresco" style for uniformity
- Use Godot to develop a product
- For card-set: clone Dominion
- For implementation: clone Slay the Spire

## Historical flavor
Educational specific mechanics:
- Game progresses in chronological stages corresponding to historical periods
- Make cards for each stage reflect economy, culture, military, religion, everyday life for that stage
- Have short (two paragraphs) "popular-history" text for each card when selected
- Have "card of the day" show-cased when starting a game

Historical stages, each with their own decks, are:
1. Kingdom
2. Early and mid Republic
3. Late Republic
4. Early Empire
5. Mid and late Empire

## Learning curve and progression:
1. Start simple (kingdom, stage 1): only 2 cards for money and army each, cards have only basic effects 
2. Increase strategic complexity (republic, stages 2-3): 3 cards for money and army each, some advanced effects
3. Increase management overhead (empire, stages 3-4): additional 3 "provisions" cards, complex effects

## Gameplay

Resource Types:
- During an encounter: Money, Army
- Carries over between encounters: Gold

Card types:
- Resource cards: provide Money or Army units
- Action cards: Perform special actions like drawing more cards, gaining additional actions, or providing bonuses.

Map:
- Encounters in a node graph
- Player progresses bottom-to-top

Encounter types:
- **Event**: Specific requirements or challenges that need to be overcome using Money or Army.
- **Battle**: Defeat enemy cards by reducing their Money or Army stat to zero.
- **Shop**: Spend Gold to buy new cards or upgrades.
- **Rest**: Recover resources or draw additional cards.
- **Treasure**: Gain valuable rewards or rare cards.

### Encounter Mechanics
Each battle and some events have cards that need to be destroyed to win.

Example cards:
- **"Army Provisions"**: Requires 2 Money to overcome.
- **"Building Materials"**: Requires 3 Money.
- **"Civil Unrest"**: Requires 1 Army units.
- **"Military Escort"**: Requires 2 Army units.

### Prayers Mechanic
Cost:
  - **Gold**: Prayers could cost Gold.
  - **Resource Cards**: Prayers could be triggered by sacrificing Money or Army cards from the hand.
  - **Sacrificing Cards**: Players could sacrifice any card to perform a prayer.

Effects:
  - **Additional Actions**: Gain more actions to play more cards in a turn.
  - **Draw More Cards**: Draw additional cards.
  - **Replace a Card**: Discard and draw a new card.

### Pressure Mechanics
- Card Trashing: After each turn, one random card from the player's deck is permanently trashed for the rest of the encounter.
- Scaling Enemy: A specific card gains stats each turn, forcing the player to destroy it quickly.

## Levels

Five levels:
1. Kingdom
2. Early/mid republic
3. Late republic
4. Early empire
5. mid/late empire

### Level 1: Kingdom

Cards are:

| Money        | Army            | Action cards      | History cards       | Victory cards    |
|--------------|-----------------|-------------------|---------------------|------------------|
| Barter Goods | Citizen Militia | Grain Harvest     | Romulus             | Tyrant Exile     |
| Aes Rude     | Centuria        | Roman Gods        | Sabine Women        | Dual Consuls     |
|              |                 | Plebs             | Curiate Assembly    | Regillus Victory |
|              |                 | Patrician Clans   | Solar Calendar      |  |
|              |                 | Early Roads       | Port of Ostia       |  |
|              |                 | Agrarian Economy  | Circus Maximus      |  |
|              |                 | Regional Trade    | Servian Wall        |  |
|              |                 | River Tiber       | Servian Reforms     |  |
|              |                 | Roman Magistrates | Centuriate Assembly |  |
|              |                 | Latin Language    | Temple of Jupiter   |  |
|              |                 | Saturnalia        | King's Election     |  |
|              |                 | Private Schools   | Military Triumph    |  |
|              |                 | Military Outposts | Pontifex Maximus    |  |
|              |                 | Roman Phalanxes   | Seven Kings         |  |
|              |                 | Urban Prefect     | Vestal Virgins      |  |
|              |                 | Debt Bondage      | Roman Sewers        |  |
|              |                 | Palatine Hill     | Etruscan Neighbours |  |
|              |                 | Roman Senate      | Latin League        |  |
|              |                 | Public Forum      | Magna Graecia       |  |
|              |                 | Mars              |  |  |

More: Seven Hills, First Aquaduct, Origins (Troy, Alba Longa), Pater Familias

Maybe: Divide history cards into two periods, so they are not completely random - then second period cards could be more challenging for example

### Ideas for Republic and Empire

#### Early and Mid Republic

Maniples
Legions

Consuls
Latin Wars
Pyrhic victory
Macedonian wars
Punic wars 
Hanibal
Scipio
12 tables
Navy
Public Tribunes
Slavery
Sessesion of the Plebs
Siege of Syracuse
Dictators
Annales maximi

Sicilia
Sardinia, Corsica (Mercenary Wars)
Hispania
Macedonia
North Africa

Victory Sequence:
Carthaga
Corinth

#### Late Republic

Cohorts 
Legions

Coins: Sestertius, Denarius, Aurus
Triumvirates
Servile Wars
Cicero
Pompei
Crassus
Caesar
Sula's civil War
Conquest of Gaul
Cleopatra
Mark Antony

Victory sequence:
Marius
Sula
Caesar Civil War
Assasination of Caesar
War of Actium - Oktavian Augustus

#### Early Empire

Illyricum
Augustus
Tiberus
Calligula
Conquest of Britan
Vespasian
Trajan
Hadrian
Hadrian's Wall
Antonine Plague
Mesopotamia and Assyria
Year of Four Emperors
Praetorian Guard
Great Fire of Rome
Nero

#### Mid and Late Empire

Diocletian
Diocletian Reforms
Rise of Christianity
Constantine the Great
Tetrarchy
Barbarian Invasions
Dacia
Constantinople
Alaric Sack of Rome
Vandals Sack of Rome

#### Unsorted

Province Uprising
Senate Session
Barbarian Invasion
Pax Romana
Slave Revolt
Marcus Aurelius
Seneca
Cicero
Plague of Galen
Pantheon
Colosseum
Julian Calendar
Roman Numerals
Jupiter
Venus
Minerva
Neptune
First Triumvirate
Reforms of Diocletian
Council of Nicaea
Roman Decadence
Empire Decline
Public Bath
Theatrical Play
Gladiator Games
Chariot Races
Aqueduct
Roman Bridge
Roman Road
Cursus publicus
Acta Diurna
Bureaucracy
City Planning
Roman Law
Bread and circuses
Military Medicine
Legionary Training
Roman Citizenship
Basilica: Christian Temple
Temple of Mars
Roman Welfare
Watchtowers
Client Patron Relationships
