extends Node

const bottom_rune = preload("res://scenes/runestone_bottom.tscn")
const top_rune = preload("res://scenes/runestone_top.tscn")
var x_spawn_counter = 100.0


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if (Engine.get_frames_drawn()%120): #60fps makes this method call occour every other second
		_create_obstacles()
		


func _create_obstacles(): 
	var top_rune_instance = top_rune.instantiate()
	var bottom_rune_instance = bottom_rune.instantiate()
	
	bottom_rune_instance.apply_scale(Vector2(randf_range(0.6, 1.5), randf_range(0.6, 1.5)))
	
	top_rune_instance.global_position = Vector2(x_spawn_counter, randf_range(-1500, -500))
	bottom_rune_instance.global_position = Vector2(x_spawn_counter+randf_range(0,20007), randf_range(500, 1500))

	add_child(top_rune_instance)
	add_child(bottom_rune_instance)
	x_spawn_counter += 2000
	
	


func _on_button_pressed() -> void:
	get_tree().reload_current_scene()
