""" PoF -> This file will smoothen the FPS Camera.
Rotation on y axis is handled by Player.gd But for x axis we have a dummy node as a parent of camera which rotates in x axis.
To smoothen this we will blend it. """

extends Camera3D
@export var speed : float = 44.0

func _physics_process(delta):
	var weight : float = delta * speed
	
	global_transform.interpolate_with(
		get_parent().global_transform, weight 
	)
