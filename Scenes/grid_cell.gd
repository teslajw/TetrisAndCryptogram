class_name Grid_Cell
extends Node2D

@export var text = ""

var bounds = {
	"min_x": -216,
	"max_x": 216,
	"max_y": 457
}

var grid_cell_data
var grid_cells = []
var lineEdit

var letter: String
var encoding_dictionary: Dictionary
var letter_position: int # location within the string where the specific letter is locatedd

static func new_grid_cell(letter:= " ", encoding_dictionary:= {}, letter_position := 0) -> Grid_Cell:
	# make a new grid cell and place it properly
	var grid_cell_scene: PackedScene = load("res://Scenes/grid_cell.tscn")
	var new_grid_cell: Grid_Cell = grid_cell_scene.instantiate()
	new_grid_cell.position = get_grid_position(letter_position)
	
	# get the text label for the encrypted label
	var grid_encrypted_label = new_grid_cell.get_node("Encrypted_label")
	grid_encrypted_label.text = encoding_dictionary[letter]

	# make the encrypted label larger
	grid_encrypted_label.add_theme_font_size_override("font_size", 50)
	
	# make the encrypted label visible 
	grid_encrypted_label.visible = true
	
	# get the text label for the decrypted label
	var grid_decrypted_label = new_grid_cell.get_node("Decrypted_label")
	grid_decrypted_label.text = letter
	
	# make the decrypted label larger
	grid_decrypted_label.add_theme_font_size_override("font_size", 50)
	
	# make the decrypted label not visible  
	grid_decrypted_label.visible = false
	
	# for when it's solved, make the label have a green color
	grid_decrypted_label.add_theme_font_size_override("font_color", 0x00ab00)
	# get the LineEdit 
	var grid_line_edit = new_grid_cell.get_node("LineEdit")
	
	# set the line edit to have the same text as the label
	grid_line_edit.text = encoding_dictionary[letter]
	
	# make the font size larger
	grid_line_edit.add_theme_font_size_override("font_size", 50)
	
	# make the line edit hidden by default
	grid_line_edit.visible = false
	
	return new_grid_cell

static func get_grid_position(letter_position):
	# set inital x linand y values
	var y_offset = -388
	var x_offset = -234
	
	# calculate offsets
	var x_spacing = 48 * (letter_position%10)
	var y_spacing = 48 * (letter_position/10)
	return Vector2(x_spacing + x_offset, y_offset + y_spacing)
# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

