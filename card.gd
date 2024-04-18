extends Panel

# Function to set the card's title
func set_title(title: String) -> void:
    var title_label = get_node("View/CardTitle") as RichTextLabel
    if title_label:
        title_label.bbcode_text = "[center]%s[/center]" % title


# Function to set the card's cost
func set_cost(text: String) -> void:
    var cost_label = get_node("View/CardCost2") as Label
    cost_label.text = text

# Function to set the card's effect
func set_effect(text: String) -> void:
    var text_label = get_node("View/CardEffect") as RichTextLabel
    if text_label:
        if text: text_label.bbcode_text = text


# Function to set the card's main visual
func set_visual(card_name: String) -> void:
    var normalized_name = card_name.replace(" ", "_").to_lower()
    var image_path = "res://cards/" + normalized_name + ".png"
    var main_visual = get_node("View/MainVisual") as TextureRect
    var texture = load(image_path) # Load the texture from the given path
    if texture:
        main_visual.texture = texture
    else:
        print("Failed to load image %s, using default instead." % image_path)
        
func flip_card(duration = 0.5):  
    var tween = create_tween()
    tween.tween_property(self, "scale", Vector2(1.5, 1.5), duration / 3)
    tween.parallel().tween_property(self, "position", Vector2(self.position.x-37,self.position.y-37), duration / 3)
    tween.tween_property(self, "scale", Vector2(0, 1.5), duration / 3)
    tween.parallel().tween_property(self, "position", Vector2(self.position.x+75,self.position.y-37), duration / 3)
    tween.tween_callback(_hide_back_and_reveal_card)
    tween.tween_property(self, "scale", Vector2(1, 1), duration / 3)
    tween.parallel().tween_property(self, "position", self.position, duration / 3)

func _hide_back_and_reveal_card():
    $View/Back.hide() 


        
# SIGNALS ###########

func _on_gui_input(event):
    if Game.current_phase != Game.phases.INTRO and get_node("View").visible:
        var main_scene = get_tree().root.get_node("Main")
        if event is InputEventMouseButton:
            if event.button_index == MOUSE_BUTTON_LEFT:
                if event.pressed:
                    main_scene.on_deck_clicked(self)
            if event.button_index == MOUSE_BUTTON_RIGHT:
                if event.pressed:
                    main_scene.on_deck_right_clicked(self)
