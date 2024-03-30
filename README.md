# "Chronicles: Roman Empire" - Game Design Document

## Goal
Goal is to create Solitaire Deck Building game that educates the player about Roman era. If successful, I can continue doing this into my retirement.

- Gameplay: Aims to play like Dominion, but single player. 
- Educational aspect: Each new game can highlight a single card (e.g. Julius Caesar, or Roman Legions) and provide interesting but accurate historical information. (intro screen, player needs to click "continue" to proceed)
- Solo games, examples
    - Gate: https://www.thegamecrafter.com/games/gate1
    - Friday: https://boardgamegeek.com/boardgame/43570/friday

## Implementation
Cheapest possible, since the whole idea is to do this solo.
- Use pen-and-paper cards to prototype
- Use GPT to create visuals, in "Pompeii fresco" style for uniformity
- Use Godot to develop a product
- Keep as close to Dominion formula as we can

## Mechanics

Solitaire specific mechanics:
- Use additional "history" deck to provide random help and challenge during the game, both for education and replayability
- Use victory cards as culmination and real challenge
- Trash player's cards when not able to overcome history/victory cards, to put mild pressure to finish the game

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

Player learning curve and progression:
1. Start simple (kingdom, stage 1): only 2 cards for money and army each, cards have only basic effects 
2. Increase strategic complexity (republic, stages 2-3): 3 cards for money and army each, some advanced effects
3. Increase management overhead (empire, stages 3-4): additional 3 "provisions" cards, complex effects

## Gameplay

Decks are:
- 10 action card same-card decks (chosen at random). Five cards available in each
- History deck, shuffled to be random. Ends with victory cards in precise order.
- Treasure same-card decks (differ for each stage)
- Player's deck of 10 cards (7 basic money and 3 basic army)

Game loop:
1. Player draws five cards. When no cards are available, discarded cards are reshuffled and become new deck.
2. Player can play action cards from his hand (1 by default) with immediate effect.
3. At end of turn he must "overcome" a top history card. If successful, top history card is trashed. If not then top card from player's deck (or discarded deck) is trashed.
4. Player can buy action cards (1 by default).
5. Player discards used cards.

When all victory cards (last cards in history deck) has been "overcome", player wins this stage.

### Stage 1: Kingdom

Cards are:

| Money        | Army            | Action cards      | History cards       | Victory cards           |
|--------------|-----------------|-------------------|---------------------|-------------------------|
| Barter Goods | Citizen Militia | Grain Harvest     | Romulus             | King's Exile            |
| Aes Rude     | Centuria        | Roman Gods        | Sabine Women        | Elected Consuls         |
|              |                 | Plebs             | Curiate Assembly    | Battle of Lake Regillus |
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

More: Seven Hills, First Aquaduct

### Ideas for Republic

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
Mars
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
