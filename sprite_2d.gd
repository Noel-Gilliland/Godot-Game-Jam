extends Sprite2D

@onready var viewport_size = get_viewport_rect().size

func _ready():
	scale.x = viewport_size.x / texture.get_width()
	scale.y = viewport_size.y / texture.get_height()
