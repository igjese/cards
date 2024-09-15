# "Chronicles: Rise of Rome" - Game Design Document

## Godot Implementation To-Do List (Updated Sep-15 2024)

### Prerequisite Setup (Core Systems)
1. **Data Models:**
   - **Data model for cards:** Specify what the player can do with each card (Money, Army, Action cards, etc.).
   - **Data model for hand, deck, discard pile, trash pile, fortune, actions:** A comprehensive system that manages the player’s resources and actions.
   - **Data model for encounters:** Define steps, options, actions, and outcomes for each encounter type (Event, Battle, Reward, Shop, Rest).
   - **Data model for enemies:** Define enemy visuals, strength indicators, next action, and attack types.
   - **Data model for options and outcomes:** Required for encounter choices and branching actions.

2. **State Machine:**
   - **State machine for battle:** Core battle system logic, with turns and transitions between player/enemy moves.
   - **State machine for encounters:** Manage transitions between steps, actions, and outcomes within encounters.

3. **Map Screen:**
   - **Fortune counter/badge on map screen:** Display player’s fortune in a prominent place on the map screen.
   - **Player movement on map:** Clicking next node on the map to progress through encounters.
   - **Visuals instead of icons for resolved encounters:** Update icons with thumbnails or other visuals once encounters are resolved.
   - **Map screen: Deck, hand, discard pile browsing:** Option to view the player’s hand, deck, and discard pile while on the map screen, with expand/minimize on hover.

---

### Encounter Systems (Core Gameplay)
4. **Encounter Screen Setup:**
   - **Fortune counter/badge on encounter screen:** Display player's current fortune during encounters.
   - **Player's hand, deck, discard pile display on encounter screen:** Player can see the hand, deck, and discard piles during the encounter.
   - **Hand expansion/shrink based on number of cards:** Visual cue for the player's hand that adjusts depending on how many cards are in play.
   - **Deck browsing, discard pile browsing on encounter screen:** Allow the player to browse the deck and discard piles during encounters.

5. **Encounter Steps System:**
   - **Encounter system with steps:** Allow for progression within encounters using defined steps (e.g., text and visuals with options at each step).
   - **Event system with options and outcomes:** Allow the player to make choices and receive outcomes based on these decisions (e.g., “spend Fortune” or “discard cards”).
   - **Offering options to player:** Set up UI for offering choices at each encounter step.
   - **Choosing options (including animations):** Handle animations for selecting options.

---

### Card Systems (Interactivity)
6. **Card Actions & Animations:**
   - **Data model for playing cards:** Specify actions related to card playing (e.g., attack, bribe, defend).
   - **Playing a card from hand (including animations):** Implement the action of playing a card, with corresponding animations.
   - **Playing a card from deck or trashing a card (incl. animations):** Implement the action of drawing a card from the deck or trashing a card, including animations.
   - **Drawing a card, reshuffling the deck (incl. animations):** Implement the card draw mechanics, reshuffle the deck when necessary.
   - **Discarding a card (incl. animations):** Implement discarding cards from hand, along with animations.

7. **Action Cards:**
   - **Implement action cards:** Decide on specific action card effects (e.g., draw more cards, gain extra actions, bonus Army or Money).
   - **Specify which actions are tied to each card type:** Finalize what action cards do (e.g., “Roman Phalanx” for Army, “Grain Harvest” for Money, etc.).

---

### Battle Systems (Combat Mechanisms)
8. **Battle System:**
   - **Player battle moves:** Implement attack (Army card), bribe (Money card), defend Fortune (Money cards).
   - **Enemy battle moves:** Implement enemy attack Fortune, reinforce, reduce player actions, force discard.
   - **AI rules for computer turn in battle:** Define how enemies act during their turn.
   - **Encounter victory / failure:** Handle win/loss conditions based on reducing enemy strength to 0 or losing all Fortune.

9. **Battle System UI & Feedback:**
   - **Next enemy action display:** Show what the next enemy action will be (e.g., attack Fortune, call reinforcements).
   - **Enemy tooltip:** Display enemy stats, Battle Strength, and what actions the player can take against them.
   - **Player tooltip:** Display Fortune shield status, remaining actions, and player options.

---

### Secondary Systems (UX Enhancements & Balance)
10. **Map Screen Enhancements:**
    - **Map screen: Deck, hand, discard pile visible at all times:** Allow access to these resources at the bottom of the map screen, with expand/minimize on hover.

11. **Encounter Transitions and Animations:**
    - **Step transitions within encounters:** Implement smooth transitions between steps during encounters (e.g., historical text fades into choice options).
    - **Animations for encounter steps and outcomes:** Add animations when a choice is made (e.g., Fortune counter updates, cards played).

