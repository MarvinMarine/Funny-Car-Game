extends Node3D

@onready var collision_shape_3d: CollisionShape3D = $Area3D/CollisionShape3D

var delaunay: Delaunay

func _ready() -> void:
	regen(15)

func regen(points: int):
	delaunay = Delaunay.new()
	
	var boundingNode = collision_shape_3d
	var boundingShape = boundingNode.shape as BoxShape3D
	
	var lowx = boundingNode.global_position.x - (boundingShape.size.x / 2)
	var lowy = boundingNode.global_position.y - (boundingShape.size.y / 2)
	var highx = boundingNode.global_position.x + (boundingShape.size.x / 2)
	var highy = boundingNode.global_position.y + (boundingShape.size.y / 2)
	
	print("BOUNDS: (%s, %s) -> (%s, %s)" % [lowx, lowy, highx, highy])

	for i in range(points):
		var px = randf_range(lowx, highx)
		var py = randf_range(lowy, highy)
		print("Point: (%s, %s)" % [px, py])
		delaunay.add_point(Vector2(px, py))
		
		var ccar = preload("res://assets/bad_car.blend")
		var inst = ccar.instantiate()
		add_child(inst)
