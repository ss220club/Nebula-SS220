//Terribly sorry for the code doubling, but things go derpy otherwise.
/obj/machinery/door/airlock/double
	icon = 'icons/obj/doors/double/door.dmi'
	fill_file = 'icons/obj/doors/double/fill_steel.dmi'
	color_file = 'icons/obj/doors/double/color.dmi'
	color_fill_file = 'icons/obj/doors/double/fill_color.dmi'
	stripe_file = 'icons/obj/doors/double/stripe.dmi'
	stripe_fill_file = 'icons/obj/doors/double/fill_stripe.dmi'
	glass_file = 'icons/obj/doors/double/fill_glass.dmi'
	bolts_file = 'icons/obj/doors/double/lights_bolts.dmi'
	deny_file = 'icons/obj/doors/double/lights_deny.dmi'
	lights_file = 'icons/obj/doors/double/lights_green.dmi'
	panel_file = 'icons/obj/doors/double/panel.dmi'
	welded_file = 'icons/obj/doors/double/welded.dmi'
	emag_file = 'icons/obj/doors/double/emag.dmi'

	frame_type = /obj/structure/door_assembly/double
	airlock_type = "double"
	appearance_flags = 0
	opacity = TRUE
	width = 2

/obj/machinery/door/airlock/double/update_connections(var/propagate = 0)
	var/dirs = 0

	for(var/direction in global.cardinal)
		var/turf/T = get_step(src, direction)
		var/success = 0

		if(direction in list(NORTH, EAST))
			T = get_step(T, direction)

		if( istype(T, /turf/wall))
			success = 1
			if(propagate)
				var/turf/wall/W = T
				W.wall_connections = null
				W.other_connections = null
				W.queue_icon_update()
		else
			for(var/obj/O in T)
				for(var/blend_type in get_blend_objects())
					if( istype(O, blend_type))
						success = 1

					if(success)
						break
				if(success)
					break

		if(success)
			dirs |= direction
	connections = dirs

/obj/machinery/door/airlock/double/command
	door_color = COLOR_COMMAND_BLUE

/obj/machinery/door/airlock/double/security
	door_color = COLOR_NT_RED

/obj/machinery/door/airlock/double/engineering
	name = "Maintenance Hatch"
	door_color = COLOR_AMBER

/obj/machinery/door/airlock/double/medical
	door_color = COLOR_WHITE
	stripe_color = COLOR_DEEP_SKY_BLUE

/obj/machinery/door/airlock/double/virology
	door_color = COLOR_WHITE
	stripe_color = COLOR_GREEN

/obj/machinery/door/airlock/double/mining
	name = "Mining Airlock"
	door_color = COLOR_PALE_ORANGE
	stripe_color = COLOR_BEASTY_BROWN

/obj/machinery/door/airlock/double/atmos
	door_color = COLOR_AMBER
	stripe_color = COLOR_CYAN

/obj/machinery/door/airlock/double/research
	door_color = COLOR_WHITE
	stripe_color = COLOR_RESEARCH

/obj/machinery/door/airlock/double/science
	door_color = COLOR_WHITE
	stripe_color = COLOR_VIOLET

/obj/machinery/door/airlock/double/sol
	door_color = COLOR_BLUE_GRAY

/obj/machinery/door/airlock/double/maintenance
	name = "Maintenance Access"
	stripe_color = COLOR_AMBER

/obj/machinery/door/airlock/double/civilian
	stripe_color = COLOR_CIVIE_GREEN

/obj/machinery/door/airlock/double/freezer
	name = "Freezer Airlock"
	door_color = COLOR_WHITE

/obj/machinery/door/airlock/double/glass
	name = "Glass Airlock"
	opacity = FALSE
	glass = TRUE

/obj/machinery/door/airlock/double/glass/command
	door_color = COLOR_COMMAND_BLUE
	stripe_color = COLOR_SKY_BLUE

/obj/machinery/door/airlock/double/glass/security
	door_color = COLOR_NT_RED
	stripe_color = COLOR_ORANGE

/obj/machinery/door/airlock/double/glass/engineering
	door_color = COLOR_AMBER
	stripe_color = COLOR_RED

/obj/machinery/door/airlock/double/glass/medical
	door_color = COLOR_WHITE
	stripe_color = COLOR_DEEP_SKY_BLUE

/obj/machinery/door/airlock/double/glass/virology
	door_color = COLOR_WHITE
	stripe_color = COLOR_GREEN

/obj/machinery/door/airlock/double/glass/mining
	door_color = COLOR_PALE_ORANGE
	stripe_color = COLOR_BEASTY_BROWN

/obj/machinery/door/airlock/double/glass/atmos
	door_color = COLOR_AMBER
	stripe_color = COLOR_CYAN

/obj/machinery/door/airlock/double/glass/research
	door_color = COLOR_WHITE
	stripe_color = COLOR_RESEARCH

/obj/machinery/door/airlock/double/glass/science
	door_color = COLOR_WHITE
	stripe_color = COLOR_VIOLET

/obj/machinery/door/airlock/double/glass/sol
	door_color = COLOR_BLUE_GRAY
	stripe_color = COLOR_AMBER

/obj/machinery/door/airlock/double/glass/freezer
	door_color = COLOR_WHITE

/obj/machinery/door/airlock/double/glass/maintenance
	name = "Maintenance Access"
	stripe_color = COLOR_AMBER

/obj/machinery/door/airlock/double/glass/civilian
	stripe_color = COLOR_CIVIE_GREEN

// SS220 ADD BEGIN
/obj/airlock_filler_object
	name = "airlock fluff"
	desc = "You shouldn't be able to see this fluff!"
	icon = null
	icon_state = null
	density = TRUE
	opacity = TRUE
	anchored = TRUE
	invisibility = INVISIBILITY_MAXIMUM
	atmos_canpass = CANPASS_DENSITY
	/// The door/airlock this fluff panel is attached to
	var/obj/machinery/door/filled_airlock

/obj/airlock_filler_object/Bumped(atom/A)
	if(isnull(filled_airlock))
		CRASH("Someone bumped into an airlock filler with no parent airlock specified!")
	return filled_airlock.Bumped(A)

/obj/airlock_filler_object/Destroy()
	filled_airlock = null
	return ..()

/// Multi-tile airlocks pair with a filler panel, if one goes so does the other.
/obj/airlock_filler_object/proc/pair_airlock(obj/machinery/door/parent_airlock)
	if(isnull(parent_airlock))
		CRASH("Attempted to pair an airlock filler with no parent airlock specified!")

	filled_airlock = parent_airlock
	events_repository.unregister(/decl/observ/destroyed, filled_airlock, src, PROC_REF(no_airlock))

/obj/airlock_filler_object/proc/no_airlock()
	events_repository.unregister(/decl/observ/destroyed, filled_airlock, src)
	qdel_self()

/// Multi-tile airlocks (using a filler panel) have special handling for movables with PASS_FLAG_GLASS
/obj/airlock_filler_object/CanPass(atom/movable/mover, turf/target)
	. = ..()
	if(.)
		return

	if(istype(mover) && mover.checkpass(PASS_FLAG_GLASS))
		return !opacity

/obj/airlock_filler_object/singularity_act()
	return

/obj/airlock_filler_object/singularity_pull(S, current_size)
	return
// SS220 ADD END