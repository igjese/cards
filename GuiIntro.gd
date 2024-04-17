extends Control

var phases = Game.phases
var steps = Game.steps

var fade_speed = 0.5  # Speed of the fade (in alpha units per second)

enum fades {HIDDEN, FADEIN, VISIBLE, FADEOUT}

var intro_fade = fades.VISIBLE
var main_fade = fades.HIDDEN
var resource_cards_fade = fades.HIDDEN
var action_cards_fade = fades.HIDDEN
var your_hand_fade = fades.HIDDEN
var challenge_card_fade = fades.HIDDEN

func _ready():
    $IntroMain.modulate.a = 0
    $IntroResourceCards.modulate.a = 0
    $IntroActionCards.modulate.a = 0
    $IntroYourHand.modulate.a = 0
    $IntroChallengeCard.modulate.a = 0
    $IntroStartGame.visible = false


func _process(delta):
    if intro_fade == fades.FADEOUT:
        self.modulate.a -= delta * fade_speed
        if self.modulate.a <= 0:
            intro_fade = fades.HIDDEN
        
    if main_fade == fades.FADEIN:
        $IntroMain.modulate.a += delta * fade_speed
        if $IntroMain.modulate.a >= 1:
            main_fade = fades.VISIBLE
    if main_fade == fades.FADEOUT:
        $IntroMain.modulate.a -= delta * fade_speed
        if $IntroMain.modulate.a <= 0:
            main_fade = fades.HIDDEN
    if resource_cards_fade == fades.FADEIN:
        $IntroResourceCards.modulate.a += delta * fade_speed
        if $IntroResourceCards.modulate.a >= 1:
            resource_cards_fade = fades.VISIBLE
    if action_cards_fade == fades.FADEIN:
        $IntroActionCards.modulate.a += delta * fade_speed
        if $IntroActionCards.modulate.a >= 1:
            action_cards_fade = fades.VISIBLE
    if your_hand_fade == fades.FADEIN:
        $IntroYourHand.modulate.a += delta * fade_speed
        if $IntroYourHand.modulate.a >= 1:
            your_hand_fade = fades.VISIBLE
    if challenge_card_fade == fades.FADEIN:
        $IntroChallengeCard.modulate.a += delta * fade_speed
        if $IntroChallengeCard.modulate.a >= 1:
            challenge_card_fade = fades.VISIBLE
            
func refresh_intro():
    if Game.current_phase == phases.INTRO:
        self.visible = true
        if Game.current_step == steps.INTRO5:
            $IntroStartGame.visible = true
    else:
        self.visible = false
