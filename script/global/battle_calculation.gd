extends Node

func calculate_damage(power : int, defense : int) -> int:
	## use this formula --> damage = DMG * (K / (K + DEF)) where K = 20
	## use 20.0 to assign float type, because int can't divide with larger value (will result in 0)
	return floori(power * (20.0 / (20.0 + defense)))
	
