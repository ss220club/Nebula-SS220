/datum/event/camera_damage/start()
	var/obj/machinery/camera/C = acquire_random_camera()
	if(!C)
		return

	var/severity_range = 0
	switch(severity)
		if(EVENT_LEVEL_MUNDANE)
			severity_range = 0
		if(EVENT_LEVEL_MODERATE)
			severity_range = 7
		if(EVENT_LEVEL_MAJOR)
			severity_range = 15

	for(var/obj/machinery/camera/cam in range(severity_range,C))
		if(is_valid_camera(cam))
			if(prob(2*severity))
				cam.take_damage(100, ELECTROCUTE, silent = TRUE)
			else
				if(!cam.wires.IsIndexCut(CAMERA_WIRE_POWER))
					cam.wires.CutWireIndex(CAMERA_WIRE_POWER)
				if(!cam.wires.IsIndexCut(CAMERA_WIRE_ALARM) && prob(5*severity))
					cam.wires.CutWireIndex(CAMERA_WIRE_ALARM)

/datum/event/camera_damage/proc/acquire_random_camera(var/remaining_attempts = 5)
	if(!cameranet.cameras.len)
		return
	if(!remaining_attempts)
		return

	var/obj/machinery/camera/C = pick(cameranet.cameras)
	if(is_valid_camera(C))
		return C
	return acquire_random_camera(remaining_attempts-1)

/datum/event/camera_damage/proc/is_valid_camera(var/obj/machinery/camera/C)
	// Only return a functional camera, not installed in a silicon, and that exists somewhere players have access
	var/turf/T = get_turf(C)
	return T && C.can_use() && isPlayerLevel(T.z)
