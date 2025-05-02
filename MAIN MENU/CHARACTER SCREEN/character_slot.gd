extends Panel

var icon = null:
	set(value):
		icon = value
		$TextureButton.texture.normal = value
signal pressed

func _ready():
	$select.hide()

func _button_pressed():
	for slot in  get_parent().get_children():
		slot.deselect()
		
	$select.show()
	pressed.emit()
	
func deselect():
	$select.hide()
