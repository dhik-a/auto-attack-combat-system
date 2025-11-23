extends Node

func calculate_damage(power : int, defense : int, modifiers : Array[Modifier]) -> int:
	## use this formula --> damage = DMG * (K / (K + DEF)) where K = 20
	## use 20.0 to assign float type, because int can't divide with larger value (will result in 0)
	var damage = floori(power * (20.0 / (20.0 + defense)))
	for m in modifiers:
		if m.type == Enum.ModifierType.DamageReduction:
			if m.value_type == Enum.ValueType.Percentage:
				damage -= (damage * m.value / 100)
			else:
				damage -= m.value
	return damage
	
