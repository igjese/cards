# Chronicles: Roman Empire - Game Design Document

## Goal
Goal is to create Solitaire Deck Building game that educates the player about Roman era. If successful, I can continue doing this into my retirement.

## Gameplay
Based on Dominion paradigm, but single player. 
- To aim more at "solitaire-like" experience.
- To allow (maybe) for more lenghty games, maybe different campaign types that vary in expected game length.

## Educational Aspect
Each new game can focus on a single card (e.g. Julius Caesar, or Roman Legions) and provide basic but accurate historical information.

## Implementation
Cheapest possible, since the whole idea is to do this solo.
- Use GPT to create visuals.
- Use Godot to develop a product.

## Supply cards

| Type        | Card Name   | Cost              | Provides     | Notes                        |
|-------------|-------------|-------------------|--------------|------------------------------|
| Money       | Sestertii   | 0$                | 1$           | Basic currency unit          |
| Money       | Denarii     | 3$                | 2$           | Intermediate currency unit   |
| Money       | Aurei       | 6$                | 3$           | High-value currency unit     |
| Provisions  | Grain       | 2$                | 1 provision  | Basic sustenance resource    |
| Provisions  | Olive Oil   | 3$                | 2 provisions | Mid-level resource           |
| Provisions  | Wine        | 4$                | 3 provisions | High-level resource          |
| Might       | Centuriae   | 1$ + 1 provisions | 1 might      | Basic military unit          |
| Might       | Cohort      | 5$ + 3 provisions | 3 might      | Intermediate military unit   |
| Might       | Legion      | 9$ + 5 provisions | 5 might      | Advanced military unit       |
