extends Node2D

var cards_raw = []
var cards_by_name = {}

var decks = {
    "Money1": {"cards": [], "node": null},
    "Money2": {"cards": [], "node": null},
    "Army1": {"cards": [], "node": null},
    "Army2": {"cards": [], "node": null},
    "History": {"cards": [], "node": null},
    "Victory": {"cards": [], "node": null},
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


# Called when the node enters the scene tree for the first time.
func _ready():
    load_cards_from_csv()
    load_decks()
    
    decks["Money1"]["node"] = $CardMoney1
    decks["Money2"]["node"] = $CardMoney2
    decks["Army1"]["node"] = $CardArmy1
    decks["Army2"]["node"] = $CardArmy2
    decks["History"]["node"] = $CardHistory

    
    display_card(decks["History"]["node"], "Julius Caesar")
    display_card($CardMoney1, "Barter Goods")
    display_card($CardMoney2, "Aes Rude")
    display_card($CardArmy1, "Civil Militia")
    display_card($CardArmy2, "Centuria")

    
    
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
    var army_cost = "   %s %d" % [army_icon, card_data.cost_army] if card_data.cost_army != 0 else ""
    var money_effect = "%s %d\n" % [money_icon, card_data.effect_money] if card_data.effect_money != 0 else ""
    var army_effect = "%s %d\n" % [army_icon, card_data.effect_army] if card_data.effect_army != 0 else ""
    
    card.set_title(card_data.name)
    card.set_effect("%s%s" % [money_effect, army_effect])
    card.set_cost("%s%s" % [money_cost, army_cost])
    card.set_visual(card_name)



func load_cards_from_csv():
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
            "cost_army": int(card_data[3]),
            "effect_money": int(card_data[4]),
            "effect_army": int(card_data[5])
        }
        cards_raw.append(card)
        cards_by_name[card["name"]] = card

    file.close()
    
    print("Cards loaded: ", cards_raw)

func load_decks():
    for card in cards_raw:
        var deck_key = card["type"]
        if decks.has(deck_key):
            decks[deck_key]["cards"].append(card)
        else:
            print("Deck key not found: ", deck_key)
    print(decks)

func _on_btn_exit_pressed():
    get_tree().quit()
