extends Node3D

@export_enum("left", "right") var flipper_button: String = "left"

@onready var flipper_action: String = "flipper_l" if flipper_button == "left" else "flipper_r"
@onready var actuator: SolenoidSpring = $FlipperBody/SolenoidSpring

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	actuator.init($FlipperBody)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed(flipper_action):
		actuator.activate(true)
	elif Input.is_action_just_released(flipper_action):
		actuator.activate(false)
