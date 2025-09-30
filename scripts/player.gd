extends CharacterBody2D

const JUMP_SPEED = -400
const SPEED = 300.0
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
@onready var _animated_sprite = $AnimatedSprite2D


func _process(delta: float) -> void:
	if global_position.y > 1400: #player fall down
		_player_death()



func _physics_process(delta: float) -> void:
	#gravity
	if not is_on_floor():
		velocity.y += 20 #adjusted fall speed

	#fly
	if Input.is_action_pressed("jump"):
		_animated_sprite.play()
		velocity.y = JUMP_SPEED

	#the player should constantly move forward
	velocity.x = 2 * SPEED

	var collision = move_and_collide(velocity*delta) #move and check for collisions
	if collision:
		_player_death()
		


func _player_death():
	get_tree().paused = true
	#get_tree().change_scene_to_file("res://scenes/game_scene.tscn")
