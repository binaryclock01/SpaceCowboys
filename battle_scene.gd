extends Node2D

class_name BattleSystem

# Define a Hero class to handle each hero's data
class Hero:
	var name: String
	var health: int
	var max_health: int
	var ammunition: int
	var max_ammunition: int
	var despair: int
	var max_despair: int
	var deck: Array
	var hand: Array

	func _init(name: String, max_health: int, max_ammunition: int, max_despair: int, deck: Array):
		self.name = name
		self.max_health = max_health
		self.health = max_health
		self.ammunition = max_ammunition
		self.max_ammunition = max_ammunition
		self.despair = despair
		self.max_despair = max_despair
		self.deck = deck.duplicate()
		self.hand = []

var heroes = [
	Hero.new("Hero 1", 100, 5, 0, ["Attack", "Defend", "Reload", "Special", "Heal"]),
	Hero.new("Hero 2", 120, 3, 0, ["Attack", "Defend", "Stun", "Special", "Shield"]),
	Hero.new("Hero 3", 80, 6, 0, ["Attack", "Defend", "Dodge", "Special", "Boost"])
]

var current_hero_index = 0

func _ready():
	# Set up the battle system
	draw_hero_hand()

func draw_hero_hand():
	# Draw 5 cards for the current hero
	var current_hero = heroes[current_hero_index]
	current_hero.hand.clear()

	for i in range(min(5, current_hero.deck.size())):
		var card = current_hero.deck.pop_front()
		current_hero.hand.append(card)

	update_ui()
	print("Hero:", current_hero.name, "drew cards:", current_hero.hand)

func play_card(card_name: String):
	var current_hero = heroes[current_hero_index]

	if card_name in current_hero.hand:
		current_hero.hand.erase(card_name)
		print("Played card:", card_name)

		match card_name:
			"Attack":
				print("Hero attacks!")
			"Defend":
				print("Hero defends!")
			"Reload":
				current_hero.ammunition += 1
				print("Hero reloads ammunition:", current_hero.ammunition)
			"Special":
				print("Hero uses a special ability!")
			"Heal":
				current_hero.health = min(current_hero.health + 10, current_hero.max_health)
				print("Hero heals. Health:", current_hero.health)

		update_ui()
		if current_hero.hand.empty():
			end_turn()
	else:
		print("Invalid card selection")

func end_turn():
	# Proceed to the next hero's turn
	current_hero_index = (current_hero_index + 1) % heroes.size()
	draw_hero_hand()

func update_ui():
	# Update the UI elements (health bars, hand display, etc.)
	for hero in heroes:
		print("Hero:", hero.name, "Health:", hero.health, "Ammunition:", hero.ammunition, "Despair:", hero.despair)
	print("Current Hero:", heroes[current_hero_index].name)
