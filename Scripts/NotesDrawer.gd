extends Control

var notes = [
	Note.new(60,1),
	Note.new(61,1),
	Note.new(62,1),
];
var max = 4;

func _process(delta):
	queue_redraw()

func _draw():
	
	var stepX = size.x/max;
	var stepY = size.y/5;
	for i in range(0, 5):
		draw_line(Vector2(0,i*stepY), Vector2(size.x, i*stepY), Color.BLACK, 1.0)
	
	for i in range(0, len(notes)):
		var dismantledNote = Note.dismantlePitch(notes[i].pitch);
		var outOf5Lines = dismantledNote.note % 2 == 0 && (dismantledNote.note <=0 || dismantledNote.note >= 12)
		var relativeOctave = dismantledNote.octave - 5;
		
		var y = (dismantledNote.note + relativeOctave * 7) * stepY/2;
		var x = i * stepX;
		
		draw_arc(Vector2(x,size.y - y), stepY*0.4, 0.0, 6.28, 20, Color.BLACK);
		
		if(outOf5Lines):
			draw_line(Vector2(x - 15,size.y - y), Vector2(x + 15, size.y - y), Color.BLACK)
