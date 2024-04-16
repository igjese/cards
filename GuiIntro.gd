extends Control

var phases = Game.phases
var steps = Game.steps

# Called when the node enters the scene tree for the first time.
func _ready():
    pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
    pass

func refresh_intro():
    get_node("IntroResources").visible = false
    get_node("IntroActions").visible = false
    get_node("IntroHand").visible = false
    get_node("IntroHistory").visible = false
    get_node("IntroStartGame").visible = false
    
    if Game.current_phase == phases.INTRO:
        self.visible = true
        match Game.current_step:
            steps.INTRO1:
                get_node("IntroResources").visible = true
            steps.INTRO2:
                get_node("IntroResources").visible = true
                get_node("IntroActions").visible = true
            steps.INTRO3:
                get_node("IntroResources").visible = true
                get_node("IntroActions").visible = true
                get_node("IntroHand").visible = true
            steps.INTRO4:
                get_node("IntroHistory").visible = true
            steps.INTRO5:
                get_node("IntroHistory").visible = true
                get_node("IntroStartGame").visible = true
    else:
        self.visible = false
