extends Node

var curseur = 0

func _ready():
	pass

func _process(delta):
	
	if curseur == 0:
		$curseur.position = Vector2(50, 350)
	elif curseur == 1:
		$curseur.position = Vector2(160, 350)
	elif curseur == 2:
		$curseur.position = Vector2(270, 350)
			
	if Input.is_action_just_pressed("ui_right"):
		curseur += 1
	if Input.is_action_just_pressed("ui_left"):
		curseur -= 1
		
	if curseur == -1:
		curseur = 2
	elif curseur== 3:
		curseur = 0
	
	if curseur == 0:
		$perso_1_visage.animation = "choix_oui_1"
		$perso_2.visible = false
		$perso_3.visible = false
		if curseur == 0 and (Input.is_action_just_pressed("ui_accept")):
			get_tree().change_scene("res://scene/monde.tscn")
	
	elif curseur == 1:
		$perso_2_visage.animation = "choix_oui_2"
		$perso_1.visible = false
		$perso_3.visible 
		if curseur == 1 and (Input.is_action_just_pressed("ui_accept")):
			get_tree().change_scene("res://scene/monde.tscn")
		
	elif curseur == 2:
		$perso_3_visage.animation = "choix_oui_3"
		$perso_1.visible = false
		$perso_2.visible = false
		if curseur == 2 and (Input.is_action_just_pressed("ui_accept")):
			get_tree().change_scene("res://scene/monde.tscn")
			

