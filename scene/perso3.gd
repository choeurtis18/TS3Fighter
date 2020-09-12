extends KinematicBody2D

var velocity = Vector2(0,0)

const VITESSE = 250
const GRAVITY = 35
const SAUT = 900
const SOL = Vector2(0,-1)

var vie = 200
var punching = false
var kicking = false
var highkicking = false
var ded = false

func _ready():
	pass


func _process(delta):	

	if vie <= 0:
		ded = true

	if ded:
		if $AnimatedSprite.frame == 4:
			$AnimatedSprite.playing = false
			get_tree().change_scene("res://scene/monde.tscn")
		$AnimatedSprite.animation = "KO"

	if not punching:
		$Attks/PunchHitBox.disabled = true
		$Attks/PunchHitBox2.disabled = true
	
	if not kicking:
		$Attks/KickHitBox.disabled = true
		$Attks/KickHitBox2.disabled = true
		
	if not highkicking:
		$Attks/JumpKickHitBox.disabled = true
		$Attks/JumpKickHitBox2.disabled = true
		
		
	if not ded:
	
		if Input.is_action_pressed("ui_right_2"):
			$AnimatedSprite.flip_h = false
			if is_on_floor() and not punching and not kicking and not highkicking:
				$AnimatedSprite.animation = "marche"
			velocity.x += VITESSE
			
		if Input.is_action_pressed("ui_left_2"):
			$AnimatedSprite.flip_h = true
			if is_on_floor() and not punching and not kicking and not highkicking:
				$AnimatedSprite.animation = "marche"
			velocity.x -= VITESSE
			
		if velocity.x == 0 and not Input.is_action_pressed("ui_down_2"):
			if is_on_floor() and not punching and not kicking and not highkicking:
				$AnimatedSprite.animation = "stop"
			
		if Input.is_action_pressed("ui_up_2"):
			if is_on_floor() and not punching and not kicking and not highkicking:
				velocity.y -= SAUT
				$AnimatedSprite.animation = "saut"
		
	velocity.y += GRAVITY
	
	if not ded:
			
		if Input.is_action_pressed("ui_down_2"):
			if is_on_floor() and not punching and not kicking and not highkicking:
				velocity.x = 0
				$AnimatedSprite.animation = "acroupi"
		
		if Input.is_action_just_pressed("ui_punch_2"):
			if not punching and not kicking and not highkicking:
				punching = true
				$AnimatedSprite.animation = "coup_poing"
				
		if not is_on_floor() and Input.is_action_just_pressed("ui_kick_2"):
			if not punching and not kicking and not highkicking:
				highkicking = true
				$AnimatedSprite.animation = "saut_coup_pied"
				
		if Input.is_action_just_pressed("ui_kick_2"):
			if not punching and not kicking and not highkicking:
				kicking = true
				$AnimatedSprite.animation = "coup_pied"
				
				
		
		
		if punching:
			if $AnimatedSprite.frame == 1:
				if $AnimatedSprite.flip_h:
					$Attks/PunchHitBox2.disabled = false
					$Attks/PunchHitBox.disabled = true
				else:
					$Attks/PunchHitBox2.disabled = true
					$Attks/PunchHitBox.disabled = false
			if $AnimatedSprite.frame == 2:
				punching = false
				$AnimatedSprite.animation = "stop"
				
		if kicking:
			if $AnimatedSprite.frame == 2:
				if $AnimatedSprite.flip_h:
					$Attks/KickHitBox2.disabled = false
					$Attks/KickHitBox.disabled = true
				else:
					$Attks/KickHitBox2.disabled = true
					$Attks/KickHitBox.disabled = false
			if $AnimatedSprite.frame == 4:
				kicking = false
				$AnimatedSprite.animation = "stop"
				
		if highkicking:
			if $AnimatedSprite.frame == 1:
				if $AnimatedSprite.flip_h:
					$Attks/JumpKickHitBox2.disabled = false
					$Attks/JumpKickHitBox.disabled = true
				else:
					$Attks/JumpKickHitBox2.disabled = true
					$Attks/JumpKickHitBox.disabled = false
			if $AnimatedSprite.frame == 3:
				highkicking = false
				$AnimatedSprite.animation = "stop"

		
	velocity = move_and_slide(velocity, SOL)
	
	#get_parent().get_node("CanvasLayer/Label").text = $AnimatedSprite.animation + "         " + str($AnimatedSprite.frame)
	get_parent().get_node("CanvasLayer/TextureProgress").value = vie
	
	velocity.x = 0