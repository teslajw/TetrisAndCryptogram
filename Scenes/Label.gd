extends Label


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _input(event):
	if event is InputEventMouseButton:
		if event.is_pressed():
			# hide the label
			self.visible = false
			# show the line edit
			var selected_line_edit = get_parent().get_node("LineEdit")
			selected_line_edit.visible = true
		
	if Input.is_action_just_pressed("enter"):
		# hide the label
		self.visible = true
		# show the line edit
		var selected_line_edit = get_parent().get_node("LineEdit")
		selected_line_edit.visible = false
		
	pass
