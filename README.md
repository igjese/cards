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

## Territory cards
- Territory cards are in 3 piles, with only top card being available/visible.

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


## Tresure cards
- There are three types of treasure: money, provisions and army. Each of tresure cards have their own pile.

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
- History cards can be events or figures from Roman history

Cards:
- Province Uprising                
- Senate Session          
- Barbarian Invasion      
- Pax Romana              
- Julius Caesar           
- Augustus                
- Marcus Aurelius         
- Hadrian                 
- Seneca                  
- Constantine the Great   
- Trajan                  
- Scipio Africanus        
- Cicero                  
- Nero                    
- Plague of Galen
- Good Harvest
- Magistrate Election
- Caligula
- Great Burning of Rome
- Punic Wars
- Pantheon 
- Colosseum 
- Julian Calendar
- Roman Numerals
- Rise of Christianity
- Jupiter
- Mars
- Venus
- Minerva
- Neptune
- First Triumvirate
- The Year of Four Emperors
- Reforms of Diocletian
- Council of Nicaea
- Latin Language
- Roman Decadence
- Empire Decline

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
