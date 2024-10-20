extends Node3D

class_name PhysicsBehavior

enum ActivationType {IMPULSE, TOGGLE}

@export var force_type: PhysicsTypes.ForceType = PhysicsTypes.ForceType.LINEAR
@export var reverse_force: bool = false
@export var activation_type: ActivationType = ActivationType.IMPULSE

var force_vector = Vector3.UP:
	get: 
		return -1 * force_vector if reverse_force else force_vector

var parent_rest_transform: Transform3D
var parent_body: RigidBody3D:
	set(body):
		parent_body = body
		parent_rest_transform = body.transform
		
var activated: bool = false

func init(body: RigidBody3D):
	self.parent_body = body
	self.parent_rest_transform = body.transform
	
func activate(active: bool):
	activated = active

func process_behavior(_delta):
	pass

func _physics_process(delta):
	process_behavior(delta)
	if activated and activation_type == ActivationType.IMPULSE:
		activated = false
