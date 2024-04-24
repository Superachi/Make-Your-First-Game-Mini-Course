extends CharacterBody2D
@onready var hurtbox = $Hurtbox

# _ready() is called when the game starts up (runs once)
func _ready():
	hurtbox.body_entered.connect(_on_hurtbox_body_entered)

# _physics_process() gets called every single physics step
func _physics_process(delta):
	var input_vector = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	velocity = input_vector * 100
	move_and_slide()

func _on_hurtbox_body_entered(body):
	queue_free()
