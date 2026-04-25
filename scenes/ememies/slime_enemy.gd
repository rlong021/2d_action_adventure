extends CharacterBody2D

@export var speed = 30

var target: Node2D

func _physics_process(delta: float) -> void:
	chase_target()
	
	animate_enemy()
	
	move_and_slide()

func _on_player_detection_area_2d_body_entered(body: Node2D) -> void:
	if body is Player:
		target = body
		
func chase_target():
	if target:
		var distance_to_player: Vector2
		distance_to_player = target.global_position - global_position
		
		var direction_normal: Vector2 = distance_to_player.normalized()

		velocity = direction_normal * speed

func animate_enemy():
	var normal_velocity: Vector2 = velocity.normalized()
	
	if normal_velocity.x > 0.707:
		$AnimatedSprite2D.play("move_right")
	elif normal_velocity.x < -0.707:
		$AnimatedSprite2D.play("move_left")
	elif normal_velocity.y > 0.707:
		$AnimatedSprite2D.play("move_down")
	elif normal_velocity.y < -0.707:
		$AnimatedSprite2D.play("move_up")
