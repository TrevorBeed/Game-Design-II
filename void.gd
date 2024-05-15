extends Area3D



func _on_body_entered(body):
	if body.is_in_group("Player"):
		await get_tree().create_timer(0.25).timeout
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		OS.alert("You died!")
		get_tree().change_scene_to_file("res://fp.tscn")