12. **Tutorial / Onboarding:**
    - **Basic tutorial:** Implement hand-holding or tutorial mode for new players to learn the mechanics.
    - **Onboarding system:** Guide players through their first event, battle, and resource management.

---

### Balancing and Final Systems
13. **Balancing:**
    - **Fortune balancing:** Ensure Fortune use (both as a health system and resource) is balanced, and players aren’t overly punished for spending it.
    - **Resource balancing:** Ensure that Money and Army resources are fairly distributed and useful at different stages of the game.
    - **Action balancing:** Review and adjust the number of actions per turn, draw mechanics, and overall card economy.


## First Prototype Sep-12 2024
- First prototype has three "fixed" encounters:
1. Origins (Event) - this is the first gameplay screen
2. Founding of Rome (Event) 
3. Sabine Women (Battle) - against three tribes i.e. against 3 enemies
   
### 1. Origins

#### Step 1: Leaving Troy
_After ten years of relentless siege, Troy has finally fallen to the Greek invaders and the city lies in ruins. With the remnants of your people gathering for flight, your ancestors must decide what to take with them._

Choices:  
- Gather the bravest of Troy's surviving warriors, you'll need them to establish your new home. (+1 Army card)  
- Take what you can of Troy's treasury, hoping it will secure alliances in the lands ahead. (+1 Money card)
  
#### Step 2: Settling in Latium
_After weeks of perilous journey across treacherous seas, your supplies are nearly depleted. You finally reach the shores of Latium, a land rich in resources, but the local tribes view you with suspicion._

Choices:  (random 2 out of 3):  
- Gain the favor of the local tribes through diplomacy and divine signs. (-1 Fortune)  
- Show strength and intimidate the locals into allowing your people to settle. (Discard 1 Army card)  
- Bribe the local leaders and secure an alliance. (Discard 1 Money card)

#### Step 3: Founding Alba Longa
_And thus, the Trojan hero Aeneas founded Lavinium, where his dynasty flourished. Generations later, under joint rule with neighboring tribes, Alba Longa was established—a Latin center of power for centuries to come._

Choices:  
- Secure the favor of the gods to ensure your dynasty's prosperity and divine protection. (+1 Fortune)  
- Strengthen military and political foundations to prepare for the challenges ahead. (Pick 1 Action card)

### 2.Founding of Rome

#### Step 1: Romulus and Remus in Danger
_The throne of Alba Longa was treacherously taken by Amulius. He forced his niece, Rhea Silvia, into priesthood, and her twins, Romulus and Remus, were left to die by the Tiber River._

Choices:  
- The Gods send a she-wolf to nurture the twins until found by shepherds. (-1 Fortune)  
- A bribe convinces the soldiers to spare the twins, allowing them to be raised in secret by a shepherd. (Discard 1 Money card)

#### Step 2. Retaking the Throne
_Years have passed before Romulus and Remus became aware of their ancestry. Young but brave, they rally the people of Alba Longa to bring back the old king, their grandfather._

Choices (random 2 out of 3):  
- Lead the bravest warriors and storm the palace. (Discard 1 Army card)  
- Bribe key officials to gain control from within. (Discard 1 Money card)  
- Inspire the people to rise up and exile the usurper. (-1 Fortune)

### Step 3: Embarking to Found Rome
_With the throne of Alba Longa restored to their grandfather King Numitor, Romulus and Remus prepare to embark on their own journey. Blessed by their mother Rhea Silvia and joined by young people eager for a fresh start, they set out to build a new city by the banks of the Tiber._

Choices (Rewards):  
- Perform sacrifices to the gods to ensure a prosperous journey. (+1 Fortune)  
- Prepare for the challenges of founding a new city. (Pick 1 Action card)

### Step 4: Founding Rome
_As Romulus and Remus search for the ideal location, both claim divine signs for their preference. In a tragic dispute, Remus is killed, and Romulus founds the city of Rome on the Palatine Hill._

Choices (random 2 out of 3):  
- Seek divine approval to ensure its prosperity. (-1 Fortune)  
- Protect the city's borders and secure its foundations. (Discard 1 Army card)  
- Build houses to attract more settlers. (Discard 1 Money card)

### 3. Sabine Women

#### Step 1: The Festival and Abduction
_A new settlement of Rome primarily attracted men seeking a fresh start, but neighboring peoples refused to marry their daughters to them. So Romulus devised a plan: Romans would invite the tribes to a festival, and at a prearranged signal, seize their women._

Choices (random 2 out of 3):  
- Prepare for quick coordination during the battle. (+1 action until end of the battle)  
- Ensure readiness for the conflict. (Draw 1 extra card)  
- Plan how to absorb the enemy’s first attack. (Start the battle with 1 shield on Fortune)

### Step 2: The Battle Against Three Tribes
_The abduction was successful as planned, but it angered the region, and the Sabines are preparing a joint offensive. However, the infuriated tribes of Caenina, Crustumerium, and Antemnae launched their own raids against Rome without waiting for the Sabines, and you must defeat them quickly._

