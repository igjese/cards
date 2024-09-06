# "Chronicles: Rise of Rome" - Game Design Document

## Discussion Sep-6 2024

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
- **Visual Layout**: Each encounter has a **single visual** that stays consistent through multiple steps to reduce complexity.
> - **Each encounter type** (Event, Battle, Treasure, Shop, Rest) has a unique **icon** representing it
> - The player can choose the **next encounter** from a map, similar to the approach used in "Slay the Spire."
> - **After completing an encounter**, the encounter's **icon** is replaced on the map with a **smaller version** of the encounter's **main visual** (to mark it as completed).


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
