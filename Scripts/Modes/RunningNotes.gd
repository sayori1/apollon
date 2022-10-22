extends Control

signal correctHit;
signal incorrectHit;

var notes = [];

@export
var max = 4;

var correct = 0;
var incorrect = 0;

@export
var maxNotesRange = 22;

func hitNote(pitch: int):
	if(notes[-1].pitch == pitch):
		emit_signal('correctHit')
		correct += 1;
	else:
		emit_signal('incorrectHit')
		incorrect+=1
	
	notes.pop_front()
	addRandomNote()
	
func addRandomNote():
	var relativePitch = randi_range(0, maxNotesRange);
	var note = relativePitch % len(Note.pitches);
	var octave = relativePitch / len(Note.pitches);
	var pitch = octave*12 + note;
	
	notes.push_back(Note.new(60 + pitch));
	
func _ready():
	for i in range(0, max - len(notes)):
		addRandomNote()
