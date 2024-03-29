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
- Use GPT to create visuals.
- Use Godot to develop a product.
- Keep as close to Dominion formula as we can.


## Gameplay

Going in stages corresponding to historical periods, the first is founding of Rome and kingdom, ending with battle of Lake Regillus.

Money:
- Barter Goods
- Aes Rude

Army: 
- Citizen Militia
- Centuriae

Example cards for the first period:
- Grain Harvest
- Roman Senate
- Etruscan Neighbours
- Public Forum
- Roman Gods
- Plebs
- Patrician Clans
- Roman Sewers
- Early Roads
- Agrarian Economy
- Regional Trade
- Vestal Virgins
- River Tiber
- Palatine Hill
- Roman Magistrates
- Latin Language
- Saturnalia
- Private Schools
- Romulus
- Sabine Women
- Palatine Hill
- King's Election
- Military Outposts
- Roman Phalanxes
- Curiate Assembly
- Solar Calendar
- Urban Prefect
- Latin League
- Port of Ostia
- Circus Maximus
- Servian Wall
- Servian Reforms
- Centuriate Assembly
- Pontifex Maximus
- Magna Graecia
- Debt Bondage
- Military Triumph
- Temple of Jupiter

Victory cards (in succession once the first is "purchased") for the first period:
1. King's Exile     
2. Elected Consuls 
3. End of Kings 

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

## Old / Obsolete (just for reference or re-use)

### Gameplay
1. Player starts with 10 cards in a deck. Starting deck is 1x Italy (territory), 2x Centuriae (army), 3x Grain (provisions), 5x Sestertii (money)
2. Each turn next history card is drawn, while player is dealt new hand of 5 cards
3. Player has 1 action available and plays action cards
4. Effects are accumulated (treasures etc)
5. Player can buy one card (unless some effect specify differently)
6. Game proceeds to next round
7. Player wins when acquiring all territory cards.

- Endgame: game needs some kind of climax. Ideas: barbarian invasions, final battle, final conquest like Persia or "Known World, something (clear and clymactic end) - maybe when you take all, there is single win-or-lose round or something (might make sense because you are never forced to conquer last territories, so you choose the time)
- Missing: not sure whether to include "collapse stuff" in (4 tribunes, split, Constantinople, two sacks of Rome...)
- Loss aversion: maybe sholdn't lose territory, do some other penalty instead
- Alternative: game goes in chronological stages, with separate History and Territory (maybe even Action?) cards for each stage.

### Tresure cards
- There are three types of treasure: money, provisions and army. Each of tresure cards have their own pile.

| Type        | Card Name   | Cost              | Provides     | Notes                        |
|-------------|-------------|-------------------|--------------|------------------------------|
| Money       | Sestertius  | 0$                | 1$           | Basic currency unit          |
| Money       | Denarius    | 3$                | 2$           | Intermediate currency unit   |
| Money       | Aureus      | 6$                | 3$           | High-value currency unit     |
| Provisions  | Grain       | 2$                | 1 provision  | Basic sustenance resource    |
| Provisions  | Olive Oil   | 3$                | 2 provisions | Mid-level resource           |
| Provisions  | Wine        | 4$                | 3 provisions | High-level resource          |
| Army        | Centuriae   | 1$ + 1 provisions | 1 army       | Basic military unit          |
| Army        | Cohort      | 5$ + 3 provisions | 3 army       | Intermediate military unit   |
| Army        | Legion      | 9$ + 5 provisions | 5 army       | Advanced military unit       |

- For first period we'll go with one type of treasure only (money)

### Territory cards
- Territory cards are in 3 piles: Early, Mid and Expensive conquest - only top card of a deck is being available/visible.

| Territory         | Reason                    |
|-------------------|---------------------------|
| Italy             | Starting point.           |
| Sicily            | Fertile land.             |
| Sardinia          | Wealthy mines.            |
| Greece (Achaea)   | Cultural influence.       |
| North Africa      | Grain supply.             |
| Hispania          | Diverse resources.        |
| Syria             | Strategic position.       |
| Gaul              | Conquered legions.        |
| Ilyricum          | Trade routes.             |
| Egypt             | Breadbasket.              |
| Asia Minor        | Wealth accumulation.      |
| Britannia         | Difficult terrain.        |
| Dacia             | Gold mines.               |
| Germania          | Military challenge.       |


### History Cards
- At the beginning of every turn, one history card is drawn.
- History cards can be events or figures from Roman history
  
| History Card               | Reason                  |
|----------------------------|-------------------------|
| Province Uprising          | Instability.            |
| Senate Session             | Lobbying success.       |
| Barbarian Invasion         | Invasion defense.       |
| Pax Romana                 | Peaceful period.        |
| Julius Caesar              | Leadership.             |
| Augustus                   | Expansion.              |
| Marcus Aurelius            | Stoicism.               |
| Hadrian                    | Defense.                |
| Seneca                     | Resource optimization.  |
| Constantine the Great      | Transformation.         |
| Trajan                     | Prosperity.             |
| Scipio Africanus           | Military genius.        |
| Cicero                     | Strategic thinking.     |
| Nero                       | Mismanagement.          |
| Plague of Galen            | Illness.                |
| Good Harvest               | Bountiful yield.        |
| Magistrate Election        | Political maneuver.     |
| Caligula                   | Unpredictability.       |
| Great Burning of Rome      | Devastation.            |
| Punic Wars                 | Conflict.               |
| Pantheon                   | Divine favor.           |
| Colosseum                  | Entertainment.          |
| Julian Calendar            | Administrative reform.  |
| Roman Numerals             | Efficiency.             |
| Rise of Christianity       | Transformation.         |
| Jupiter                    | Divine favor.           |
| Mars                       | War god.                |
| Venus                      | Fertility.              |
| Minerva                    | Wisdom.                 |
| Neptune                    | Sea god protection.     |
| First Triumvirate          | Political alliance.     |
| The Year of Four Emperors  | Instability.            |
| Reforms of Diocletian      | Administrative reform.  |
| Council of Nicaea          | Unification.            |
| Latin Language             | Cultural spread.        |
| Roman Decadence            | Moral decline.          |
| Empire Decline             | Control loss.           |


### ACTION CARDS 
- Each game choses 8 of these and provides full deck for each, player can buy them

| Action Card             | Reason                  |
|-------------------------|-------------------------|
| Public Forum            | Civic engagement.       |
| Military Triumph        | Victory celebration.    |
| Public Bath             | Social welfare.         |
| Theatrical Play         | Cultural entertainment. |
| Gladiator Games         | Spectacle.              |
| Chariot Races           | Competitive spirit.     |
| Aqueduct                | Infrastructure.         |
| Roman Bridge            | Engineering marvel.     |
| Roman Road              | Connectivity.           |
| Courrier Service: Cursus publicus | Communication.  |
| Sewers                  | Sanitation.             |
| Newspapers: Acta Diurna | Public information.     |
| Bureaucracy             | Administration.         |
| City Planning           | Urban development.      |
| Roman Law               | Legal order.            |
| Bread and circuses      | Public appeasement.     |
| Military Medicine       | Healthcare.             |
| Legionary Training      | Military readiness.     |
| Roman Citizenship       | Civic privilege.        |
| Basilica: Christian Temple | Religious gathering. |
| Temple of Jupiter       | Divine favor.           |
| Temple of Mars          | War deity.              |
| Saturnalia Festival     | Festivity.              |
| Vestalia Festival       | Religious celebration.  |
| Roman Welfare           | Social support.         |

