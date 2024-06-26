//Brain slug proc for voluntary removal of control.
/mob/living/proc/release_control()

	set category = "Abilities"
	set name = "Release Control"
	set desc = "Release control of your host's body."

	var/mob/living/simple_animal/borer/B = HAS_BRAIN_WORMS(src)

	if(B && B.host_brain)
		to_chat(src, "<span class='danger'>You withdraw your probosci, releasing control of [B.host_brain]</span>")

		B.detach_from_host()

		verbs -= /mob/living/proc/release_control
		verbs -= /mob/living/proc/punish_host
		verbs -= /mob/living/proc/spawn_larvae

	else
		to_chat(src, "<span class='danger'>ERROR NO BORER OR BRAINMOB DETECTED IN THIS MOB, THIS IS A BUG !</span>")

//Brain slug proc for tormenting the host.
/mob/living/proc/punish_host()
	set category = "Abilities"
	set name = "Torment host"
	set desc = "Punish your host with agony."

	var/mob/living/simple_animal/borer/B = HAS_BRAIN_WORMS(src)

	if(!B)
		return

	if(B.host_brain.ckey)
		to_chat(src, "<span class='danger'>You send a punishing spike of psychic agony lancing into your host's brain.</span>")
		if (!can_feel_pain())
			to_chat(B.host_brain, "<span class='warning'>You feel a strange sensation as a foreign influence prods your mind.</span>")
			to_chat(src, "<span class='danger'>It doesn't seem to be as effective as you hoped.</span>")
		else
			to_chat(B.host_brain, "<span class='danger'><FONT size=3>Horrific, burning agony lances through you, ripping a soundless scream from your trapped mind!</FONT></span>")

/mob/living/proc/spawn_larvae()
	set category = "Abilities"
	set name = "Reproduce"
	set desc = "Spawn several young."

	var/mob/living/simple_animal/borer/B = HAS_BRAIN_WORMS(src)

	if(!B)
		return

	if(B.chemicals >= 100)
		to_chat(src, "<span class='danger'>Your host twitches and quivers as you rapidly excrete a larva from your sluglike body.</span>")
		visible_message("<span class='danger'>\The [src] heaves violently, expelling a rush of vomit and a wriggling, sluglike creature!</span>")
		B.chemicals -= 100
		B.has_reproduced = 1

		new /obj/effect/decal/cleanable/vomit(get_turf(src))
		playsound(loc, 'sound/effects/splat.ogg', 50, 1)
		new /mob/living/simple_animal/borer(get_turf(src), B.generation + 1)

	else
		to_chat(src, "<span class='warning'>You do not have enough chemicals stored to reproduce.</span>")
		return
