extends Control

var phases = Game.phases
var steps = Game.steps

var fade_speed = 0.4  # Speed of the fade (in alpha units per second)

enum fades {HIDDEN, FADEIN, VISIBLE, FADEOUT}

var intro_fade = fades.VISIBLE
var main_fade = fades.HIDDEN
var resource_cards_fade = fades.HIDDEN
var action_cards_fade = fades.HIDDEN
var your_hand_fade = fades.HIDDEN
var challenge_card_fade = fades.HIDDEN
var rightclick_fade = fades.HIDDEN

func _ready():
    $IntroMain.modulate.a = 0
    $IntroResourceCards.modulate.a = 0
    $IntroActionCards.modulate.a = 0
    $IntroYourHand.modulate.a = 0
    $IntroChallengeCard.modulate.a = 0
    $IntroStartGame.visible = false
    $ResourceBorder.modulate.a = 0
    $ActionsBorder.modulate.a = 0
    $HandBorder.modulate.a = 0
    $ChallengeBorder.modulate.a = 0
    $IntroRightClick.modulate.a = 0
    

func _process(delta):
    if intro_fade == fades.FADEOUT:
        intro_fade = fade_in(self, intro_fade, -delta * fade_speed * 2)
    if main_fade == fades.FADEIN:
        main_fade = fade_in($IntroMain, main_fade, delta * fade_speed)
    if main_fade == fades.FADEOUT:
        main_fade = fade_in($IntroMain, main_fade, -delta * fade_speed)
    if resource_cards_fade == fades.FADEIN:
        resource_cards_fade = fade_in($IntroResourceCards, resource_cards_fade, delta * fade_speed)
        fade_in($ResourceBorder, fades.FADEIN, delta * fade_speed)
    if action_cards_fade == fades.FADEIN:
        action_cards_fade = fade_in($IntroActionCards, action_cards_fade, delta * fade_speed)
        fade_in($ActionsBorder, fades.FADEIN, delta * fade_speed)
    if your_hand_fade == fades.FADEIN:
        your_hand_fade = fade_in($IntroYourHand, your_hand_fade, delta * fade_speed)
        fade_in($HandBorder, fades.FADEIN, delta * fade_speed)
    if challenge_card_fade == fades.FADEIN:
        challenge_card_fade = fade_in($IntroChallengeCard, challenge_card_fade, delta * fade_speed)
        fade_in($ChallengeBorder, fades.FADEIN, delta * fade_speed)
    if rightclick_fade == fades.FADEIN:
        fade_in($IntroRightClick, fades.FADEIN, delta * fade_speed)
        
        
func fade_in(node, fade_state, ammount):
    node.modulate.a += ammount
    if node.modulate.a >= 1:
        return fades.VISIBLE
    elif node.modulate.a <= 0:
        return fades.HIDDEN
    return fade_state
            
func refresh_intro():
    if Game.current_phase == phases.INTRO:
        self.visible = true
    else:
        self.visible = false
