extends Node2D

# this catches all clicks on the labels for the cryptogram
func _input(event):
	if event is InputEventMouseButton:
		# TODO: activate the textbox for the person to enter their guess
		pass

# Called when the node enters the scene tree for the first time.
func _ready():
	# Choose a quote
	var quote = choose_quote()
	
	# encode it 
	var encoding_table = get_encoding_table()

	# make a label for each character in the string
	for i in range(0,len(quote)):
		#var new_letter = Grid_Cell.new()
		var new_grid_cell := Grid_Cell.new_grid_cell(quote[i],encoding_table,i)
		add_child(new_grid_cell)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func choose_quote():
	var selected_quote = "HELLO WORLD. HELLO WORLD. HELLO WORLD"
	return selected_quote

func get_encoding_table():
	# make a dictionary of all letters
	var unscrambled_letters = ['A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z']
	
	# make a scrambled array of all letters
	var scrambled_letters = ['A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z']
	scrambled_letters.shuffle()
	
	var encoding = {}
	for i in unscrambled_letters.size():
		encoding[unscrambled_letters[i]] = scrambled_letters[i] 
	
	# append spaces and punctuation to the dictionary so they remain unchanged
	encoding[" "] = " "
	encoding["."] = "."
	encoding[";"] = ";"
	encoding["!"] = "!"
	encoding[":"] = ":"
	encoding["-"] = "-"
	  
	return encoding
