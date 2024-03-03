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

## Supply cards
- There are three types of supply: money, provisions and army.

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

## Event cards
- Every time when player draws one or more territory cards, he also draws an even card.

| Event Card           | Simplified Effect                                        | Quantity |
|----------------------|----------------------------------------------------------|----------|
| Good Harvest         | Add 2 provisions to the territory card in hand.          | 2        |
| Uprising             | Spend 1 Legion to keep the territory card in hand, or discard it. | 2        |
| Senate Change Policy | Shuffle all territory piles and reveal the top card.     | 1        |
| Trade Embargo        | Reduce Denari production by 1 for the territory card in hand. | 2        |
| Barbarian Invasion   | Spend 2 Legions to keep the territory card in hand, or discard it. | 2        |
| Technological Advancement | Add 1 Denari production to the territory card in hand. | 2        |
| Diplomatic Marriage  | The territory card in hand costs 2 less Denari to acquire. | 1        |
| Economic Boom        | Add 1 Denari to your total for this turn.                | 2        |
| Plague               | Lose 2 provisions from your total for this turn.         | 2        |
| Pax Romana           | No event effect this turn; gain 1 extra action or buy.   | 4        |
