extends CharacterBody3D

@onready var navigation_agent_3d = $NavigationAgent3D

var player : CharacterBody3D

@export var speed = 2
@export var enemy_range = 10

var chase_player = false

func _ready():
	player = get_tree().get_first_node_in_group("player")

func _process(delta):
	navigation_agent_3d.target_position = player.global_position

func _physics_process(delta):
	if get_enemy_distance_from_player(player.global_position) < enemy_range:
		chase_player = true
	else:
		chase_player = false
	
	if chase_player:
		var next_position = navigation_agent_3d.get_next_path_position() 
		var direction = global_position.direction_to(next_position)
	
		if direction:
			velocity.x = direction.x * speed
			velocity.z = direction.z * speed	
		else:
			velocity.x = move_toward(velocity.x, 0, speed)
			velocity.z = move_toward(velocity.z, 0, speed)				
		
		move_and_slide()

func get_enemy_distance_from_player(player_position : Vector3):
	return global_position.distance_to(player_position)
