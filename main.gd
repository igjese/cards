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
    "Discarded": {"cards": [], "node": null},
    "Trash": {"cards": [], "node": null},
    "CardsOnTable": {"cards": [], "node": null}
}

var player_hand = []
var table_cards = []

var gui_main = null
var gui_status = null

enum phases { SETUP, HISTORY, ACTIONS, BUYS, CLEANUP, VICTORY }
enum steps { NONE, CHOOSE_ACTION_CARD , PLAY_RESOURCES, BUY_CARDS, TRASH, TAKE, DOUBLE_ACTION, REPLACE, UPGRADE_CARD, DISCARD, VICTORY}

var hints = {
    steps.NONE: ["", ""],
    steps.CHOOSE_ACTION_CARD: ["Play your action cards","I'm done"],
    steps.PLAY_RESOURCES: ["Play your resource cards", "Play resources"],
    steps.BUY_CARDS: ["Pick cards to buy", "I'm done buying"],
    steps.TRASH: ["Pick cards to trash", "I'm done"],
    steps.TAKE: ["Take card up to 4/5", "Done"],
    steps.DOUBLE_ACTION: ["Pick action to play twice." ,"Done"],
    steps.REPLACE: ["Pick cards to replace", "Done replacing"],
    steps.UPGRADE_CARD: ["Pick card to upgrade", "Done"],
    steps.DISCARD: ["Pick card to discard", "Done discarding"],
    steps.VICTORY: ["Victory! Rome is now a republic!", "Play Next Level"]
}

var cost_icons = {
    "cost_money": "\uf51e",
}
        
var effect_icons = {
    "effect_money": "\uf51e",
    "effect_army": "Army: ",
    "discard": "Disc\\ard: ",
    "trash": "Tr\\ash: ",
    "extra_buys": "Buy: ",
    "draw": "Draw: ",
    "extra_actions": "Actions: ",
    "replace": "Replace: ",
    "upgrade_2": "Upgra\\de: +2#",
    "double_action": "Double Action#",
    "take_4": "Take: \uf51e4#",
    "take_money2": "Take Aes Rude#",
    "take_5": "Take: \uf51e5#",
    "upgrade_money": "Upgra\\de \uf51e#",
}

var double_action = null
var double_action2 = false

var zoomed_card = false

class Game:
    var current_phase = phases.SETUP
    var current_step = steps.NONE
    var turn = 0
    var money = 0
    var army = 0
    var actions = 1
    var buys = 1
    var cards_to_select = 0
    var max_cost = 0
    var showcase_card = null
    
var game : Game = null


# INIT #########################

func _ready():
    init()
    new_game()


# GAME LOGIC ###################

func new_game():
    prepare_decks()
    game.turn = 0
    new_turn()
    
    
func new_turn():
    set_up()
    deal_new_hand()
    game.current_phase = phases.HISTORY
    game.showcase_card = top_card(decks["History"]["node"])
    play_action_card(top_card(decks["History"]["node"]))
    refresh_gui()
    
    
func deal_new_hand():
    # Check if the player's deck has enough cards to deal a new hand, reshuffle if necessary
    if decks["PlayerDeck"]["cards"].size() < 5:
        reshuffle_discarded_into_deck()
        # After reshuffling, if still not enough cards (rare case, depends on game design), you might need additional logic

    # Now deal up to 5 cards to the player's hand
    while decks["PlayerDeck"]["cards"].size() > 0 and decks["PlayerHand"]["cards"].size() < 5:
        decks["PlayerHand"]["cards"].append(decks["PlayerDeck"]["cards"].pop_front())

    print_deck_cards("Player Hand", decks["PlayerHand"])
    print_deck_cards("Player Deck", decks["PlayerDeck"])


func reshuffle_discarded_into_deck():
    # Move all cards from the discarded pile back to the player's deck
    while decks["Discarded"]["cards"].size() > 0:
        var card = decks["Discarded"]["cards"].pop_front()
        decks["PlayerDeck"]["cards"].append(card)
    
    # Shuffle the player's deck to randomize the order of cards
    decks["PlayerDeck"]["cards"].shuffle()
    
    
