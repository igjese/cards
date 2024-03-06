extends Panel

# Function to set the card's title
func set_title(title: String) -> void:
    var title_label = get_node("CardTitle") as RichTextLabel
    if title_label:
        title_label.bbcode_text = "[b]" + title + "[/b]"

# Function to set the card's cost
func set_cost(text: String) -> void:
    var text_label = get_node("CardCost") as RichTextLabel
    if text_label:
        text_label.bbcode_text = text

# Function to set the card's effect
func set_effect(text: String) -> void:
    var text_label = get_node("CardEffect") as RichTextLabel
    if text_label:
        text_label.bbcode_text = text

# Function to set the card's main visual
func set_visual(image_path: String) -> void:
    var sprite_node = get_node("MainVisual") as TextureRect
    if sprite_node:
        var texture = load(image_path) # Load the texture from the given path
        if texture:
            sprite_node.texture = texture
        else:
            print("Failed to load texture from path: ", image_path)
    else:
        print("Sprite node not found.")
