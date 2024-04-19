# Game.gd
extends Node

enum phases { INTRO, SETUP, HISTORY, ACTIONS, BUYS, CLEANUP, VICTORY }
enum steps { NONE, CHOOSE_ACTION_CARD , PLAY_RESOURCES, BUY_CARDS, TRASH, TAKE, DOUBLE_ACTION, REPLACE, UPGRADE_CARD, DISCARD, VICTORY, INTRO1, INTRO2, INTRO3, INTRO4, INTRO5}

# Global game state variables
var current_phase = phases.INTRO
var current_step = steps.INTRO1
var turn = 0
var money = 0
var army = 0
var actions = 1
var buys = 1
var cards_to_select = 0
var max_cost = 0
var showcase_card = null
var challenge_overcome = false


