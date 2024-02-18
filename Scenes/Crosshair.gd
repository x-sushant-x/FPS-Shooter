extends Control

func _draw():
	draw_circle(Vector2(0, 0), 3, Color.DIM_GRAY)		
	draw_circle(Vector2(0, 0), 2, Color.WHITE)
	
	draw_line(Vector2(8, 0), Vector2(16, 0), Color.WHITE, 2, false)
	
	draw_line(Vector2(-8, 0), Vector2(-16, 0), Color.WHITE, 2, false)
	
	draw_line(Vector2(0, -8), Vector2(0, -16), Color.WHITE, 2, false)
	
	draw_line(Vector2(0, 8), Vector2(0, 16), Color.WHITE, 2, false)
