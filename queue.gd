extends Node2D

const queue_size : int = 3

var queue = []

var cur_unit_type = 0

signal flush_one_unit

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func get_new_unit_type():
	cur_unit_type = (cur_unit_type + 1) % 3
	return cur_unit_type


func _on_flush_one_unit() -> int:
	var next = queue.pop_at(0)
	var new_unit = get_new_unit_type()
	queue.append(new_unit)
	return next
