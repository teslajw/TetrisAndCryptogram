extends CollisionShape2D


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
			var encrypted_label = get_parent().get_node("Encrypted_label") 
			encrypted_label.visible = false
			# show the line edit
			var selected_line_edit = get_parent().get_node("LineEdit")
			selected_line_edit.visible = true
		
	if Input.is_action_just_pressed("enter"):
		# hide the line edit
		var selected_line_edit = get_parent().get_node("LineEdit")
		selected_line_edit.visible = false
		# check if the input letter is correct, adding uppercase 
		var current_input = selected_line_edit.text.to_upper()
		var correct_input = get_parent().get_node("Decrypted_label").text
		
		# if the letter was correct, show the decrypted label
		if current_input == correct_input: 
			var decrypted_letter = get_parent().get_node("Decrypted_label")
			decrypted_letter.visible = true
			selected_line_edit.visible = false
			
			#TODO: also un-hide all other matching letters 
			
		else:
			var encrypted_letter = get_parent().get_node("Encrypted_label")
			encrypted_letter.visible = true
		
		# hide the edit 
		selected_line_edit.visible = false
		
	pass


func _on_renamed():
	pass # Replace with function body.
