extends Panel

# Function to set the card's title
func set_title(title: String) -> void:
    var title_label = get_node("CardTitle") as RichTextLabel
    if title_label:
        title_label.bbcode_text = "[center]%s[/center]" % title


# Function to set the card's cost
func set_cost(text: String) -> void:
    var text_label = get_node("CardCost") as RichTextLabel
    if text_label:
        text_label.bbcode_text = text


# Function to set the card's effect
func set_effect(text: String) -> void:
    var text_label = get_node("CardEffect") as RichTextLabel
    if text_label:
        if text: text_label.bbcode_text = text


# Function to set the card's main visual
func set_visual(card_name: String) -> void:
    var normalized_name = card_name.replace(" ", "_").to_lower()
    var image_path = "res://cards/" + normalized_name + ".png"
    var main_visual = get_node("MainVisual") as TextureRect
    var texture = load(image_path) # Load the texture from the given path
    if texture:
        main_visual.texture = texture
    else:
        print("Failed to load image %s, using default instead." % image_path)

        
