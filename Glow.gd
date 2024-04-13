extends Sprite2D

func _process(delta):
    # Example: Pulsating effect
    modulate.a = 0.6 + sin(Engine.get_frames_drawn() * 0.05) * 0.3  # Change alpha over time

