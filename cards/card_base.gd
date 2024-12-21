extends MarginContainer


@export var card_id: String = "test"

# Called when the node enters the scene tree for the first time.
func _ready():
	change_card(card_id)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func change_card(card_id: String):
	if card_id == "None":
		self.hide();
		return
	else:
		self.show();
	
	var CardSize = self.size
	#$Border.scale = CardSize/$Border.texture.get_size()
	$Background.scale = CardSize/$Background.texture.get_size()
	#$Image.scale = CardSize/$Image.texture.get_size()
