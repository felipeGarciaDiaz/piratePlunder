extends KinematicBody2D

var scoreScene = preload("res://src/UI/Score.tscn")


var speed = 200
var jumpForce = 500
var health = 3
var gravity = 1000
var vel = Vector2()

func _physics_process(delta: float) -> void:
	vel.x = 0
	#$AnimatedSprite.play("idle")
	if Input.is_action_pressed("move_left"):
		vel.x -= speed

	if Input.is_action_pressed("move_right"):
		vel.x += speed

	if Input.is_action_pressed("jump") and is_on_floor():
		vel.y -= jumpForce

	if vel.length() > 0:
		$AnimatedSprite.play()
	if vel.x != 0:
		$AnimatedSprite.animation = "move"
		$AnimatedSprite.flip_h = vel.x < 0
	elif vel.y < 0:
		$AnimatedSprite.animation = "jump"
	elif vel.x == 0 or vel.y == 0:
		$AnimatedSprite.animation = "idle"
	vel = move_and_slide(vel, Vector2.UP)
	vel.y += gravity * delta
	
	

func playerDamaged():
	health -= 1
	$Hearts.updateHealth(health)

	

var rubyCollected = 0
var doubleTheScore = false

func onCollectRuby(area: Area2D) -> void:
	if(area.is_in_group("rubies")):
		if (doubleTheScore):
			print("CHARACTER.TSCN -- POWER UP ACTIVE RUBIES -- " + str(doubleTheScore) + "\nRUBY PICKED UP -- CHARACTER.TSCN\n\n\n")
			rubyCollected += 2
		else:
			print("CHARACTER.TSCN -- NORMAL RUBIES -- " + str(doubleTheScore) + "\nRUBY PICKED UP -- CHARACTER.TSCN\n\n\n")
			rubyCollected += 1
		$Score/TimePlayed.text = str(rubyCollected)
		

func doubleScore(boolean) -> void:

	doubleTheScore = boolean
	print("CHARACTER.TSCN -- DOUBLE SCORE FUNCTION CALLED/nCHARACTER.TSCN: " + str(doubleTheScore) + "\n\n\n")
