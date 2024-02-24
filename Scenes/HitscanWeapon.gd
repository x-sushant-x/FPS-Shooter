extends Node3D

@export var fire_rate = 14.0
@export var weapon_mesh : Node3D
@export var recoil = 0.1

@onready var cooldown_timer = $CooldownTimer
@onready var weapon_position : Vector3 = weapon_mesh.position
@onready var ray_cast_3d : RayCast3D = $RayCast3D


func _ready():
	pass 


func _process(delta):
	if Input.is_action_pressed("fire"):
		if cooldown_timer.is_stopped():
			shoot()
	
	weapon_mesh.position = weapon_mesh.position.lerp(weapon_position, delta * 10.0)

func shoot():
	cooldown_timer.start(1.0 / fire_rate)
	weapon_mesh.position.z += recoil
	
	print(ray_cast_3d.get_collider())
