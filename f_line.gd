extends Area3D

@export var next_level = ""
@onready var lap = 0

func _on_body_entered(body):
	if body.is_in_group("Car"):
		if Input.is_action_pressed(""):
			lap += 0
		else:
			lap += 1
			if lap >= 3:
				OS.alert("YOU WIN")
				await get_tree().create_timer(0.1).timeout
				var lvl = "res://" + next_level + ".tscn"
				get_tree().change_scene_to_file(lvl)
				
