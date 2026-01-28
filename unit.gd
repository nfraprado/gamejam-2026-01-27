extends Node2D

enum Type { ROCK, PAPER, SCISSORS }
enum Master { PLAYER, ENEMY }

var type
var speed = 500
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
	
func set_type(type):
	match type:
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
