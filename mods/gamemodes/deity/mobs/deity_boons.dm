/mob/living/deity/proc/set_boon(var/datum/boon)
	if(current_boon)
		qdel(current_boon)
	current_boon = boon
	to_chat(src, SPAN_NOTICE("You now have the boon [boon]"))
	if(istype(boon, /atom/movable))
		var/atom/movable/A = boon
		nano_data["boon_name"] = A.name
		A.forceMove(src)
	else if(istype(boon, /spell))
		var/spell/S = boon
		nano_data["boon_name"] = S.name

/mob/living/deity/proc/grant_boon(var/mob/living/L)
	if(istype(current_boon, /spell) && !grant_spell(L, current_boon))
		return
	else if(istype(current_boon, /obj/item))
		var/obj/item/I = current_boon
		I.dropInto(L.loc)
		var/origin_text = "on the floor"
		if(L.equip_to_appropriate_slot(I))
			origin_text = "on your body"
		else if(L.put_in_hands_or_del(I))
			origin_text = "in your hands"
		else
			var/obj/O =  L.equip_to_storage(I)
			if(O)
				origin_text = "in \the [O]"
		to_chat(L, SPAN_NOTICE("It appears [origin_text]."))

	to_chat(L, SPAN_OCCULT("\The [src] grants you a boon of [current_boon]!"))
	to_chat(src, SPAN_NOTICE("You give \the [L] a boon of [current_boon]."))
	log_and_message_admins("gave [key_name(L)] the boon [current_boon]")
	current_boon = null
	nano_data["boon_name"] = null
	return

/mob/living/deity/proc/grant_spell(var/mob/living/target, var/spell/spell)
	var/datum/mind/M = target.mind
	for(var/s in M.learned_spells)
		var/spell/S = s
		if(istype(S, spell.type))
			to_chat(src, SPAN_WARNING("They already know that spell!"))
			return 0
	target.add_spell(spell)
	spell.set_connected_god(src)
	to_chat(target, SPAN_NOTICE("You feel a surge of power as you learn the art of [current_boon]."))
	return 1

/* This is a generic proc used by the God to enact a sacrifice from somebody. Power is a value of magnitude.
*/
/mob/living/deity/proc/take_charge(var/mob/living/L, var/power)
	if(form)
		form.take_charge(L, power)