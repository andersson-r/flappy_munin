class_name RuneStone extends Node2D

@onready var _rune_area: Area2D = find_child("Area2D")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	_rune_area.area_entered.connect(func(body): #avoid runestones to be generated on eachother
		if body.owner is RuneStone:
			body.owner.queue_free()
	)
	
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Main.player.global_position.x - global_position.x > DisplayServer.screen_get_size().x: #remove the passed runestones
		queue_free()