func post_action():
    if double_action:
        var card = double_action
        double_action = null
        game.actions += 1
        double_action2 = true
        play_action_card(card)
        double_action2 = false
    if game.current_phase == phases.HISTORY:
        game.current_phase = phases.ACTIONS
        game.current_step = steps.CHOOSE_ACTION_CARD
    refresh_gui()
    
    
func finish_actions():
    game.current_step = steps.PLAY_RESOURCES
    refresh_gui()
    
    
func play_resources():
    var cards_to_play = []
    
    for card in decks["PlayerHand"]["cards"]:
        if card["type"] in ["Money1","Money2","Army1","Army2"]:
            cards_to_play.append(card)
    
    for card in cards_to_play:
        decks["PlayerHand"]["cards"].erase(card)  # Remove card from player's hand
        decks["CardsOnTable"]["cards"].append(card)  # Add card to the table
        game.money += card["effect_money"]
        game.army += card["effect_army"]
        
    game.current_step = steps.BUY_CARDS
    refresh_gui()
    
    
func buy_card(node: Node):
    var card = top_card(node)

    if game.money >= card["cost_money"]:
        game.money -= card["cost_money"]
        for deck in decks:
            if node == decks[deck]["node"]:
                decks[deck]["cards"].erase(card)  
                decks["Discarded"]["cards"].append(card)  

        game.buys -= 1
        refresh_gui()


func finish_buys():
    game.current_phase = phases.CLEANUP
    game.current_step = steps.NONE
    clean_up()
    
    
func clean_up():
    while decks["PlayerHand"]["cards"].size() > 0:
        var card = decks["PlayerHand"]["cards"].pop_front()
        decks["Discarded"]["cards"].append(card)
    while decks["CardsOnTable"]["cards"].size() > 0:
        var card = decks["CardsOnTable"]["cards"].pop_front()
        decks["Discarded"]["cards"].append(card)
        
    var challenge = decks["History"]["cards"][0]
    if game.money >= 0 and game.army >= 0:
        decks["Trash"]["cards"].append(challenge)
        decks["History"]["cards"].pop_front()
    else:
        # Challenge failed, trash top card from PlayerDeck as punishment
        if decks["PlayerDeck"]["cards"].size() <= 0:
            reshuffle_discarded_into_deck()
        var card_to_trash = decks["PlayerDeck"]["cards"].pop_front()  # Take the top card from the player's deck
        decks["Trash"]["cards"].append(card_to_trash)  # And move it to the Trash

    if decks["History"]["cards"].size() > 0:
        new_turn()
    else:
        game.current_phase = phases.VICTORY
        game.current_step = steps.VICTORY
        refresh_gui()
    
    
func set_up():
    game.current_phase = phases.SETUP
    game.current_step = steps.NONE
    double_action = null
    game.money = 0
    game.army = 0
    game.actions = 1
    game.buys = 1
    game.turn += 1
    refresh_gui()
    

func play_action_card(card):
    var more_input = false
    if game.actions > 0 or game.current_phase == phases.HISTORY:
        if not double_action2 and game.current_phase != phases.HISTORY:
            decks["PlayerHand"]["cards"].erase(card)
            decks["CardsOnTable"]["cards"].append(card)

        game.money += card["effect_money"]
        game.army += card["effect_army"]
        game.buys += card["extra_buys"]
        game.actions += card["extra_actions"]
        if card["draw"] > 0:
            draw_cards(card["draw"])
        if card["trash"] > 0:
            game.current_step = steps.TRASH
            game.cards_to_select = card["trash"]
            more_input = true
        if card["take_money2"] > 0:
            take_money2()
        if card["take_4"] > 0:
            game.current_step = steps.TAKE
            game.cards_to_select = 1
            game.max_cost = 4
            more_input = true
        if card["take_5"] > 0:
            game.current_step = steps.TAKE
            game.cards_to_select = 1
            game.max_cost = 5
            more_input = true
        if card["double_action"] > 0:
            game.current_step = steps.DOUBLE_ACTION
            game.actions += 1
            more_input = true
        if card["replace"] > 0:
            game.current_step = steps.REPLACE
            game.cards_to_select = card["replace"]
            more_input = true
        if card["upgrade_2"] > 0:
            game.current_step = steps.UPGRADE_CARD
            game.cards_to_select = card["upgrade_2"]
            more_input = true
        if card["upgrade_money"] > 0:
            upgrade_money()
        if card["discard"] > 0:
            game.current_step = steps.DISCARD
            game.cards_to_select = card["discard"]
            more_input = true
            
        if game.current_phase != phases.HISTORY:    
            game.actions -= 1
        refresh_gui()
        if not more_input:
            post_action()
        
        
