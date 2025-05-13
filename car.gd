extends RigidBody3D

@onready var ray_cast_3d: RayCast3D = $RayCast3D
var Forward_Speed = 3000
var Side_Speed = 2000
var Reverse_Speed = 1000

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	# print(self.rotation)
	if ray_cast_3d.is_colliding():
		apply_central_force(Vector3(0,global_position.distance_to(ray_cast_3d.get_collision_point())*3,0))
		
	var dir = -global_transform.basis.z
	if Input.is_action_pressed("Forward"):
		apply_central_force(dir * Forward_Speed * delta)
		
	if Input.is_action_pressed("Left"):
		apply_torque(Vector3(0,Side_Speed * delta,0))
		
	if Input.is_action_pressed("Right"):
		apply_torque(Vector3(0,Side_Speed * -1 * delta,0))
		
	if Input.is_action_pressed("Down"):
		apply_central_force(-dir * Reverse_Speed * delta)
