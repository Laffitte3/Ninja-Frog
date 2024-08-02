extends Node

var posx: float =0
var posy: float =0



func crearFruta():
		var platano = preload("res://bananas-reutilizables.tscn")
		var self_platano=platano.instantiate()
		
		posx=randf_range(-600.0,800.0)
		posy=110
		
		self_platano.position=Vector2(posx,posy)
		get_tree().get_root().add_child(self_platano)


func _on_timer_timeout():
	crearFruta()
