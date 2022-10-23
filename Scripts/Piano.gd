extends Control

@export 
var whiteNote: Texture;

@export
var blackNote: Texture;

@export
var pressedWhiteNote: Texture;

@export
var pressedBlackNote: Texture;

@export
var baseNote = 60;

@export
var keyboardSize = 7;

func _ready():
	scale.x = size.x/112
	scale.y = size.y/48

func _process(delta):
	if(Input.is_action_just_pressed('ui_right')):
		baseNote += 1;
	if(Input.is_action_just_pressed('ui_left')):
		baseNote -= 1;
	queue_redraw()
	print(baseNote)

func _draw():
	for i in range(baseNote, baseNote + keyboardSize):
		draw_texture(whiteNote, Vector2(16 * (i%keyboardSize), 0));
	for i in range(baseNote, baseNote + keyboardSize):
		if(i % 7 == 2 || i % 7 == 6):
			continue
		draw_texture(blackNote, Vector2(16*(i%keyboardSize) + 12, 0))
