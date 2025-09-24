class_name RuneStone extends Node2D

@onready var _area: Area2D = find_child("Area2D")

var _player: CharacterBody2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	_area.area_entered.connect(func(body):
		if body.owner is RuneStone:
			body.owner.queue_free()
	)
	_player = get_tree().current_scene.find_child("Player")
	
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if _player && _player.global_position.x - global_position.x > DisplayServer.screen_get_size().x:
		print("free at position")
		queue_free()
