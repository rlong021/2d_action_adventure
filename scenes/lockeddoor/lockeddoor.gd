extends StaticBody2D


func _on_puzzle_button_pressed() -> void:
	visible = false
	$CollisionShape2D.set_deferred("disabled",true)


func _on_puzzle_button_unpressed() -> void:
	visible = true
	$CollisionShape2D.set_deferred("disabled",false)
