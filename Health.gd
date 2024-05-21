extends Node3D


func _on_area_3d_body_entered(body):
	for player in get_tree().get_nodes_in_group("Player"):
		player.str_upg1()
		queue_free()
	
