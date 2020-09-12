extends Camera2D

onready var p1 = get_parent().get_node("KinematicBody2D")
onready var p2 = get_parent().get_node("KinematicBody2D2")

var p1x
var p2x
var xmoy
var my_y

func _ready():
	my_y = get_position().y
	pass

func _process(delta):
	p1x = p1.get_position().x
	p2x = p2.get_position().x
	xmoy = (p1x+p2x)/2.0
	position = Vector2(xmoy, my_y)
	
	
