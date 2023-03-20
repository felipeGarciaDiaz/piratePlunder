
#powerup.TSCN
extends KinematicBody2D

var vel = Vector2()
var gravity = 100
var powerUpTimer

#LOAD THE PLAYER SCENE
var playerScene = preload("res://src/Enteties/Character.tscn")
var powerUpActive = false


func _physics_process(delta: float) -> void:
	$AnimatedSprite.play()
	vel.y += gravity * delta
	position.y += vel.y * delta
	vel = move_and_slide(vel, Vector2.UP)
	if(powerUpActive):
		get_parent().get_node("Character/PowerUpUI").changeScore(int($Countdown.get_time_left()), true)
	



#SIGNAL ATTACHED TO AREA2D, CALLED WHEN PLAYER TOUCHES THE POWERUP
func onPlayerPickup(body: Node) -> void:
	if(body.name == "Character"):
		print("POWER UP STARTED\n-----------------------------------------------\n\n\n")
		powerUpActive = true
		
		#JUST SETTING THE POSITION RIGHT NOW WILL FIX LATER
		$".".position.x = 100000
		$".".position.y = 100000
		
		#ONCE POWERUP IS ACTIVE WE CALL THE COUNTDOWN TO START AND WE CALL THE DOUBLESCORE FUNCTION IN PLAYER
		if (powerUpActive == true):
			print("SCOREPOWERUP.TSCN -- POWER UP IS SET TO ACTIVE\n\n\n")
			$Countdown.start()
			body.doubleScore(true)


# FUNCTION THAT GETS CALLED WHEN OUR TIMER TIMESOUT
func onCountdownEnd() -> void:
	print("SCOREPOWERUP.TSCN -- ONCOUNTDOWN END CALLED -- POWER UP SHOULD END\n\n\n")
	powerUpActive = false
	$Countdown.stop()
	get_parent().get_node("Character").doubleScore(false)

	get_parent().get_node("Character/PowerUpUI").changeScore(0, false)
	queue_free()

		
