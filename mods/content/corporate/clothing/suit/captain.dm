/obj/item/clothing/suit/armor/captain
	name = "Captain's armor"
	desc = "A bulky, heavy-duty piece of exclusive corporate armor. YOU are in charge!"
	icon_state = ICON_STATE_WORLD
	icon = 'mods/content/corporate/icons/clothing/suit/capspace.dmi'
	w_class = ITEM_SIZE_HUGE
	gas_transfer_coefficient = 0.01
	permeability_coefficient = 0.02
	max_pressure_protection = VOIDSUIT_MAX_PRESSURE
	min_pressure_protection = 0
	body_parts_covered = SLOT_UPPER_BODY|SLOT_LOWER_BODY|SLOT_LEGS|SLOT_FEET|SLOT_ARMS|SLOT_TAIL
	allowed = list(/obj/item/tank/emergency, /obj/item/flashlight,/obj/item/gun/energy, /obj/item/gun/projectile, /obj/item/ammo_magazine, /obj/item/ammo_casing, /obj/item/baton,/obj/item/handcuffs)
	armor = list(
		ARMOR_MELEE = ARMOR_MELEE_MAJOR,
		ARMOR_BULLET = ARMOR_BALLISTIC_RESISTANT,
		ARMOR_LASER = ARMOR_LASER_HANDGUNS,
		ARMOR_ENERGY = ARMOR_ENERGY_SMALL,
		ARMOR_BOMB = ARMOR_BOMB_RESISTANT,
		ARMOR_BIO = ARMOR_BIO_SHIELDED,
		ARMOR_RAD = ARMOR_RAD_SMALL
		)
	flags_inv = HIDEGLOVES|HIDESHOES|HIDEJUMPSUIT|HIDETAIL
	cold_protection = SLOT_UPPER_BODY | SLOT_LOWER_BODY | SLOT_LEGS | SLOT_FEET | SLOT_ARMS | SLOT_HANDS
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE
	siemens_coefficient = 0.7

/obj/item/clothing/suit/armor/captain/Initialize()
	. = ..()
	LAZYSET(slowdown_per_slot, slot_wear_suit_str, 1.5)
