extends Sprite2D

func _process(delta):
    # Example: Pulsating effect
    modulate.a = 0.5 + sin(Engine.get_frames_drawn() * 0.1) * 0.3  # Change alpha over time

