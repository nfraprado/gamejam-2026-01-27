extends Node2D

enum Type { ROCK, PAPER, SCISSORS }
enum Master { PLAYER, ENEMY }

const num_lanes = 5

@export var unit_scene: PackedScene

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func lane_idx_to_marker(index : int):
	if index == 0:
		return $Lane1
	elif index == 1:
		return $Lane2
	elif index == 2:
		return $Lane3
	elif index == 3:
		return $Lane4
	elif index == 4:
		return $Lane5


func _on_timer_timeout() -> void:
	var unit = unit_scene.instantiate()
	var next_lane = randi() % num_lanes
	var next_unit_type = randi() % Type.size()

	var spawn_pos = lane_idx_to_marker(next_lane).get_global_position()
	add_child(unit)
	unit.set_global_position(spawn_pos)
	unit.init_unit(next_unit_type, Master.ENEMY)
