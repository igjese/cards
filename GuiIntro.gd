extends Control

var phases = Game.phases
var steps = Game.steps

enum FadeState { IDLE, FADING, FADED }
var fade_state = FadeState.IDLE
var fade_speed = 0.5  # Speed of the fade (in alpha units per second)

var intro_dimmer = null


func _ready():
    intro_dimmer = $IntroDimmer


func fade_intro():
    fade_state = FadeState.FADING


func _process(delta):
    if fade_state == FadeState.FADING:
        intro_dimmer.modulate.a -= delta * fade_speed
        intro_dimmer.modulate.a = clamp(intro_dimmer.modulate.a, 0, 1)
        if intro_dimmer.modulate.a == 0:
            fade_state = FadeState.FADED


func refresh_intro():
    get_node("IntroResources").visible = false
    get_node("IntroActions").visible = false
    get_node("IntroHand").visible = false
    get_node("IntroHistory").visible = false
    get_node("IntroStartGame").visible = false
    get_node("IntroResourceCards").visible = false
    get_node("IntroActionCards").visible = false
    get_node("IntroYourHand").visible = false
    get_node("IntroChallengeCard").visible = false
    
    if Game.current_phase == phases.INTRO:
        self.visible = true
        match Game.current_step:
            steps.INTRO1:
                get_node("IntroResources").visible = true
            steps.INTRO2:
                get_node("IntroResourceCards").visible = true
                get_node("IntroActions").visible = true
            steps.INTRO3:
                get_node("IntroResourceCards").visible = true
                get_node("IntroHand").visible = true
                get_node("IntroActionCards").visible = true
            steps.INTRO4:
                get_node("IntroHistory").visible = true
                get_node("IntroResourceCards").visible = true
                get_node("IntroActionCards").visible = true
                get_node("IntroYourHand").visible = true
            steps.INTRO5:
                get_node("IntroChallengeCard").visible = true
                get_node("IntroStartGame").visible = true
                get_node("IntroResourceCards").visible = true
                get_node("IntroActionCards").visible = true
                get_node("IntroYourHand").visible = true
    else:
        self.visible = false
