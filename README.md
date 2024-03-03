# "Chronicles: Roman Empire" - Game Design Document

## Goal
Goal is to create Solitaire Deck Building game that educates the player about Roman era. If successful, I can continue doing this into my retirement.

- Gameplay: Aims to play like Dominion, but single player. 
- Educational aspect: Each new game can highlight a single card (e.g. Julius Caesar, or Roman Legions) and provide interesting but accurate historical information. (intro screen, player needs to click "continue" to proceed)

## Implementation
Cheapest possible, since the whole idea is to do this solo.
- Use GPT to create visuals.
- Use Godot to develop a product.
- Keep as close to Dominion formula as we can.

## Gameplay
1. Player starts with 10 cards in a deck. Starting deck is 1x Italy (territory), 2x Centuriae (army), 3x Grain (provisions), 5x Sestertii (money)
2. Each turn next history card is drawn, while player is dealt new hand of 5 cards
3. Player has 1 action available and plays action cards
4. Effects are accumulated (treasures etc)
5. Player can buy one card (unless some effect specify differently)
6. Game proceeds to next round
7. Player wins when acquiring all territory cards.

## Tresure cards
- There are three types of treasure: money, provisions and army. Each of tresure cards have their own pile.

| Type        | Card Name   | Cost              | Provides     | Notes                        |
|-------------|-------------|-------------------|--------------|------------------------------|
| Money       | Sestertium   | 0$                | 1$           | Basic currency unit          |
| Money       | Denarium     | 3$                | 2$           | Intermediate currency unit   |
| Money       | Aurei       | 6$                | 3$           | High-value currency unit     |
| Provisions  | Grain       | 2$                | 1 provision  | Basic sustenance resource    |
| Provisions  | Olive Oil   | 3$                | 2 provisions | Mid-level resource           |
| Provisions  | Wine        | 4$                | 3 provisions | High-level resource          |
| Army        | Centuriae   | 1$ + 1 provisions | 1 army       | Basic military unit          |
| Army        | Cohort      | 5$ + 3 provisions | 3 army       | Intermediate military unit   |
| Army        | Legion      | 9$ + 5 provisions | 5 army       | Advanced military unit       |

## Territory cards
- Territory cards are in 3 piles: Early, Mid and Expensive conquest - only top card of a deck is being available/visible.

| Territory         | Category          | Cost (Denarii, Provisions, Army)  | Effect When Played              | Reason                    |
|-------------------|-------------------|-----------------------------------|---------------------------------|---------------------------|
| Italy             | Base Territory    | N/A                               | Gain 1 of each resource.        | Starting point.           |
| Sicily            | Early Conquest    | 2, 1, 0                           | Gain 1 provision each turn.     | Fertile land.             |
| Sardinia          | Early Conquest    | 2, 1, 0                           | Gain 1 Denarii each turn.       | Wealthy mines.            |
| Greece (Achaea)   | Early Conquest    | 3, 2, 1                           | Draw 1 additional card.         | Cultural influence.       |
| North Africa      | Early Conquest    | 3, 1, 1                           | Gain 2 provisions each turn.    | Grain supply.             |
| Hispania          | Mid Conquest      | 4, 2, 2                           | Gain 1 Denarii, 1 provision.    | Diverse resources.        |
| Syria             | Mid Conquest      | 4, 3, 2                           | Gain 1 army card.               | Strategic position.       |
| Gaul              | Mid Conquest      | 5, 2, 3                           | Gain 2 army cards.              | Conquered legions.        |
| Ilyricum          | Mid Conquest      | 4, 3, 2                           | Gain 1 provision, 1 Denarii.    | Trade routes.             |
| Egypt             | Mid Conquest      | 5, 3, 1                           | Gain 3 provisions each turn.    | Breadbasket.              |
| Asia Minor        | Mid Conquest      | 5, 3, 2                           | Gain 2 Denarii each turn.       | Wealth accumulation.      |
| Britannia         | Expensive Conquest| 6, 4, 3                           | Gain 1 army, 1 provision.       | Difficult terrain.        |
| Dacia             | Expensive Conquest| 7, 4, 3                           | Gain 2 Denarii, 1 provision.    | Gold mines.               |
| Germania          | Expensive Conquest| 7, 5, 4                           | Gain 2 army cards.              | Military challenge.       |

## History Cards
- At the beginning of every turn, one history card is drawn.
- History cards can be events or figures from Roman history
  
