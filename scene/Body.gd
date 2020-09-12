extends Area2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var mynode
var othernode

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func _process(delta):
	# Called every frame. Delta is time since last frame.
	# Update game logic here.
	pass


func _on_Body_area_shape_entered(area_id, area, area_shape, self_shape):
	
	pass # replace with function body


func _on_Body_body_entered(body):
	print("hit!")
	if body.get_name() == "Attks":
		print("FUCK!")
		if get_parent().name == "KinematicBody2D":
			mynode = get_parent()
			othernode = get_parent().get_parent().get_node("KinematicBody2D2")
			if othernode.punching:
				mynode.vie = mynode.vie - 5
				if othernode.position.x > mynode.position.x:
					mynode.velocity.x -= 200
				else:
					mynode.velocity.x += 200
			if othernode.kicking:
				mynode.vie = mynode.vie - 10
				if othernode.position.x > mynode.position.x:
					mynode.velocity.x -= 400
				else:
					mynode.velocity.x += 400
			if othernode.highkicking:
				mynode.vie = mynode.vie - 15
				if othernode.position.x > mynode.position.x:
					mynode.velocity.x -= 800
				else:
					mynode.velocity.x += 800
		elif get_parent().name == "KinematicBody2D2":
			mynode = get_parent().get_parent().get_node("KinematicBody2D2")
			othernode = get_parent().get_parent().get_node("KinematicBody2D")
			if othernode.punching:
				mynode.vie = mynode.vie - 5
				if othernode.position.x > mynode.position.x:
					mynode.velocity.x -= 200
				else:
					mynode.velocity.x += 200
			if othernode.kicking:
				mynode.vie = mynode.vie - 10
				if othernode.position.x > mynode.position.x:
					mynode.velocity.x -= 400
				else:
					mynode.velocity.x += 400
			if othernode.highkicking:
				mynode.vie = mynode.vie - 15
				if othernode.position.x > mynode.position.x:
					mynode.velocity.x -= 800
				else:
					mynode.velocity.x += 800
