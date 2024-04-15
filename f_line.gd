extends Area3D

@export var next_level = "rc_world"
@onready var HUD = get_tree().get_first_node_in_group("HUD")
@onready var lap = 0


func _on_body_entered(body):
	if body.is_in_group("Car"): #TODO: NO GOING BACKWARDS INTO IT
		lap += 1
		if lap >= 3:
			HUD.popup.visible = true
			HUD.popup_label.text = "You Won!"
			await get_tree().create_timer(0.1).timeout
			var lvl = "res://" + next_level + ".tscn"
			get_tree().change_scene_to_file(lvl)
