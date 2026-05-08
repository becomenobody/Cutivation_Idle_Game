extends Control

@onready var Level_Realm : Level_Realm_Data = Level_Realm_Data.new()

@onready var player_holder := %PlayerHolder
@onready var enemy_holder := %EnemyHolder

func Player_Holder_Display(player_data):
	player_holder.level.text = "%s" %Level_Realm.Realm[player_data.player_level.value]
	player_holder.health.text = "Health: %s" %player_data.player_health.value
	player_holder.attack.text = "Attack: %s" %player_data.player_attack.value
