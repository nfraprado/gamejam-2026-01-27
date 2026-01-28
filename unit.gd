extends Node2D
class_name Unit

enum Type { ROCK, PAPER, SCISSORS }
enum Master { PLAYER, ENEMY }

var type
var speed = 200
var master
var _dead := false

@onready var area = $Area2D
@onready var mesh = $Area2D/MeshInstance2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var dir := -1.0 if master == Master.PLAYER else 1.0
	position += Vector2(0, delta * speed * dir)
	
	
func init_unit(new_type, new_master):
	set_type(new_type)
	set_master(new_master)
	
func set_type(new_type):
	match new_type:
		Type.ROCK:
			mesh.texture = preload("res://rock.png")
			type = Type.ROCK
		Type.PAPER:
			mesh.texture = preload("res://paper.png")
			type = Type.PAPER
		Type.SCISSORS:
			mesh.texture = preload("res://scissors.png")
			type = Type.SCISSORS

func set_master(new_master):
	master = new_master
	
func get_master():
	return master
	
func get_type():
	return type

func _on_area_2d_area_entered(area: Area2D) -> void:
	if not area.get_parent().has_method("get_master"):
		return
	if not master == Master.PLAYER:
		return
	var enemy_unit = area.get_parent()
	if master != enemy_unit.get_master():
		var outcome = types_collision_outcomes(type, enemy_unit.get_type())
		print("enemy type: ", enemy_unit.get_type())
		print("outcome: ", outcome)
		match outcome:
			0: #draw
				set_master(Master.ENEMY)
				pass
			1: #wins
				enemy_unit.die()
				pass
			2: #loses
				die()
				pass

func die():
	queue_free()

func types_collision_outcomes(type1, type2):
	var outcome = 0 # 0 = DRAW, 1 = FIRST WINS, 2 = FIRST LOSES
	match type1:
		Type.ROCK:
			if type2 == Type.SCISSORS:
				outcome = 1
			elif type2 == Type.PAPER:
				outcome = 2
		Type.PAPER:
			if type2 == Type.ROCK:
				outcome = 1
			elif type2 == Type.SCISSORS:
				outcome = 2
		Type.SCISSORS:
			if type2 == Type.PAPER:
				outcome = 1
			elif type2 == Type.ROCK:
				outcome = 2
	return outcome
