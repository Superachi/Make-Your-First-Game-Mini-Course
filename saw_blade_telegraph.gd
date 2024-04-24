extends Node2D

const SawScene = preload("res://saw_blade.tscn")

@onready var arrow_sprite_2d = $ArrowSprite2D
@onready var timer = $Timer

# Set a random direction, used for telegraphing and setting the actual sawblade direction
var direction = Vector2.RIGHT.rotated(randf_range(0, TAU))

# Called when the node enters the scene tree for the first time.
func _ready():
	arrow_sprite_2d.rotation = direction.angle()
	timer.timeout.connect(_on_timer_timeout)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_timer_timeout():
	# Instantiate the saw scene
	var saw = SawScene.instantiate()
	
	# Set its position and movement
	saw.position = position
	saw.linear_velocity = direction * 50
	
	# Add it to the current scene
	get_tree().current_scene.add_child(saw)
	
	# Delete this telegraph scene
	queue_free()
	pass
