# Chronicles: Roman Empire - Game Design Document

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

## Territory cards
- Territory cards are in 3 piles, with only top card being available/visible.

| Territory        | Pile       | Cost ($) | Cost Provisions | Cost Army | Effect                                          | Quantity |
|------------------|------------|----------|-----------------|-----------|-------------------------------------------------|----------|
| Sicily           | Basic      | 2        | 1               | 1         | Add 1 provision.                                | 3        |
| Sardinia         | Basic      | 2        | 1               | 1         | Add 1 Denari.                                   | 3        |
| Hispania         | Basic      | 3        | 2               | 1         | Add 1 army.                                     | 3        |
| Gaul             | Normal     | 5        | 3               | 2         | Add 2 provisions, 1 Denari.                     | 2        |
| Egypt            | Normal     | 5        | 2               | 3         | Add 2 Denari.                                   | 2        |
| Asia Minor       | Normal     | 4        | 3               | 2         | Add 1 army, 1 provision.                        | 2        |
| Britannia        | Expensive  | 7        | 4               | 3         | Add 2 army, detract 1 provision each turn.      | 1        |
| Dacia            | Expensive  | 8        | 4               | 4         | Add 3 Denari, detract 2 provisions each turn.   | 1        |
| Germania         | Expensive  | 7        | 5               | 3         | Add 1 Denari, 1 army, detract 1 army each turn. | 1        |


## Supply cards
- There are three types of supply: money, provisions and army. Each of supply cards have their own pile.

| Type        | Card Name   | Cost              | Provides     | Notes                        |
|-------------|-------------|-------------------|--------------|------------------------------|
| Money       | Sestertii   | 0$                | 1$           | Basic currency unit          |
| Money       | Denarii     | 3$                | 2$           | Intermediate currency unit   |
| Money       | Aurei       | 6$                | 3$           | High-value currency unit     |
| Provisions  | Grain       | 2$                | 1 provision  | Basic sustenance resource    |
| Provisions  | Olive Oil   | 3$                | 2 provisions | Mid-level resource           |
| Provisions  | Wine        | 4$                | 3 provisions | High-level resource          |
| Army        | Centuriae   | 1$ + 1 provisions | 1 army       | Basic military unit          |
| Army        | Cohort      | 5$ + 3 provisions | 3 army       | Intermediate military unit   |
| Army        | Legion      | 9$ + 5 provisions | 5 army       | Advanced military unit       |

## History Cards
- At the beginning of every turn, one history card is drawn.
- History cards can be events or figures from Roman history, each with a unique immediate effect.

| History Card          | Effect                                                                      |
|-----------------------|-----------------------------------------------------------------------------|
| Good Harvest          | Gain +2 provisions this turn.                                               |
| Uprising              | Spend 1 army to quell or discard 1 territory card.                          |
| Senate Session        | Shuffle all territory piles and reveal the top card of each.                |
| Trade Embargo         | Reduce Denari production by 1 this turn.                                    |
| Barbarian Invasion    | Spend 2 army to defend or discard 1 territory card.                         |
| Technological Advancement | Gain +1 Denari this turn.                                                |
| Diplomatic Marriage   | Reduce the cost of acquiring a territory by 1 Denari and 1 provision this turn. |
| Economic Boom         | Gain +1 Denari this turn.                                                   |
| Plague                | Lose 2 provisions this turn.                                                |
| Pax Romana            | Ignore all event effects this turn; gain 1 extra action or buy.             |
| Julius Caesar         | Gain +2 army this turn for conquests.                                       |
| Augustus              | Reduce the cost of all actions and purchases by 1 this turn.                |
| Marcus Aurelius       | Choose and negate the effect of one event card this turn.                   |
| Hadrian               | Add +1 army and +1 Denari for this turn.                                    |
| Seneca                | Draw 1 extra card this turn.                                                |
| Constantine the Great | Convert 1 resource of one type to another this turn.                        |
| Trajan                | Gain +2 Denari this turn.                                                   |
| Scipio Africanus      | Automatically win against one military challenge this turn.                 |
| Cicero                | Gain +1 action this turn.                                                   |
| Nero                  | Discard up to 2 cards from your hand and draw that many cards.              |


