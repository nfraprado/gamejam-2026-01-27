extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_player_spawner_reached() -> void:
	$Label2/BadScore.set_text(str(int($Label2/BadScore.get_text())+1))


func _on_enemy_spawner_reached() -> void:
	$Label/GoodScore.set_text(str(int($Label/GoodScore.get_text())+1))
