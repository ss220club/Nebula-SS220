/spell/invisibility
	name = "invisibility"
	desc = "A simple spell of invisibility, for when you really just can't afford a paper bag."
	feedback = "IV"
	spell_flags = 0
	charge_max = 100
	invocation = "Ror Rim Or!"
	invocation_type = SpI_SHOUT
	var/on = 0
	hud_state = "invisibility"

/spell/invisibility/choose_targets()
	if(ishuman(holder))
		return holder

/spell/invisibility/cast(var/mob/living/human/H, var/mob/user)
	on = !on
	if(on)
		if(H.add_cloaking_source(src))
			playsound(get_turf(H), 'sound/effects/teleport.ogg', 90, 1)
			H.add_genetic_condition(GENE_COND_CLUMSY)
	else if(H.remove_cloaking_source(src))
		playsound(get_turf(H), 'sound/effects/stealthoff.ogg', 90, 1)
		H.remove_genetic_condition(GENE_COND_CLUMSY)