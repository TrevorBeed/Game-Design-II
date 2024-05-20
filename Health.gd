extends Node3D

func _physics_process(delta):
	for player in get_tree().get_nodes_in_group("Player"):
		if $choose.overlaps_body(player):
