#extends CharacterBody2D
#
#@export var speed := 3000

extends CharacterBody2D

@onready var sprite := $AnimatedSprite2D
@export var speed := 300
var last_dir :=Vector2.DOWN

func update_animate(dir):
	var anim = [
		["left_up", "up", "right_up"],
		["left", "idle", "right"],
		["left_down", "down", "right_down"]
	]
	
	if dir == Vector2.ZERO:
		sprite.play("idle")
		sprite.flip_h = last_dir.x < 0
		return
	sprite.play(anim[int(round(dir.y)+1)][int(round(dir.x)+1)])
	sprite.flip_h = true
	last_dir = dir
	
func _process(_delta):
	var dir = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	velocity  = dir * speed
	move_and_slide()
	update_animate(dir)
