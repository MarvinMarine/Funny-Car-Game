extends Camera3D

@onready var car: RigidBody3D = $"../Car"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


func _process(delta: float) -> void:
	global_position = lerp(global_position, car.get_node("Marker3D").global_position, 3 * delta)
	rotation = transform.looking_at(car.global_position).basis.get_euler()
