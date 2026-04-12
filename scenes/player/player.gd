extends CharacterBody2D
class_name  Player

@export var move_speed: float = 100

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	position = SceneManager.player_spawn_position
	print(move_speed)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var move_vector: Vector2 = Input.get_vector("move_left","move_right","move_up","move_down")
	
	velocity = move_vector *move_speed
	
	if velocity.x >0:
		$AnimatedSprite2D.play("move_right")
	elif velocity.x <0:
		$AnimatedSprite2D.play("move_left")
	elif velocity.y >0:
		$AnimatedSprite2D.play("move_down")
	elif velocity.y <0:
		$AnimatedSprite2D.play("move_up")
	else:
		$AnimatedSprite2D.stop()

	
	move_and_slide()
