extends ColorRect

enum FadeState { IDLE, FADING, FADED }
var fade_state = FadeState.IDLE
var fade_speed = 0.5 # Speed of the fade (in alpha units per second)

func _process(delta):
    match fade_state:
        FadeState.FADING:
            modulate.a -= delta * fade_speed
            modulate.a = clamp(modulate.a, 0, 1) 
            if modulate.a == 0:
                fade_state = FadeState.FADED
                # Optionally, stop processing or queue for deletion here:
                # set_process(false)
                # queue_free()  

func start_fade():
    fade_state = FadeState.FADING
