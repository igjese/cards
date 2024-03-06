extends Node2D

var cards_raw = []

# Called when the node enters the scene tree for the first time.
func _ready():
    load_cards_from_csv()
    
    var card = $CardHistory
    card.set_title("Julius Caesar")
    card.set_effect("\uf132 1\n\uf5d1 2")
    card.set_cost("\uf51e 2  \uf132 1  \uf5d1 2")
    
    card = $CardMoney1
    card.set_visual("res://cards//sestertius100.png")
    card.set_title("Sestertius")
    card.set_cost("\uf51e 0")
    card.set_effect("\uf51e 1")
    
    card = $CardMoney2
    card.set_visual("res://cards//denarius100.png")
    card.set_title("Denarius")
    card.set_cost("\uf51e 3")
    card.set_effect("\uf51e 2")
    
    card = $CardMoney3
    card.set_visual("res://cards//aureus100.png")
    card.set_title("Aureus")
    card.set_cost("\uf51e 6")
    card.set_effect("\uf51e 3")

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
            "name": card_data[0],
            "type": card_data[1],
            "cost_money": int(card_data[2]),
            "cost_provisions": int(card_data[3]),
            "cost_army": int(card_data[4]),
            "effect_money": int(card_data[5]),
            "effect_provisions": int(card_data[6]),
            "effect_army": int(card_data[7])
        }
        cards_raw.append(card)

    file.close()
    
    print("Cards loaded: ", cards_raw)