func upgrade_money():
    if has_money1_in_hand() and is_money2_available():
        for card in decks["PlayerHand"]["cards"]:
            if card["type"] == "Money1":
                decks["Trash"]["cards"].append(card)
                decks["PlayerHand"]["cards"].erase(card)
                break
        var money2_card = decks["Money2"]["cards"].pop_front()  # Take the top "Money2" card
        decks["PlayerHand"]["cards"].append(money2_card)  # Add "Money2" card to discarded pile
        refresh_gui()  # Update the game state to reflect these changes

        
func take_card(node):
    for deck in decks:
        if node == decks[deck]["node"]:
            var card = decks[deck]["cards"].pop_front()
            decks["Discarded"]["cards"].append(card)
            game.cards_to_select -= 1
    refresh_gui()
        
        
func take_money2():
    if decks["Money2"]["cards"].size() > 0:
        var card = decks["Money2"]["cards"].pop_front()
        decks["Discarded"]["cards"].append(card)
    
    
func draw_cards(number_of_cards : int):
    for i in range(number_of_cards):
        if decks["PlayerDeck"]["cards"].size() == 0:
            reshuffle_discarded_into_deck()
        var card = decks["PlayerDeck"]["cards"].pop_front()
        decks["PlayerHand"]["cards"].append(card)
        
        
func trash_card(deck):
    var card = top_card(deck)
    decks["Trash"]["cards"].append(card)
    decks["PlayerHand"]["cards"].erase(card)
    game.cards_to_select -= 1
    refresh_gui()
    
    
func replace_card(deck):
    var card = top_card(deck)
    decks["Discarded"]["cards"].append(card)
    decks["PlayerHand"]["cards"].erase(card)
    game.cards_to_select -= 1
    draw_cards(1)
    refresh_gui()
    
    
func finish_current_action():
    if game.current_phase == phases.HISTORY:
        game.current_phase = phases.ACTIONS
    game.current_step = steps.CHOOSE_ACTION_CARD
    refresh_gui()


func upgrade_card(deck):
    var card = top_card(deck)
    decks["Trash"]["cards"].append(card)
    decks["PlayerHand"]["cards"].erase(card)
    game.current_step = steps.TAKE
    game.cards_to_select = 1
    game.max_cost = card.cost_money + 2
    refresh_gui()
    
    
func discard(deck):
    var card = top_card(deck)
    decks["Discarded"]["cards"].append(card)
    decks["PlayerHand"]["cards"].erase(card)
    game.cards_to_select -= 1
    if game.cards_to_select == 0:
        post_action()
    refresh_gui()
    
    
# FUNCTIONS  ###################

func init():
    game = Game.new()
    load_card_definitions_from_csv()
    assign_decks_to_nodes()
    assign_gui_nodes()
    
    
func assign_gui_nodes():
    gui_main = get_node("GuiMain")
    gui_status = get_node("GuiStatus")


func prepare_decks():
    empty_current_decks()
    assign_cards_to_decks()
    
    
func empty_current_decks():
    for deck in decks:
        decks[deck]["cards"].clear()
    
    
func refresh_gui():   
    check_step() 
    for deck in decks:
        refresh_deck(deck)
    refresh_cards(player_hand, "PlayerHand")
    refresh_cards(table_cards, "CardsOnTable")
    refresh_status()
    refresh_hint()
    refresh_history()
    refresh_zoom()
    
    
func check_step():
    if game.current_step == steps.CHOOSE_ACTION_CARD:
        if game.actions <= 0 or no_action_cards_in_hand():
            finish_actions()
    if game.current_step == steps.BUY_CARDS:
        if game.buys <= 0:
            finish_buys()
    
    
