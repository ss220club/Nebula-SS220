/mob/living/simple_animal/hostile/retaliate/goose
	name = "goose"
	desc = "A large waterfowl, known for its beauty and quick temper when provoked."
	icon = 'icons/mob/simple_animal/goose.dmi'
	speak_emote  = list("honks")
	emote_speech = list("Honk!")
	emote_hear   = list("honks","flaps its wings","clacks")
	emote_see    = list("flaps its wings", "scratches the ground")
	natural_weapon = /obj/item/natural_weapon/goosefeet
	max_health = 45
	pass_flags = PASS_FLAG_TABLE
	faction = "geese"
	pry_time = 8 SECONDS
	break_stuff_probability = 5
	butchery_data = /decl/butchery_data/animal/small/fowl/goose

	var/enrage_potency = 3
	var/enrage_potency_loose = 4
	var/loose_threshold = 15
	var/max_damage = 25
	var/loose = FALSE //goose loose status

/obj/item/natural_weapon/goosefeet
	name = "goose feet"
	gender = PLURAL
	attack_verb = list("smacked around")
	force = 0
	atom_damage_type =  BRUTE
	canremove = FALSE

/mob/living/simple_animal/hostile/retaliate/goose/Retaliate()
	..()
	if(stat == CONSCIOUS)
		enrage(enrage_potency)

/mob/living/simple_animal/hostile/retaliate/goose/on_update_icon()
	..()
	if(stat != DEAD && loose)
		icon_state += "-loose"

/mob/living/simple_animal/hostile/retaliate/goose/death(gibbed)
	. = ..()
	if(. && !gibbed)
		update_icon()

/mob/living/simple_animal/hostile/retaliate/goose/proc/enrage(var/potency)
	var/obj/item/attacking_with = get_natural_weapon()
	if(attacking_with)
		attacking_with.force = min((attacking_with.force + potency), max_damage)
	if(!loose && prob(25) && (attacking_with && attacking_with.force >= loose_threshold)) //second wind
		loose = TRUE
		set_max_health(initial(max_health) * 1.5)
		set_damage(BRUTE, 0)
		set_damage(BURN, 0)
		enrage_potency = enrage_potency_loose
		desc += " The [name] is loose! Oh no!"
		update_icon()

/mob/living/simple_animal/hostile/retaliate/goose/dire
	name = "dire goose"
	desc = "A large bird. It radiates destructive energy."
	icon = 'icons/mob/simple_animal/goose_dire.dmi'
	max_health = 250
	enrage_potency = 3
	loose_threshold = 20
	max_damage = 35
	butchery_data = /decl/butchery_data/animal/small/fowl/goose/dire
