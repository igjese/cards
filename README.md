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

For treasure cards: Maybe have only money for the first period, later adding army, and only in the last one adding provisions (as another type of progression from lean and simple into complex and vast).

Example cards for the first period:

| Title              | Reason                  |
|--------------------|-------------------------|
| Romulus            | Founding Father         |
| Senate             | Civic Foundation        |
| Etruscans          | Cultural Influence      |
| Sabine Women       | Community Growth        |
| Social Reforms     | Servius Tullius         |
| Forum              | Public Space            |
| Twelve Tables      | Foundation of Law       |
| Magna Graecia      | Cultural Intersection   |
| Roman Gods         | Divine Assistance       |
| Romulus and Remus  | Legendary Founders      |
| Castor and Pollux  | Divine Twins            |
| Plebs              | Voice of the People     |
| Patricians         | Noble Families          |
| Roman Senate       | Legislative Authority   |
| Roman Magistrates  | Executive Power         |
| Plebeian Tribunes  | Protectors of the People|
| Vestal Virgins     | Keepers of the Sacred Flame   |
| River Tiber        | Geographic advantage    |
| Trade Settlements  | Economic development    |
| Military Outposts  | Defense                 |
| Citizen Militia    | Civil defense           |
| Roman Phalanxes    | Early Military          |
| Cattle Market      | Economic activity       |
| First Alliance     | Diplomacy               |
| Temple of Jupiter  | Religious significance  |
| Latin Language     | Cultural integration    |

Victory cards (in succession once the first is "purchased") for the first period:

| Title              | Subtitle                |
|--------------------|-------------------------|
| King's Exile       |     |
| Elected Consuls    |     |
| End of Kings       |     |

More:
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
- Roman Gods         
- Vestal Virgins        
- Pontifex Maximus
- Latin Language
- Magna Graecia      
- Regional Trade
- Agrarian Economy

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

