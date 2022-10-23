extends Control

var notes = [
	Note.new(60,1),
	Note.new(61,1),
	Note.new(62,1),
	Note.new(82,1),
];
var max = 4;

@export
var offsetX = 50;

@export
var texture: Texture;

@export
var notesScale = 1;

func _process(delta):
	queue_redraw()

func _draw():
	draw_texture(preload('res://Images/Treble clef.png'), Vector2(0,0))
	
	var stepX = size.x/max;
	var stepY = size.y/5;
	for i in range(0, 5):
		draw_line(Vector2(0,i*stepY), Vector2(size.x, i*stepY), Color.WHITE, 1.0)
	
	for i in range(0, len(notes)):
		var dismantledNote = Note.dismantlePitch(notes[i].pitch);
		var outOf5Lines = !dismantledNote.sharp && (notes[i].pitch <=60 || notes[i].pitch>= 82)
		var relativeOctave = dismantledNote.octave - 5;
		
		var y = (dismantledNote.note + relativeOctave * 7) * stepY/2;
		var x = i * stepX + offsetX;
		
		draw_texture(texture, Vector2(x - texture.get_size().x / 2,size.y - y - texture.get_size().y / 2 - 5));
		
		if(outOf5Lines):
			draw_line(Vector2(x - 10,size.y - y), Vector2(x + 10, size.y - y), Color.WHITE, 1.0)
