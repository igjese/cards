extends Node2D

var cards_raw = []
var cards_by_name = {}
var single_card_deck_qty = 5

var decks = {
    "Money1": {"cards": [], "node": null},
    "Money2": {"cards": [], "node": null},
    "Army1": {"cards": [], "node": null},
    "Army2": {"cards": [], "node": null},
    "History": {"cards": [], "node": null},
    "Action1": {"cards": [], "node": null},
    "Action2": {"cards": [], "node": null},
    "Action3": {"cards": [], "node": null},
    "Action4": {"cards": [], "node": null},
    "Action5": {"cards": [], "node": null},
    "Action6": {"cards": [], "node": null},
    "Action7": {"cards": [], "node": null},
    "Action8": {"cards": [], "node": null},
    "Action9": {"cards": [], "node": null},
    "Action10": {"cards": [], "node": null},
    "PlayerDeck": {"cards": [], "node": null},
    "PlayerHand": {"cards": [], "node": null},
    "PlayerDiscarded": {"cards": [], "node": null},
    "Trash": {"cards": [], "node": null},
    "CardsPlayed": {"cards": [], "node": null}
}


# INIT #########################

func _ready():
    load_card_definitions_from_csv()
    assign_decks_to_nodes()
    new_game()


# GAME LOGIC ###################

func new_game():
    prepare_decks()
    new_turn()
    
    
func new_turn():
    deal_new_hand()
    refresh_gui()
    
    
func deal_new_hand():
    while decks["PlayerDeck"]["cards"].size() > 0 and decks["PlayerHand"]["cards"].size() < 5:
        decks["PlayerHand"]["cards"].append(decks["PlayerDeck"]["cards"].pop_front())
    
    print("PlayerHand - ", decks["PlayerHand"]["cards"],"\n")
    print("PlayerDeck - ", decks["PlayerDeck"]["cards"],"\n")
    
# FUNCTIONS  ###################

func prepare_decks():
    empty_current_decks()
    assign_cards_to_decks()
    
    
func empty_current_decks():
    for deck in decks:
        decks[deck]["cards"].clear()
    
    
func refresh_gui():    
    for deck in decks:
        refresh_deck(deck)
    
func refresh_deck(deck_name):
    var node = decks[deck_name]["node"]
    if node:
        var card = decks[deck_name]["cards"][0]
        display_card(node, card["name"])
    
    
func assign_decks_to_nodes():
    for deck in decks:
        decks[deck]["node"] = get_node("Card" + deck)
        
var cost_icons = {
    "cost_money": "\uf51e",
}
        
var effect_icons = {
    "effect_money": "\uf51e",
    "effect_army": "Army: ",
    "discard": "Discard: ",
    "trash": "Tr\\ash: ",
    "extra_buys": "Buy: ",
    "draw": "Draw: ",
    "extra_actions": "Actions: ",
    "replace": "Replace: ",
    "upgrade_2": "Upgra\\de: +2#",
    "double_action": "Double Action#",
    "take_4": "Take: \uf51e4#",
    "take_denarius": "Take: \uf51e3#",
    "trash_any": "Tr\\ash any: ",
    "take_5": "Take: \uf51e5#",
    "upgrade_money": "Upgra\\de \uf51e#",
}
    
    
# Assumes cards_by_name is a dictionary where keys are card names
# and values are dictionaries containing the card's data.
func display_card(card: Control, card_name: String) -> void:
    if not cards_by_name.has(card_name):
        print("Card name not found: ", card_name)
        return
        
    var card_data = cards_by_name[card_name]
    
    var cost_text = "%s%d" % [cost_icons["cost_money"], card_data["cost_money"]]
    
    var effect_text = ""
    for effect in effect_icons:
        if card_data[effect] != 0:
            effect_text = "%s%s%s\n" % [effect_text, effect_icons[effect], str(card_data[effect])]
    effect_text = effect_text.split("#")[0]
            
    card.set_title(card_data.name)
    card.set_effect(effect_text)
    card.set_cost(cost_text)
    card.set_visual(card_name)
    
    
func cost_text(cost, value):
    return cost_icons[cost] + str(value) + " "
    

func effect_text(effect, value):
    return effect_icons[effect] + str(value) + "\n"
    


func load_card_definitions_from_csv():
    var path = "res://cards.csv"
    
    var file = FileAccess.open(path, FileAccess.READ)
    if !file:
        print("Failed to open file: ", path)
        return

    file.get_line() # Skip the first line (header)
    while not file.eof_reached():   
        var line = file.get_line()
        if line == "":
            continue
        var card_data = line.split(",")
        var card = {
            "type": card_data[0],
            "name": card_data[1],
            "cost_money": int(card_data[2]),
            "effect_money": int(card_data[3]),
            "effect_army": int(card_data[4]),
            "discard": int(card_data[5]),
            "trash": int(card_data[6]),
            "extra_buys": int(card_data[7]),
            "draw": int(card_data[8]),
            "extra_actions": int(card_data[9]),
            "replace": int(card_data[10]),
            "upgrade_2": int(card_data[11]),
            "double_action": int(card_data[12]),
            "take_4": int(card_data[13]),
            "take_denarius": int(card_data[14]),
            "trash_any": int(card_data[15]),
            "take_5": int(card_data[16]),
            "upgrade_money": int(card_data[17]),
        }
        cards_raw.append(card)
        cards_by_name[card["name"]] = card

    file.close()


func assign_cards_to_decks():
    var all_actions = []
    var victory_cards = []
    var money1 = null
    var army1 = null
    for card in cards_raw:
        var deck_key = card["type"]
        if deck_key == "Money1":
            money1 = card
        if deck_key == "Army1":
            army1 = card
        if deck_key in ["Money1","Money2","Army1","Army2"]:
            for i in range(single_card_deck_qty):
                decks[deck_key]["cards"].append(card)
        elif deck_key == "History":
            decks[deck_key]["cards"].append(card)
        elif deck_key == "Action":
            all_actions.append(card)
        elif deck_key in ["Victory1","Victory2","Victory3"]:
            victory_cards.append(card)
        else:
            print("Deck key not found: ", deck_key)
            
    decks["History"]["cards"].shuffle()
    decks["History"]["cards"].append(victory_cards[0])
    decks["History"]["cards"].append(victory_cards[1])
    decks["History"]["cards"].append(victory_cards[2])
    
    for deck in ["Action1", "Action2", "Action3", "Action4", "Action5", "Action6", "Action7", "Action8", "Action9", "Action10"]:
        var choice = randi() % all_actions.size()
        for i in range(single_card_deck_qty):
            decks[deck]["cards"].append(all_actions[choice])
        all_actions.remove_at(choice)
        
    for i in range(7):
        decks["PlayerDeck"]["cards"].append(money1)
    for i in range(3):
        decks["PlayerDeck"]["cards"].append(army1)
    decks["PlayerDeck"]["cards"].shuffle()
    
    for deck_name in decks:
        print_deck_cards(deck_name, decks[deck_name])
        
# UTILS #######################

func print_deck_cards(deck_name,deck):
    var txt = deck_name + " - "
    for card in deck["cards"]:
        txt = txt + card["name"] + ","
    txt = txt.left(-1) + "\n"
    print(txt)

# SIGNALS #####################

func _on_btn_exit_pressed():
    get_tree().quit()


func _on_btn_new_game_pressed():
    new_game() # Replace with function body.
