extends Area2D

@export var unit_scene: PackedScene

signal reached
signal combat_kill

var debounced = true
var next_type = 0

enum Type { ROCK, PAPER, SCISSORS }
enum Master { PLAYER, ENEMY }
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var unit = unit_scene.instantiate()
	var spawn_pos
	if not debounced:
		return
	if Input.is_action_pressed("SendLane1"):
		spawn_pos = $Lane1.get_global_position()
	elif Input.is_action_pressed("SendLane2"):
		spawn_pos = $Lane2.get_global_position()
	elif Input.is_action_pressed("SendLane3"):
		spawn_pos = $Lane3.get_global_position()
	elif Input.is_action_pressed("SendLane4"):
		spawn_pos = $Lane4.get_global_position()
	elif Input.is_action_pressed("SendLane5"):
		spawn_pos = $Lane5.get_global_position()
	else:
		return
	add_child(unit)
	unit.connect("combat_kill", handle_combat_kill, 0)
	unit.set_global_position(spawn_pos)
	unit.init_unit(next_type % 3, Master.PLAYER)
	next_type += 1
	match next_type % 3:
		0:
			$"../NextPreview".texture = preload("res://rock.png")
		1:
			$"../NextPreview".texture = preload("res://paper.png")
		2:
			$"../NextPreview".texture = preload("res://scissors.png")
	$Timer.start()
	debounced = false

func handle_combat_kill():
	print("combat kill")
	emit_signal("combat_kill")
	pass
	
func _on_timer_timeout() -> void:
	debounced = true

func _on_area_entered(area: Area2D) -> void:
	if area.get_parent().get_master() == Master.PLAYER:
		return
	emit_signal("reached")
	$ReachBad.play()
	area.get_parent().die()
