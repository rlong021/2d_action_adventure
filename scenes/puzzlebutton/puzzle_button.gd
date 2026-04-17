extends Area2D

var bodies_on_top:int = 0
signal pressed
signal unpressed

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("pushable") or body is Player:
		bodies_on_top +=1
		if bodies_on_top == 1:
			pressed.emit()
			print("I have been pushed.")
			$AnimatedSprite2D.play("pressed")
			
	
func _on_body_exited(body: Node2D) -> void:
	if body.is_in_group("pushable") or body is Player:
		bodies_on_top -=1
		if bodies_on_top == 0:
			unpressed.emit()
			print("I'm no longer pushed.")
			$AnimatedSprite2D.play("unpressed")
			
