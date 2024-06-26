/decl/communication_channel/pray
	name = "PRAY"
	expected_communicator_type = /mob
	log_proc = /proc/log_say
	flags = COMMUNICATION_ADMIN_FOLLOW
	mute_setting = MUTE_PRAY

/decl/communication_channel/pray/do_communicate(var/mob/communicator, var/message, var/speech_method_type)
	var/image/cross = image('icons/obj/items/storage/bible.dmi',"bible")
	for(var/m in global.player_list)
		var/mob/M = m
		if(!M.client)
			continue
		if(M.client.holder && M.client.get_preference_value(/datum/client_preference/staff/show_chat_prayers) == PREF_SHOW)
			receive_communication(communicator, M, "\[<A HREF='byond://?_src_=holder;adminspawnprayreward=\ref[communicator]'>SC</a>\] \[<A HREF='byond://?_src_=holder;narrateto=\ref[communicator]'>DN</a>\]<span class='notice'>[html_icon(cross)] <b>[SPAN_PURPLE("PRAY: ")][key_name(communicator, 1)]: </b>[message]</span>")
		else if(communicator == M) //Give it to ourselves
			receive_communication(communicator, M, "<span class='notice'>[html_icon(cross)] <b>You send the prayer, \"[message]\" out into the heavens.</b></span>")

/decl/communication_channel/pray/receive_communication(var/mob/communicator, var/mob/receiver, var/message)
	..()
	sound_to(receiver, 'sound/effects/ding.ogg')