extends Area2D


var vel = Vector2()
func _physics_process(delta: float) -> void:
	vel.x += gravity * delta
	position.x += vel.x * delta


func onSpikeHitPlayer(body: Node) -> void:
	$CollisionShape2D.set_deferred("disabled", true)
	$Spike.play()
	$Spike.animation = "Hit"
	if(body.name == "Character"):
		body.playerDamaged()
		queue_free()
	else:
		pass
		
