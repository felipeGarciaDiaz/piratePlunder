extends Area2D

var vel = Vector2()

func _physics_process(delta: float) -> void:

	$AnimatedSprite.play()
	vel.y += gravity * delta
	position.y += vel.y * delta


func breakCannon(body: Node) -> void:
	$CollisionShape2D.set_deferred("disabled", true)
	if(body.name == "Character"):
		body.playerDamaged()
		$AnimatedSprite.animation = 'explode'
		vel.y = -10
		
	if(body.name == "TileMap" or body.name == "PalmTreeLeft"):
		vel.y = -10
		$AnimatedSprite.animation = 'breaking'
		
	yield($AnimatedSprite, "animation_finished")
	queue_free()
