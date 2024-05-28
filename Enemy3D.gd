extends CharacterBody3D

@onready var dmg_area = $DamageArea
@onready var atk_area = $AttackArea
@onready var nav_agent = $NavigationAgent3D


var SPEED = 5.0
var ACCEL = 20.0
var ATTACK = 10.0
var knockback = 32.0

var MAX_HEALTH = 100
var HEALTH = MAX_HEALTH

var inertia = Vector3.ZERO

var damage_lock = 0.0
var dmg = 10

func _physics_process(delta):
	for player in get_tree().get_nodes_in_group("Player"):
		if $AttackRange.overlaps_body(player):
			nav_agent.target_position = player.global_position
		if atk_area.overlaps_body(player):
			player.take_damage(dmg)
			var inert = player.global_position - self.global_position
			player.inertia = inert.normalized() * knockback
	var dir = (nav_agent.target_position - self.global_position).normalized()
	velocity = velocity.lerp(dir * SPEED, ACCEL * delta)
	move_and_slide()
	damage_lock = max(damage_lock-delta, 0.0)
	velocity += inertia
	inertia = inertia.move_toward(Vector3(), delta*1000.0)
	if get_tree().current_scene.name == "fp":
		dmg = 10
	if get_tree().current_scene.name == "fp2":
		dmg = 20
	if get_tree().current_scene.name == "fp3":
		dmg = 30
	if get_tree().current_scene.name == "fp4":
		dmg = 40
		

func take_damage(dmg):
	HEALTH -= dmg
	if HEALTH <= 0:
		queue_free()