| History Card               | Effect                                                  | Reason                  |
|----------------------------|---------------------------------------------------------|-------------------------|
| Province Uprising          | Lose 1 provision.                                       | Instability.            |
| Senate Session             | Gain 1 Denarii.                                         | Lobbying success.       |
| Barbarian Invasion         | Discard 1 army card.                                    | Invasion defense.       |
| Pax Romana                 | No negative events.                                     | Peaceful period.        |
| Julius Caesar              | Draw 1 additional card.                                 | Leadership.             |
| Augustus                   | Gain 1 territory card.                                  | Expansion.              |
| Marcus Aurelius            | Gain 1 wisdom token.                                    | Stoicism.               |
| Hadrian                    | Negate next territory loss.                             | Defense.                |
| Seneca                     | Gain 1 provision.                                       | Resource optimization.  |
| Constantine the Great      | Convert action card to resource card.                   | Transformation.         |
| Trajan                     | Gain 1 Denarii and 1 provision.                         | Prosperity.             |
| Scipio Africanus           | Gain 1 temporary army card.                             | Military genius.        |
| Cicero                     | Draw 2 cards then discard 1.                            | Strategic thinking.     |
| Nero                       | Discard 1 provision.                                    | Mismanagement.          |
| Plague of Galen            | Lose 1 army card.                                       | Illness.                |
| Good Harvest               | Gain 2 provisions.                                      | Bountiful yield.        |
| Magistrate Election        | Add 1 card from discard to hand.                        | Political maneuver.     |
| Caligula                   | Randomly discard 1 card.                                | Unpredictability.       |
| Great Burning of Rome      | Lose 1 territory card.                                  | Devastation.            |
| Punic Wars                 | Discard 1 army card.                                    | Conflict.               |
| Pantheon                   | Draw 1 extra card of chosen type next turn.             | Divine favor.           |
| Colosseum                  | Gain 1 Denarii.                                         | Entertainment.          |
| Julian Calendar            | Reorganize top 3 cards of deck.                         | Administrative reform.  |
| Roman Numerals             | Gain 1 Denarii.                                         | Efficiency.             |
| Rise of Christianity       | Exchange 1 action card.                                 | Transformation.         |
| Jupiter                    | Gain 1 temporary army strength.                         | Divine favor.           |
| Mars                       | Gain 1 temporary army card.                             | War god.                |
| Venus                      | Gain 1 provision.                                       | Fertility.              |
| Minerva                    | Draw 1 card.                                            | Wisdom.                 |
| Neptune                    | Negate next negative event.                             | Sea god protection.     |
| First Triumvirate          | Choose 3 cards, keep 1.                                 | Political alliance.     |
| The Year of Four Emperors  | Discard 2 cards, then draw 1.                           | Instability.            |
| Reforms of Diocletian      | Organize hand and discard pile.                         | Administrative reform.  |
| Council of Nicaea          | Play an action card twice.                              | Unification.            |
| Latin Language             | Gain 1 Denarii.                                         | Cultural spread.        |
| Roman Decadence            | Lose 1 provision.                                       | Moral decline.          |
| Empire Decline             | Discard 1 territory card.                               | Control loss.           |


## ACTION CARDS 
- Each game choses 8 of these and provides full deck for each, player can buy them

| Action Card             | Cost (Denarii, Provisions, Army) | Immediate Effect         | Reason                  |
|-------------------------|-----------------------------------|--------------------------|-------------------------|
| Public Forum            | 3, 1, 0                           | Draw 2 additional cards. | Civic engagement.       |
| Military Triumph        | 4, 0, 2                           | Gain 1 temporary army.   | Victory celebration.    |
| Public Bath             | 2, 2, 0                           | Gain 1 Denarii, refresh 1 card. | Social welfare.     |
| Theatrical Play         | 2, 0, 0                           | Gain 1 Denarii, 1 provision. | Cultural entertainment. |
| Gladiator Games         | 3, 0, 1                           | Discard 1, draw 3 cards. | Spectacle.              |
| Chariot Races           | 3, 1, 0                           | Gain 2 Denarii or 2 provisions. | Competitive spirit. |
| Aqueduct                | 5, 3, 0                           | Gain 3 provisions.       | Infrastructure.         |
| Roman Bridge            | 4, 2, 1                           | Gain 1 territory card.   | Engineering marvel.     |
| Roman Road              | 3, 2, 0                           | Reduce next card cost by 2 Denarii. | Connectivity.   |
| Courrier Service: Cursus publicus | 4, 0, 0                 | Play 1 additional action card. | Communication.      |
| Sewers                  | 3, 3, 0                           | Gain 2 provisions.       | Sanitation.             |
| Newspapers: Acta Diurna | 2, 1, 0                           | Look at top 3 cards, draw 1. | Public information.   |
| Bureaucracy             | 5, 0, 0                           | Draw 1 action card from market. | Administration.    |
| City Planning           | 6, 0, 1                           | Gain 1 territory card.   | Urban development.      |
| Roman Law               | 4, 2, 0                           | Negate next history card effect. | Legal order.       |
| Bread and circuses      | 3, 0, 1                           | Gain 3 provisions.       | Public appeasement.     |
| Military Medicine       | 5, 1, 2                           | Recover 1 army card.     | Healthcare.             |
| Legionary Training      | 4, 3, 1                           | Gain 1 temporary army.   | Military readiness.     |
| Roman Citizenship       | 6, 0, 0                           | Gain 2 Denarii.          | Civic privilege.        |
| Basilica: Christian Temple | 5, 2, 0                         | Gain 1 Denarii, draw 1 card. | Religious gathering. |
| Temple of Jupiter       | 4, 1, 1                           | Double next card effect. | Divine favor.           |
| Temple of Mars          | 5, 0, 3                           | Gain 1 territory card.   | War deity.              |
| Saturnalia Festival     | 2, 0, 0                           | Gain 1 of each resource. | Festivity.              |
| Vestalia Festival       | 2, 2, 0                           | Gain 2 provisions.       | Religious celebration.  |
| Roman Welfare           | 3, 1, 0                           | Gain 1 Denarii, 1 provision. | Social support.      |

