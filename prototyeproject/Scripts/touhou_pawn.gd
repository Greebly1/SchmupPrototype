extends Node2D

var isPossessed : bool = true
var moveSpeed : float = 50.0

var inputVector : Vector2

func _process(delta: float) -> void:
	if (isPossessed) :
		pollInput()

func _physics_process(delta: float) -> void:
	move(delta)

func resetInput():
	inputVector = Vector2.ZERO

func pollInput():
	inputVector = Vector2(
		Input.get_axis("MoveLeft", "MoveRight"),
		Input.get_axis("MoveBackward", "MoveForward"))

func move(delta: float):
	position += moveSpeed * delta * inputVector
	$CharacterBody2D.move_and_collide(moveSpeed * delta * inputVector)
	print("moving")
	print(moveSpeed * delta * inputVector)
