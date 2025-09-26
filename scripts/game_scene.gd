extends Node

var _x_spawn_counter: int = 10
const _bottom_rune_preload = preload("res://scenes/runestone_bottom.tscn")
const _top_rune_preload = preload("res://scenes/runestone_top.tscn")
var _bottom_rune: RuneStone
var _top_rune: RuneStone

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if (Engine.get_frames_drawn()%120): #60fps makes this method call occour every other second
		_create_obstacles()
		


func _create_obstacles(): 
	_bottom_rune = _bottom_rune_preload.instantiate()
	_top_rune = _top_rune_preload.instantiate()
	_bottom_rune.apply_scale(Vector2(randf_range(0.6, 1.5), randf_range(0.6, 1.5)))
	
	_top_rune.global_position = Vector2(_x_spawn_counter, randf_range(-1500, -500))
	_bottom_rune.global_position = Vector2(_x_spawn_counter+randf_range(0,20007), randf_range(500, 1500))

	add_child(_top_rune)
	add_child(_bottom_rune)
	_x_spawn_counter += 2000
	
