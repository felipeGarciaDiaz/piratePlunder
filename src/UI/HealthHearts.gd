extends Control


func updateHealth(healthAmount):
	if healthAmount == 2: 
		$Heart3.hide()
	elif healthAmount == 1:
		$Heart2.hide()
	else:
		$Heart1.hide()
		print("game over")
