extends Node

class_name Note

var pitch: int;
var length: float;

const pitches = [0, 2, 4, 5, 7, 9, 11] 

func _init(pitch: int = 60, length: int = 1):
	self.pitch = pitch;
	self.length = length;


static func dismantlePitch(pitch: int):
	var relativePitch = pitch % 12; 
	var octave = floor(pitch / 12); 
	var note = 0;
	for i in range(0, len(pitches)):
		if(relativePitch >= pitches[i]):
			note = i;
		else: break;
	
	return {
		'octave': octave,
		'note': note,
		'sharp' : relativePitch in pitches
	}

#to do: toString()
