extends Control

func _ready() -> void:
	$".".hide()
	

func changeScore(time, show):
	if(show):
		$".".show()
		$AestheticLoader.start()
	else:
		$".".hide()
	$DoublePointsLabel.text = "Double Points Active " + str(time)
	


func loadByChar() -> void:
	$DoublePointsLabel.percent_visible += 0.25
