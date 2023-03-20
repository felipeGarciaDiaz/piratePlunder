extends Node2D
var rubyCollected = 0
var cannonScene = preload("res://src/Enteties/Obstacles/Cannon.tscn")
var rubyScene = preload("res://src/Enteties/Obstacles/Ruby.tscn")
var spikeScene = preload("res://src/Enteties/Obstacles/Spike.tscn")
var scorePowerUpScene = preload("res://src/Enteties/Obstacles/ScorePowerUp.tscn")


func spawnTimer(scene: PackedScene, minX, maxX, minY, maxY) -> void:
	var object = scene.instance()
	object.position = Vector2(rand_range(minX, maxX), rand_range(minY, maxY))
	add_child(object)
	
func _ready() -> void:
	
	randomize()
	spikeScene.instance().z_index = 1
	
	$RubyTimer.connect("timeout", self, "spawnTimer", [rubyScene, -475, 1000, -500, -500])
	$ScorePowerUpTimer.connect("timeout", self, "spawnTimer", [scorePowerUpScene, -475, 1000, -500, -500])
	$CannonTimer.connect("timeout", self, "spawnTimer", [cannonScene, -475, 1000, -500, -500])
	$SpikeTimer.connect("timeout", self, "spawnTimer", [spikeScene, -500, -500, -400, 450])
	
	$CannonTimer.wait_time = 10000.0
	$SpikeTimer.wait_time = 10000.0
	$RubyTimer.wait_time = .25
	$ScorePowerUpTimer.wait_time = 5.0

func _process(delta: float) -> void:
	var score = int($Character/Score/TimePlayed.text)
	if (score > 0):
		var difficultyCalc = 0.5 * 100 / (100 + score)
		#print(float(difficultyCalc))
		$CannonTimer.wait_time = float(difficultyCalc)
		$SpikeTimer.wait_time = float(difficultyCalc)
		



	

func onPlayerFall(body: Node) -> void:

	if(body.name == "Character"):
		body.playerDamaged()
	else:
		body.queue_free()




func onObjectFall(area: Area2D) -> void:
	area.queue_free()
