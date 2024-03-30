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
    refresh_gui()
    
    
# FUNCTIONS  ###################

func prepare_decks():
    empty_current_decks()
    assign_cards_to_decks()
    
    
func empty_current_decks():
    for deck in decks:
        decks[deck]["cards"].clear()
    
    
func refresh_gui():
    display_card($CardMoney1, "Barter Goods")
    display_card($CardMoney2, "Aes Rude")
    display_card($CardArmy1, "Civil Militia")
    display_card($CardArmy2, "Centuria")
    
    refresh_deck("History")
    
func refresh_deck(deck_name):
    var node = decks[deck_name]["node"]
    var card = decks[deck_name]["cards"][0]
    
    print(node, card)
    
    display_card(node, card["name"])
    
    
func assign_decks_to_nodes():
    for deck in decks:
        decks[deck]["node"] = get_node("Card" + deck)
        
    print("Decks - ", decks)
    
    
# Assumes cards_by_name is a dictionary where keys are card names
# and values are dictionaries containing the card's data.
func display_card(card: Control, card_name: String) -> void:
    if not cards_by_name.has(card_name):
        print("Card name not found: ", card_name)
        return
    
    var card_data = cards_by_name[card_name]
    
    var money_icon = "\uf51e"
    var army_icon = "\uf132"

    var money_cost = "%s %d" % [money_icon, card_data.cost_money]
    var money_effect = "%s %d\n" % [money_icon, card_data.effect_money] if card_data.effect_money != 0 else ""
    var army_effect = "%s %d\n" % [army_icon, card_data.effect_army] if card_data.effect_army != 0 else ""
    
    card.set_title(card_data.name)
    card.set_effect("%s%s" % [money_effect, army_effect])
    card.set_cost("%s" % money_cost)
    card.set_visual(card_name)


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
        }
        cards_raw.append(card)
        cards_by_name[card["name"]] = card

    file.close()
    
    for key in cards_by_name:
        print(key, cards_by_name[key])
    #print("Cards loaded: ", cards_raw)


func assign_cards_to_decks():
    var all_actions = []
    for card in cards_raw:
        var deck_key = card["type"]
        if deck_key in ["Money1","Money2","Army1","Army2"]:
            for i in range(single_card_deck_qty):
                decks[deck_key]["cards"].append(card)
        elif deck_key == "History":
            decks[deck_key]["cards"].append(card)
        elif deck_key == "Action":
            all_actions.append(card)
        else:
            print("Deck key not found: ", deck_key)
            
    decks["History"]["cards"].shuffle()
            
    for deck in ["Action1", "Action2", "Action3", "Action4", "Action5", "Action6", "Action7", "Action8", "Action9", "Action10"]:
        var choice = randi() % all_actions.size()
        for i in range(single_card_deck_qty):
            decks[deck]["cards"].append(all_actions[choice])
        all_actions.remove_at(choice)
    
    for deck in decks:
        print(deck, " - ", decks[deck]["cards"])


# SIGNALS #####################

func _on_btn_exit_pressed():
    get_tree().quit()


func _on_btn_new_game_pressed():
    new_game() # Replace with function body.
