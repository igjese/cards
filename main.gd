extends Node2D

var cards_raw = []
var cards_by_name = {}

# Called when the node enters the scene tree for the first time.
func _ready():
    load_cards_from_csv()
    
    setup_card_visual_and_data($CardHistory, "Julius Caesar")
    setup_card_visual_and_data($CardMoney1, "Sestertius")
    setup_card_visual_and_data($CardMoney2, "Denarius")
    setup_card_visual_and_data($CardMoney3, "Aureus")


# Assumes cards_by_name is a dictionary where keys are card names
# and values are dictionaries containing the card's data.
func setup_card_visual_and_data(card: Control, card_name: String) -> void:
    if not cards_by_name.has(card_name):
        print("Card name not found: ", card_name)
        return
    
    var card_data = cards_by_name[card_name]
    
    var money_icon = "\uf51e"
    var provisions_icon = "\uf5d1"
    var army_icon = "\uf132"

    var money_cost = "%s %d" % [money_icon, card_data.cost_money]
    var provisions_cost = "   %s %d" % [provisions_icon, card_data.cost_provisions] if card_data.cost_provisions != 0 else ""
    var army_cost = "   %s %d" % [army_icon, card_data.cost_army] if card_data.cost_army != 0 else ""
    var money_effect = "%s %d\n" % [money_icon, card_data.effect_money] if card_data.effect_money != 0 else ""
    var provisions_effect = "%s %d\n" % [provisions_icon, card_data.effect_provisions] if card_data.effect_provisions != 0 else ""
    var army_effect = "%s %d\n" % [army_icon, card_data.effect_army] if card_data.effect_army != 0 else ""
    
    card.set_title(card_data.name)
    card.set_effect("%s%s%s" % [money_effect, provisions_effect, army_effect])
    card.set_cost("%s%s%s" % [money_cost, provisions_cost, army_cost])
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
            "cost_provisions": int(card_data[3]),
            "cost_army": int(card_data[4]),
            "effect_money": int(card_data[5]),
            "effect_provisions": int(card_data[6]),
            "effect_army": int(card_data[7])
        }
        cards_raw.append(card)
        cards_by_name[card["name"]] = card

    file.close()
    
    print("Cards loaded: ", cards_raw)
