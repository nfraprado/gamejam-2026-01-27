extends Node2D

enum Type { ROCK, PAPER, SCISSORS }
enum Master { PLAYER, ENEMY }

var type
var speed = 500
var master
var _dead := false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _physics_process(delta: float) -> void:
	# direção: player sobe, enemy desce (ajuste se quiser)
	var dir := -1.0 if master == Master.PLAYER else 1.0
	$CharacterBody2D.velocity = Vector2(0, dir * speed)
	$CharacterBody2D.move_and_slide()
	
func init_unit(new_type, new_master):
	set_type(new_type)
	set_master(new_master)
	
func set_type(type):
	match type:
		Type.ROCK:
			$CharacterBody2D/MeshInstance2D.texture = preload("res://rock.png")
			type = Type.ROCK
		Type.PAPER:
			$CharacterBody2D/MeshInstance2D.texture = preload("res://paper.png")
			type = Type.PAPER
		Type.SCISSORS:
			$CharacterBody2D/MeshInstance2D.texture = preload("res://scissors.png")
			type = Type.SCISSORS

func set_master(new_master):
	master = new_master
