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

Cards:
- Public Forum
- Military Triumph
- Public Bath
- Theatrical Play
- Gladiator Games
- Chariot Races
- Aqueduct
- Roman Bridge
- Roman Road
- Courrier Service: Cursus publicus
- Sewers
- Newspapers: Acta Diurna
- Bureaucracy
- City Planning
- Roman Law
- Bread and circuses
- Military Medicine
- Legionary Training
- Roman Citizenship
- Basilica: Christian Temple
- Temple of Jupiter
- Temple of Mars
- Saturnalia Festival
- Vestalia Festival
- Roman Welfare

