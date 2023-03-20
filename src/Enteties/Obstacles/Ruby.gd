extends Area2D


var vel = Vector2()

func _physics_process(delta: float) -> void:
	$AnimatedSprite.play()
	vel.y += gravity * delta
	position.y += vel.y * delta
	
	
#var scoreScene = preload("res://src/UI/Score.tscn")
#var rubyCollected = 0
#func onCollectRuby(body: Node) -> void:
#	var worldScene = load("res://src/Maps/Map.tscn").instance()
#	var rubyArray = worldScene.rubies
#	print(rubyArray.size())
#	
#	if (body.name == "Character"):
#		rubyCollected += 1
#		
#		for i in range(rubyArray.size()):
#			print("ruby collected: " + str(rubyArray[i]) + " : " + str(rubyCollected))
#			rubyArray[i].queue_free()
#		#rubyCollected += 1
#		#print(rubyCollected)
#		#var score = scoreScene.instance().get_node(".")
#		#score.raiseScore(rubyCollected)
#		#the score only goes up if the same ruby is collected
#		#how do we fix this?
#		#with arrays!

	


	




func onRubyCollected(body: Node) -> void:
	queue_free()
