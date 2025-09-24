extends CharacterBody2D

const JUMP_SPEED = -400
const SPEED = 300.0
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
@onready var _animated_sprite = $AnimatedSprite2D


func _process(delta: float) -> void:
	if(global_position.y > 1400):
		_player_death()

func _physics_process(delta: float) -> void:
	#gravity
	if(not is_on_floor()):
		velocity.y = velocity.y + 20

	#fly
	if (Input.is_action_pressed("jump")):
		_animated_sprite.play()
		velocity.y = JUMP_SPEED

	#the player should constantly move forward
	velocity.x = 2 * SPEED

	move_and_slide()


func _player_death():
	get_tree().change_scene_to_file("res://main.tscn")
