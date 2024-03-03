# "Chronicles: Roman Empire" - Game Design Document

## Goal
Goal is to create Solitaire Deck Building game that educates the player about Roman era. If successful, I can continue doing this into my retirement.

- Gameplay: Aims to play like Dominion, but single player. 
- Educational aspect: Each new game can focus on a single card (e.g. Julius Caesar, or Roman Legions) and provide interesting but accurate historical information.

## Implementation
Cheapest possible, since the whole idea is to do this solo.
- Use GPT to create visuals.
- Use Godot to develop a product.
- Keep as close to Dominion formula as we can.

## Gameplay
- Player starts with 10 cards in a deck, each hand is 5 cards
- Starting deck is 1x Italy (territory), 2x Centuriae (army), 3x Grain (provisions), 5x Sestertii (money)
- Player wins when acquiring all territory cards.

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

| Territory        | Pile       | Cost ($) | Cost Provisions | Cost Army | Effect                                          |
|------------------|------------|----------|-----------------|-----------|-------------------------------------------------|
| Sicily           | Basic      | 2        | 1               | 1         | Add 1 provision.                                |
| Sardinia         | Basic      | 2        | 1               | 1         | Add 1 Denari.                                   |
| Hispania         | Basic      | 3        | 2               | 1         | Add 1 army.                                     |
| Gaul             | Normal     | 5        | 3               | 2         | Add 2 provisions, 1 Denari.                     |
| Egypt            | Normal     | 5        | 2               | 3         | Add 2 Denari.                                   |
| Asia Minor       | Normal     | 4        | 3               | 2         | Add 1 army, 1 provision.                        |
| Britannia        | Expensive  | 7        | 4               | 3         | Add 2 army, detract 1 provision each turn.      |
| Dacia            | Expensive  | 8        | 4               | 4         | Add 3 Denari, detract 2 provisions each turn.   |
| Germania         | Expensive  | 7        | 5               | 3         | Add 1 Denari, 1 army, detract 1 army each turn. |

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

| Action Card             | Cost to Buy (Denarii, Provisions, Army) | Immediate Effect When Played                                  |
|-------------------------|-----------------------------------------|---------------------------------------------------------------|
| Public Forum            | 3, 1, 0                                 | Draw 2 additional cards immediately.                           |
| Military Triumph        | 4, 0, 2                                 | Gain 1 temporary army card to use this turn.                   |
| Public Bath             | 2, 2, 0                                 | Gain 1 Denarii and refresh 1 spent action card.                |
| Theatrical Play         | 2, 0, 0                                 | Gain 1 Denarii and 1 provision immediately.                    |
| Gladiator Games         | 3, 0, 1                                 | Discard 1 card to draw 3 cards immediately.                    |
| Chariot Races           | 3, 1, 0                                 | Gain 2 Denarii or 2 provisions (player's choice) immediately.  |
| Aqueduct                | 5, 3, 0                                 | Gain 3 provisions immediately.                                 |
| Roman Bridge            | 4, 2, 1                                 | Gain 1 territory card immediately without paying its cost.     |
| Roman Road              | 3, 2, 0                                 | Reduce the cost of the next action card you buy this turn by 2 Denarii. |
| Courrier Service: Cursus publicus | 4, 0, 0                           | Play 1 additional action card immediately.                     |
| Sewers                  | 3, 3, 0                                 | Gain 2 provisions immediately.                                 |
| Newspapers: Acta Diurna | 2, 1, 0                                 | Look at the top 3 cards of the deck and draw 1 immediately.    |
| Bureaucracy             | 5, 0, 0                                 | Draw 1 action card from the game's market immediately.         |
| City Planning           | 6, 0, 1                                 | Gain 1 territory card immediately without paying its cost.     |
| Roman Law               | 4, 2, 0                                 | Negate the effect of the next history card you draw this turn. |
| Bread and circuses      | 3, 0, 1                                 | Immediately gain 3 provisions.                                |
| Military Medicine       | 5, 1, 2                                 | Recover 1 army card from your discard pile immediately.        |
| Legionary Training      | 4, 3, 1                                 | Gain 1 temporary army card to use this turn.                   |
| Roman Citizenship       | 6, 0, 0                                 | Gain 2 Denarii immediately.                                    |
| Basilica: Christian Temple | 5, 2, 0                               | Gain 1 Denarii and draw 1 card immediately.                    |
| Temple of Jupiter       | 4, 1, 1                                 | Double the effect of the next card you play this turn.         |
| Temple of Mars          | 5, 0, 3                                 | Gain 1 territory card immediately without paying its army requirement. |
| Saturnalia Festival     | 2, 0, 0                                 | Gain 1 of each resource (Denarii, provision) immediately.      |
| Vestalia Festival       | 2, 2, 0                                 | Gain 2 provisions immediately.                                |
| Roman Welfare           | 3, 1, 0                                 | Gain 1 Denarii and 1 provision immediately.                    |
