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
var damage_lock = 0.0  # Prevent infinite damage
var attack_lock = 0.0
var inertia = Vector3.ZERO

func _physics_process(delta):
	for player in get_tree().get_nodes_in_group("Player"):
		if $AttackRange.overlaps_body(player):
			nav_agent.target_position = player.global_position
		if atk_area.overlaps_body(player):
			player.take_damage(ATTACK)
			var inert = player.global_position - self.global_position
			player.inertia = inert.normalized() * knockback
	var dir = (nav_agent.target_position - self.global_position).normalized()
	velocity = velocity.lerp(dir * SPEED, ACCEL * delta)
	move_and_slide()


#WORK ON THIS
func take_damage(dmg):
	if damage_lock == 0.0:
		damage_lock = 0.5
		HEALTH -= dmg
	if HEALTH <= 0:
		queue_free()
		

