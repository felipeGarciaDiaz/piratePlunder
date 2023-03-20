extends CanvasLayer

func _ready() -> void:
	$TimePlayed.modulate.a = 0.5
func getScore() -> int:
	return int($TimePlayed.text)