Battle: 
- Player must defeat each of the three attackers (victory) or they will destroy player's fortune (game over)

### Step 3: The Peace Brokered by the Sabine Women
_The Sabines finally launched a fierce assault, led by King Titus Tatius, nearly capturing the city. Yet the Sabine women unexpectedly threw themselves between the armies, pleading that their fathers and husbands not be lost on the same day._

Choices (Rewards):  
- Accept the will of the Gods and establish joint rule over the city. (+1 Fortune)  
- Embrace political alliances formed through this union. (Pick 1 Action card)
  
## Summarized Prototype Notes Sep-12 2024

### Overall Gameplay

- Player goes through series of encounters of different types: Event, Battle, Reward, Shop, Rest.
- Main carry-over resource is Fortune. Also, player carries over his deck to next encounter.
- Player chooses next encounter from the map, like in Slay the Spire
- Encounters consist of "steps", each step presenting a short historical snippet (2-3 sentences).

### Map Representation
- Future encounters are represented by an icon of their type.
- Resolved encounters are represented by a thumbnail of their main visual.

### Encounter Mechanics

- Events consists of multiple steps, each offering different choices to progress (requiring randomly two of: Fortune, army, money) and final option to chose a reward (extra Fortune or an action card)
- Battle encounters follow a 3-step structure:
  1. Preparation: Choices requiring resources.
  2. Battle: Core battle mechanics (separate from other encounters).
  3. Reward: Choice of extra Fortune or random action card.
- Each encounter has a single main visual that stays consistent through multiple steps to reduce complexity.

### Player and Enemy Representation
- Player is represented by a **single Roman figure**.
- Enemies (e.g., Caenina, Crustumerium, Antemnae) are represented by **tribal figurines**.
- **Next action** is shown above each enemy (e.g., attack Fortune, call reinforcements).
- **Enemy Tooltip**: Displays enemy **Battle Strength**, **next action**, and **what can be done** to them (e.g., “Bribe with 1 more Money card”).
- **Player Tooltip**: Displays **Fortune shield status**, remaining actions, and what actions the player can take (e.g., "Drag Money to shield Fortune").
 
### Player Actions:
- **Attack**: Dragging an Army card to an enemy reduces its **Battle Strength** by Army value of the card.
- **Bribe**: Bribing an enemy requires **2 Money cards**. 
  - Dragging the first Money card to an enemy shows a **gold icon** above their head, indicating they can be bribed with one more Money card.
  - Once the second Money card is dragged, the bribe succeeds, and the enemy’s Battle Strength decreases by 1.
- **Defend**: 2 Money cards are required to create a shield for player's Fortune.
  - A **shield icon** appears after the second card.
  - **Shields last until broken** by an enemy attack, and **shields can be stacked** for additional protection.
- **Spend Fortune** to draw an extra card or take an additional action.
- When a player chooses to spend **Fortune**, it's deducted from their Fortune total.
- Playing a card moves it to the **discard pile**

### Enemy Actions:
- **Attack**: Reduces the player's **Fortune** by 1 or breaks 1 shield if present.
  - When an enemy attacks, the figure **swells** or **pulses**, with an attack effect (e.g., a red line or icon hitting the Fortune counter or the shield if it's active).
- **Reinforce**: Increases the tribe's **Battle Strength** by 1.
  - When an enemy calls reinforcements, the figure **glows** or **swells slightly**, with their strength number increasing.
- Other attack types to be used by later enemies:
  - **Reduce Actions**: Lowers the player's available actions next turn by 1.
  - **Force Discard**: Randomly discards 1 card from the player's hand.

### Cards:
- **Army Cards**: Used to attack enemies and reduce their Battle Strength.
- **Money Cards**: Used to bribe enemies or build defenses to protect Fortune. 
- **Action Cards**: Provide normal resources (money, army) and tactical bonuses such as drawing extra cards or gaining extra actions.
  - **Roman Phalanx**: Provides 2 Army value.  
  - **Grain Harvest**: Provides 2 Money value.  
  - **Patrician Clans**: Provides 1 Army value and gains 1 extra action.  
  - **Plebs**: Draw 2 cards and gain 1 extra action.  
  - **Regional Trade**: Provides 1 Money value and draws 1 card.    

### Battle Mechanics:
- Player Starts with 5 cards in hand and 3 actions per turn.
- Each battle turn consists of the player performing actions, followed by enemy actions (single action per enemy).
- After both player and enemy have taken their actions, a new turn begins
- Player draws 3 cards at the start of each turn.
- Battles continue until all enemies' Battle Strength is reduced to 0 (**Victory**) or the player’s Fortune reaches 0 (**Failure**)

  
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