func no_action_cards_in_hand():
    for card in decks["PlayerHand"]["cards"]:
        if card["type"] == "Action":
            return false
    return true
        
    
func refresh_zoom():
    if game.showcase_card:
        var card_label = get_node("BigCard/Title")
        card_label.text = "[center]%s[/center]" % game.showcase_card["name"]
        
        var normalized_name = game.showcase_card["name"].replace(" ", "_").to_lower()
        var image_path = "res://cards/" + normalized_name + ".png"
        var card_visual = get_node("BigCard/MainVisual") as TextureRect
        card_visual.texture = load(image_path)
        
        var card_data = cards_by_name[game.showcase_card["name"]]
        
        var effects = {
            "effect_money": "Money %+d" % card_data["effect_money"],
            "effect_army": "Army %+d" % card_data["effect_army"],
            "discard": "Discard %d card%s" % [card_data["discard"], "s" if card_data["discard"] > 1 else ""],
            "trash": "Trash up to %d card%s" % [card_data["trash"], "s" if card_data["trash"] > 1 else ""],
            "extra_buys": "Extra %d buy%s" % [card_data["extra_buys"], "s" if card_data["extra_buys"] > 1 else ""],
            "draw": "Draw %d card%s" % [card_data["draw"], "s" if card_data["draw"] > 1 else ""],
            "extra_actions": "Extra %d action%s" % [card_data["extra_actions"], "s" if card_data["extra_actions"] > 1 else ""],
            "replace": "Discard up to %d card%s and replace them from your deck" % [card_data["replace"], "s" if card_data["replace"] > 1 else ""],
            "upgrade_2": "Trash a card and take another instead, costing max 2 money more",
            "double_action": "For next card play an action for doubled effects",
            "take_4": "Take a card costing max 4 money",
            "take_money2": "Take Aes Rude card",
            "take_5": "Take a card costing max 5 money",
            "upgrade_money": "Trash a money card and take bigger denomination money card instead",
        }
        
        var effect_text = ""
        for effect in effects:
            if card_data[effect] != 0:
                effect_text = "%s%s. " % [effect_text, effects[effect]]
        var card_effect = get_node("BigCard/EffectsText")
        card_effect.bbcode_text = effect_text
        
        var card_cost = get_node("BigCard/Cost") as Label
        card_cost.text = str(card_data["cost_money"]) if card_data["type"] != "History" else "-"
    
    get_node("BigCard").visible = zoomed_card


func refresh_history():
    if game.showcase_card:
        var history_label = get_node("GuiMain/History")
        var history_text = "[b]%s[/b]\n[i]%s[/i]\n%s" % [game.showcase_card["name"],game.showcase_card["subtitle"], game.showcase_card["history_text"]]
        history_label.text = history_text
        
        var normalized_name = game.showcase_card["name"].replace(" ", "_").to_lower()
        var image_path = "res://cards/" + normalized_name + ".png"
        var history_visual = get_node("GuiMain/HistoryImg") as TextureRect
        history_visual.texture = load(image_path)
        
    
func refresh_hint():
    var gui_hint = get_node("GuiHint")  # This gets the Control node named GuiHint
    gui_hint.get_node("Army").text = str(game.army)
    gui_hint.get_node("Money").text = str(game.money)
    var hint_text = hints[game.current_step][0]
    if game.current_step == steps.CHOOSE_ACTION_CARD:
        hint_text = "Play up to %d action cards" % game.actions
    if game.current_step == steps.BUY_CARDS:
        hint_text = "Buy up to %d cards. Money available: %d" % [game.buys, game.money]
    if game.current_step == steps.TRASH:
        hint_text = "Pick up to %d cards to trash" % game.cards_to_select
    if game.current_step == steps.TAKE:
        hint_text = "Take any card up to cost %d" % game.max_cost
    if game.current_step == steps.REPLACE:
        hint_text = "Pick up to %d cards to replace" % game.cards_to_select
    if hints.has(game.current_step):
        gui_hint.get_node("Hint").text = "[center]%s[/center]" % hint_text  # Update the text of the Hint RTLabel
        gui_hint.get_node("BtnHints").text = hints[game.current_step][1]
        gui_hint.visible = true  # Make sure the GuiHint and all its children are visible
    else:
        gui_hint.visible = false  # Hide the GuiHint node, which also hides all its children

    
