extends Area2D

var original_color = Color.GREEN
var touch_color = Color.RED

@onready var color_rect = $ColorRect

func _ready():
	body_entered.connect(_on_body_entered)
	body_exited.connect(_on_body_exited)


func _on_body_entered(body):
	if body.is_in_group("player"):
		color_rect.color = touch_color

func _on_body_exited(body):
	if body.is_in_group("player"):
		color_rect.color = original_color
