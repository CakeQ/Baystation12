/obj/machinery/cooker/fueled/stove
	name = "kitchen stove"
	desc = "An industrial kitchen stove. The chef's wet dream."
	icon_state = "stove"
	cooking_sound = 'sound/effects/stove_hum.ogg'
	cooking_on_sound = 'sound/effects/stove_on.ogg'
	cooking_off_sound = 'sound/effects/stove_off.ogg'

/obj/machinery/cooker/fueled/stove/on_update_icon()
	..()
	if(cooking_state)
		overlays += "[icon_state]_on"
	switch(cooking_state)
		if(STATE_COOKING_LOW)
			overlays += "[icon_state]_flames_low"
		if(STATE_COOKING_MEDIUM)
			overlays += "[icon_state]_flames_medium"
		if(STATE_COOKING_HIGH)
			overlays += "[icon_state]_flames_high"
	if(get_cooking_object())
		var/obj/I = get_cooking_object()
		overlays += I.icon_state
		overlays += I.overlays