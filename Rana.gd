extends CharacterBody2D

var speed: int = 500


func _physics_process(delta):
	
	var MovDI= Input.get_axis("ui_left","ui_right")
	var Movimiento=Vector2(MovDI,0)
	
	if Input.is_action_pressed("ui_right"):
		$AnimatedSprite2D.flip_h = false
		
	elif Input.is_action_pressed("ui_left"):
		$AnimatedSprite2D.flip_h=true
	velocity= Movimiento.normalized()* speed
	
	
		
	move_and_slide()
		
