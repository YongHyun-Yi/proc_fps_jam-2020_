extends Interactable


export var open = false
export var usable = true

onready var tween = get_node("../Tween")

export var flip_factor = 1.0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass



func interact():
	if usable:
		if open:
			tween.interpolate_property(get_parent(), "transform:origin:x", 0.85 * flip_factor, 0, .5, Tween.TRANS_LINEAR, Tween.EASE_IN)
			tween.start()
		else:
			tween.interpolate_property(get_parent(), "transform:origin:x", 0, 0.85 * flip_factor, .5, Tween.TRANS_LINEAR, Tween.EASE_IN)
			tween.start()
		usable = false
		open = !open
	pass

func _on_Tween_tween_all_completed():
	usable = true
	pass # Replace with function body.