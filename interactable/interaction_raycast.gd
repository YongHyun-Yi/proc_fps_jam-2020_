extends RayCast


var current_collider
var interact_label


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var collider = get_collider()
	
	if is_colliding() and collider is Interactable:
		if current_collider != collider:
			current_collider = collider
			#print("뭔가 부딫힘")
		
		collider.get_interaction_icon()
		
	elif current_collider:
		#print("부딫히는데 아무것도 없음")
		GlobalRef.uis.get_node("cursor").cursor_reset()
		current_collider = null

func _unhandled_input(event):
	if event is InputEventMouseButton:
		if event.is_pressed():
			if Input.is_action_just_pressed("left_click"):
				if current_collider:
					current_collider.interact()
