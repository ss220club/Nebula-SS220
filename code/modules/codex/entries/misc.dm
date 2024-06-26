/datum/codex_entry/suitcooler
	associated_paths = list(/obj/item/suit_cooling_unit)
	mechanics_text = "You may wear this instead of your backpack to cool yourself down. It is commonly used by full-body prosthetic users, \
	as it allows them to go into low pressure environments for more than few seconds without overhating. It runs off energy provided by internal power cell. \
	Remember to turn it on by clicking it when it's your in your hand before you put it on."
	available_to_map_tech_level = MAP_TECH_LEVEL_SPACE

/datum/codex_entry/barsign
	associated_paths = list(/obj/structure/sign/double/barsign)
	mechanics_text = "If your ID has bar access, you may swipe it on this sign to alter its display."
	available_to_map_tech_level = MAP_TECH_LEVEL_SPACE

/datum/codex_entry/sneakies
	associated_paths = list(/obj/item/clothing/shoes/dress/sneakies)
	lore_text =  "Originally designed to confuse Terran troops on the swamp moon of Nabier XI, where they were proven somewhat effective. Not bad on a space vessel, either."
	available_to_map_tech_level = MAP_TECH_LEVEL_SPACE

/datum/codex_entry/moneygun
	associated_paths = list(/obj/item/gun/launcher/money)
	mechanics_text = "Load money into the cannon by picking it up with the gun, or feeding it directly by hand. Use in your hand to configure how much money you want to fire per shot."
	lore_text = "These devices were invented several centuries ago and are a distinctly human cultural infection. They have produced knockoffs as timeless and as insipid as the potato gun and the paddle ball, showing up in all corners of the galaxy. The Money Cannon variation is noteworthy for its sturdiness and build quality, but is, at the end of the day, just another knockoff of the ancient originals."
	antag_text = "Sliding a cryptographic sequencer into the receptacle will short the motors and override their speed. If you set the cannon to dispense 100 units or more, this might make a handy weapon."
	include_subtypes = TRUE
	available_to_map_tech_level = MAP_TECH_LEVEL_SPACE
