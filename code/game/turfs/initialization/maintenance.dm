/decl/turf_initializer/maintenance
	var/clutter_probability = 2
	var/oil_probability = 2
	var/vermin_probability = 0
	var/web_probability = 25

/decl/turf_initializer/maintenance/heavy
	clutter_probability = 5
	web_probability = 50
	vermin_probability = 0.5

/decl/turf_initializer/maintenance/space
	clutter_probability = 0
	vermin_probability = 0
	web_probability = 0

/decl/turf_initializer/maintenance/InitializeTurf(var/turf/T)
	if(!istype(T) || T.density || !T.simulated)
		return
	// Quick and dirty check to avoid placing things inside windows
	if(locate(/obj/structure/grille, T))
		return

	var/cardinal_turfs = T.CardinalTurfs()

	var/add_dirt = get_dirt_amount()
	// If a neighbor is dirty, then we get dirtier.
	var/how_dirty = dirty_neighbors(cardinal_turfs)
	for(var/i = 0; i < how_dirty; i++)
		add_dirt += rand(0,5)
	T.add_dirt(add_dirt)

	if(prob(oil_probability))
		new /obj/effect/decal/cleanable/blood/oil(T)

	if(prob(clutter_probability))
		new /obj/random/junk(T)

	if(prob(vermin_probability))
		if(prob(80))
			new /mob/living/simple_animal/passive/mouse(T)
		else
			new /mob/living/simple_animal/lizard(T)

	if(prob(web_probability))	// Keep in mind that only "corners" get any sort of web
		attempt_web(T, cardinal_turfs)

/decl/turf_initializer/maintenance/proc/dirty_neighbors(var/list/cardinal_turfs)
	var/how_dirty = 0
	for(var/turf/T in cardinal_turfs)
		// Considered dirty if more than halfway to visible dirt
		if(T.get_dirt() > 25)
			how_dirty++
	return how_dirty

/decl/turf_initializer/maintenance/proc/attempt_web(var/turf/T)

	if(!istype(T) || !T.simulated)
		return

	var/turf/north_turf = get_step(T, NORTH)
	if(!north_turf || !north_turf.density)
		return

	for(var/dir in list(WEST, EAST))	// For the sake of efficiency, west wins over east in the case of 1-tile valid spots, rather than doing pick()
		var/turf/neighbour = get_step(T, dir)
		if(neighbour && neighbour.density)
			if(dir == WEST)
				new /obj/effect/decal/cleanable/cobweb(T)
			if(dir == EAST)
				new /obj/effect/decal/cleanable/cobweb2(T)
			if(prob(web_probability))
				var/obj/effect/spider/spiderling/spiderling = new /obj/effect/spider/spiderling/mundane/dormant(T)
				spiderling.pixel_y = spiderling.shift_range
				spiderling.pixel_x = dir == WEST ? -spiderling.shift_range : spiderling.shift_range

/decl/turf_initializer/maintenance/proc/get_dirt_amount()
	return rand(10, 50) + rand(0, 50)

/decl/turf_initializer/maintenance/heavy/get_dirt_amount()
	return ..() + 10