func refresh_status():
    var countPlayerDeck = decks["PlayerDeck"]["cards"].size()
    var countDiscarded = decks["Discarded"]["cards"].size()
    var countTrash = decks["Trash"]["cards"].size()
    var status = "Turn %d | Money %d - Army %d | Actions %d - Buys %d | Deck %d - Discarded %d - Trash %d" % [game.turn, game.money, game.army, game.actions, game.buys, countPlayerDeck, countDiscarded, countTrash]
    gui_status.get_node("Status").set_text(status)
    
    
func refresh_cards(card_nodes: Array, deck_name: String):
    # Reset visibility and quantity of all nodes
    for node_info in card_nodes:
        node_info["node"].visible = false
        node_info["qty"] = 0

    # Count card occurrences
    var card_counts = count_card_occurrences(decks[deck_name]["cards"])

    # Update UI based on card counts
    var index = 0
    for card_name in card_counts:
        if index >= card_nodes.size():
            break
        var node_info = card_nodes[index]
        node_info["card"] = cards_by_name[card_name]
        node_info["qty"] = card_counts[card_name]
        display_card_with_qty(node_info["node"], card_name, node_info["qty"])
        index += 1


func count_card_occurrences(cards: Array) -> Dictionary:
    var card_counts = {}
    for card in cards:
        if card:
            var card_name = card["name"]
            if card_name in card_counts:
                card_counts[card_name] += 1
            else:
                card_counts[card_name] = 1
    return card_counts

    
func refresh_deck(deck_name):
    var node = decks[deck_name]["node"]
    var deck = decks[deck_name]["cards"]
    if node:
        if deck.size() > 0:
            var card = deck[0]
            display_card_with_qty(node, card["name"],deck.size())
        else:
            node.visible = false
    
    
func assign_decks_to_nodes():
    for deck in decks:
        decks[deck]["node"] = get_node("Card" + deck)
    for i in range(14):
        player_hand.append({"card": null, "qty": 0, "node": get_node("CardHand%d" % (i+1))})
    for i in range(10):
        table_cards.append({"card": null, "qty": 0, "node": get_node("CardTable%d" % (i+1))})


func display_card_with_qty(node: Node, card_name: String, qty: int):
    display_card(node, card_name)  # Your existing logic to display the card
    var qty_label = node.get_node("CardQty")  # Adjust path if necessary
    if qty > 1:
        qty_label.text = str(qty)
        qty_label.visible = true
    else:
        qty_label.visible = false
    node.visible = true

    
# Assumes cards_by_name is a dictionary where keys are card names
# and values are dictionaries containing the card's data.
func display_card(card: Control, card_name: String) -> void:
    if not cards_by_name.has(card_name):
        print("Card name not found: ", card_name)
        return
        
    var card_data = cards_by_name[card_name]
    
    var cost_text = str(card_data["cost_money"]) if card_data["type"] in ["Action","Money1","Money2","Army1","Army2"] else "-"
    
    var effect_text = ""
    for effect in effect_icons:
        if card_data[effect] != 0:
            effect_text = "%s%s%s\n" % [effect_text, effect_icons[effect], str(card_data[effect])]
    effect_text = effect_text.split("#")[0]
            
    card.set_title(card_data.name)
    card.set_effect("")
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
        var card_data = line.split(";")
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
            "take_money2": int(card_data[14]),
            "take_5": int(card_data[15]),
            "upgrade_money": int(card_data[16]),
            "subtitle": card_data[17],
            "history_text": card_data[18],
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
    
    var selected_actions = []
    while selected_actions.size() < 10:
        var choice = randi() % all_actions.size()
        selected_actions.append(all_actions.pop_at(choice))
    
    selected_actions.sort_custom(sort_cards_by_cost)
    
    for i in range(10):
        for j in range(single_card_deck_qty):
            decks["Action" + str(i+1)]["cards"].append(selected_actions[i])
        
    for i in range(7):
        decks["PlayerDeck"]["cards"].append(money1)
    for i in range(3):
        decks["PlayerDeck"]["cards"].append(army1)
    decks["PlayerDeck"]["cards"].shuffle()
    
    for deck_name in decks:
        print_deck_cards(deck_name, decks[deck_name])
    
        
