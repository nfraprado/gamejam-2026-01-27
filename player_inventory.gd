extends Node2D

var scraps = 0
var good = 0
var bad = 0
var max_units = 2

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_player_spawner_combat_kill() -> void:
	scraps += 1
	$"../ScrapsLabel/ScrapsCount".set_text(str(scraps))
	pass