# UTILS #######################

func has_money1_in_hand() -> bool:
    for card in decks["PlayerHand"]["cards"]:
        if card["type"] == "Money1":
            return true
    return false


func is_money2_available() -> bool:
    return decks["Money2"]["cards"].size() > 0


func print_deck_cards(deck_name,deck):
    var txt = deck_name + " - "
    for card in deck["cards"]:
        txt = txt + card["name"] + ","
    txt = txt.left(-1) + "\n"
    print(txt)


func is_actioncard(card):
    return card["type"] == "Action"
    
    
func is_playerhand(node):
    for deck in player_hand:
        if node ==  deck["node"]:
            return true
    return false
    

func top_card(node):
    for deck in decks:
        if node == decks[deck]["node"]:
            return decks[deck]["cards"][0]
    for deck in player_hand:
        if node ==  deck["node"]:
            return deck["card"]
    for deck in table_cards:
        if node ==  deck["node"]:
            return deck["card"]
    return null
    
    
func is_card_buyable(node: Node) -> bool:
    return node.name.begins_with("CardMoney") or node.name.begins_with("CardArmy") or node.name.begins_with("CardAction")
    
    
func sort_cards_by_cost(a, b):
    return a["cost_money"] < b["cost_money"]  # Ascending order

    
# SIGNALS #####################

func _on_btn_exit_pressed():
    get_tree().quit()


func _on_btn_new_game_pressed():
    new_game() # Replace with function body.
    
    
func on_deck_clicked(node):
    var card : Dictionary = top_card(node)
    game.showcase_card = card
    refresh_gui()
    match game.current_step:
        steps.CHOOSE_ACTION_CARD:
            # valid: action card, in player's hand
            if is_actioncard(card) and is_playerhand(node): 
                play_action_card(card)
        steps.BUY_CARDS:
            # valid: card in buyable decks and costing less than money available
            var cost = card["cost_money"]
            if is_card_buyable(node) and cost <= game.money and game.buys > 0:
                buy_card(node)
        steps.TRASH:
            # valid: card is in player's hand and more cards can be selected
            if is_playerhand(node) and game.cards_to_select > 0:
                trash_card(node)
                if game.cards_to_select == 0:
                    post_action()
        steps.TAKE:
            # valid: card is buyable and costing less than max_cost
            var cost = card["cost_money"]
            if is_card_buyable(node) and cost <= game.max_cost and game.cards_to_select > 0:
                take_card(node)
                post_action()
        steps.DOUBLE_ACTION:
            # valid: action card, in player's hand
            if is_actioncard(card) and is_playerhand(node): 
                double_action = card
                game.current_step = steps.CHOOSE_ACTION_CARD
                play_action_card(card)
        steps.REPLACE:
            # valid: card is in player's hand and more cards can be selected
            if is_playerhand(node) and game.cards_to_select > 0:
                replace_card(node)
                if game.cards_to_select == 0:
                    post_action()
        steps.UPGRADE_CARD:
            # valid: card is in player's hand and more cards can be selected
            if is_playerhand(node) and game.cards_to_select > 0:
                upgrade_card(node)
        steps.DISCARD:
            # valid: card is in player's hand and more cards can be selected
            if is_playerhand(node) and game.cards_to_select > 0:
                discard(node)     
                
                
func on_deck_right_clicked(node):
    var card : Dictionary = top_card(node)
    game.showcase_card = card
    zoomed_card = true
    refresh_gui()


func _on_btn_hints_pressed():
    match game.current_step:
        steps.CHOOSE_ACTION_CARD, steps.DOUBLE_ACTION:
            finish_actions()
        steps.PLAY_RESOURCES:
            play_resources()
        steps.BUY_CARDS:
            finish_buys()
        steps.TRASH, steps.TAKE, steps.REPLACE:
            finish_current_action()
     

func _on_big_card_gui_input(event):
    if event is InputEventMouseButton and event.pressed:
        zoomed_card = false
        refresh_gui()
