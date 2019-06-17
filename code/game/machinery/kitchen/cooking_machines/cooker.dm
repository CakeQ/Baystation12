/obj/machinery/cooker
	name = "cooker"
	icon = 'icons/obj/cooking_machines.dmi'
	density = 1
	anchored = 1
	var/cooking_state = STATE_COOKING_OFF //off, on, and mode (later)
	var/max_temperature =	T20C + 200
	var/min_temperature =	T20C + 40
	var/heating_power =		10 // K
	var/fuel_consumption = 	0.00005
	var/cooking_sound
	var/cooking_on_sound
	var/cooking_off_sound
	var/datum/sound_token/sound_token
	var/sound_id

/obj/machinery/cooker/Initialize()
	. = ..()
	sound_id = "[type]_[sequential_id(type)]"

/obj/machinery/cooker/Destroy()
	if(contents)
		for(var/obj/item/I in contents)
			I.dropInto(loc)
	QDEL_NULL(sound_token)
	..()

/obj/machinery/cooker/on_update_icon()
	overlays.Cut()
	if(get_cooking_object())
		var/obj/item/I = get_cooking_object()
		overlays += I.icon_state
		overlays += I.overlays

/obj/machinery/cooker/attack_hand(var/mob/user)
	switch(cooking_state)
		if(STATE_COOKING_OFF)
			turn_on(user)
		else
			turn_off(user)

/obj/machinery/cooker/attackby(var/obj/item/weapon/W as obj, var/mob/user as mob)
	if(W.item_flags & ITEM_FLAG_COOKER)
		if(get_cooking_object())
			to_chat(user, "<span class='warning'>There's already \a [get_cooking_object()] on \the [src]!</span>")
			return
		user.unEquip(W, src)
		to_chat(user, "<span class='notice'>You put \the [W] onto \the [src].</span>")
	update_icon()

/obj/machinery/cooker/MouseDrop(over_object, src_location, over_location)
	..()
	if(over_object == usr && in_range(src, usr) && get_cooking_object())
		var/obj/item/I = get_cooking_object()
		usr.put_in_hands(I)
		to_chat(usr, "<span class='notice'>You remove \the [I] from \the [src].</span>")

/obj/machinery/cooker/proc/turn_on(var/mob/user, var/new_cooking_state = STATE_COOKING_LOW)
	to_chat(user, "<span class='notice'>You turn \the [src] on.</span>")
	cooking_state = new_cooking_state
	if(cooking_on_sound)
		playsound(src.loc, cooking_on_sound, 50, 1)
	if(cooking_sound)
		sound_token = GLOB.sound_player.PlayLoopingSound(src, sound_id, cooking_sound, 25, range = 7, falloff = 3, prefer_mute = TRUE)
	update_icon()

/obj/machinery/cooker/proc/turn_off(var/mob/user)
	cooking_state = STATE_COOKING_OFF
	to_chat(user, "<span class='notice'>You turn \the [src] off.</span>")
	QDEL_NULL(sound_token)
	if(cooking_off_sound)
		playsound(src.loc, cooking_off_sound, 50, 1)
	update_icon()

/obj/machinery/cooker/ProcessAtomTemperature()
	var/last_temperature = temperature
	if(cooking_state)
		temperature = min(max_temperature, temperature + heating_power)
		if(temperature != last_temperature && get_cooking_object())
			var/obj/item/I = get_cooking_object()
			QUEUE_TEMPERATURE_ATOMS(I)
			queue_icon_update()
		return TRUE
	else
		temperature = max(min_temperature, temperature - heating_power * 2)
		if(temperature != last_temperature)
			queue_icon_update()
	. = ..()

/obj/machinery/cooker/proc/get_cooking_object()
	if(contents)
		for(var/obj/item/I in contents)
			if(I.item_flags & ITEM_FLAG_COOKER)
				return I
	else
		return null

/obj/machinery/cooker/fueled
	name = "fueled cooker"
	var/hatch_open = 0

/obj/machinery/cooker/fueled/Initialize()
	src.contents.Add(new/obj/item/weapon/tank/hydrogen)
	. = ..()

/obj/machinery/cooker/fueled/on_update_icon()
	..()
	if(hatch_open)
		overlays += "[icon_state]_hatch"
		if(get_fuel_tank())
			overlays += "[icon_state]_tank"

/obj/machinery/cooker/fueled/turn_on(var/mob/user, var/new_cooking_state = STATE_COOKING_LOW)
	if(!get_fuel_tank())
		to_chat(user, "<span class='warning'>\The [src] is out of fuel!</span>")
		return

	var/obj/item/weapon/tank/FT = get_fuel_tank()
	var/total_flammable_gas_moles = FT.air_contents.get_by_flag(XGM_GAS_FUEL)

	if(total_flammable_gas_moles < fuel_consumption)
		to_chat(user, "<span class='warning'>\The [src] is out of fuel!</span>")
		return
	..()

/obj/machinery/cooker/fueled/Process()
	. = ..()
	if(. != PROCESS_KILL)
		if(cooking_state)
			var/is_fueled = 0
			if(get_fuel_tank())
				var/obj/item/weapon/tank/FT = get_fuel_tank()
				var/total_flammable_gas_moles = FT.air_contents.get_by_flag(XGM_GAS_FUEL)
				if(total_flammable_gas_moles >= fuel_consumption)
					FT.remove_air_by_flag(XGM_GAS_FUEL, fuel_consumption)
					is_fueled = 1
			if(!is_fueled)
				turn_off()
				queue_icon_update()

/obj/machinery/cooker/fueled/attackby(var/obj/item/weapon/W as obj, var/mob/user as mob)
	..()
	if(isWrench(W))
		playsound(src.loc, 'sound/items/Ratchet.ogg', 50, 1)
		if(anchored)
			user.visible_message("<span class='notice'>\The [user] unsecures \the [src].</span>", "<span class='notice'>You unsecure \the [src].</span>")
			anchored = 0
		else
			user.visible_message("<span class='notice'>\The [user] secures \the [src] in place.</span>", "<span class='notice'>You secure \the [src] in place.</span>")
			anchored = 1
	else if(isCrowbar(W))
		if(hatch_open)
			to_chat(user, "<spawn class='notice'>You shut \the [src]'s fuel hatch.</span>")
			playsound(src.loc, 'sound/effects/locker_close.ogg', 25, 1)
			hatch_open = 0
		else
			to_chat(user, "<spawn class='notice'>You pry open \the [src]'s fuel hatch.</span>")
			playsound(src.loc, 'sound/effects/locker_open.ogg', 15, 1)
			hatch_open = 1
	else if(isScrewdriver(W))
		if(!hatch_open)
			to_chat(user, "<spawn class='warning'>\The [src] fuel hatch is closed!</span>")
			return
		if(get_fuel_tank())
			var/obj/item/weapon/tank/FT = get_fuel_tank()
			user.put_in_hands(FT)
			to_chat(user, "<spawn class='notice'>You remove \the [src]'s fuel tank.</span>")
		else
			to_chat(user, "<spawn class='warning'>\The [src] has no fuel tank!</span>")
	else if(istype(W,/obj/item/weapon/tank))
		if(!hatch_open)
			to_chat(user, "<spawn class='warning'>\The [src] fuel hatch is closed!</span>")
			return
		if(get_fuel_tank())
			to_chat(user, "<spawn class='warning'>\The [src] already has a fuel tank.</span>")
			return
		user.unEquip(W, src)
		to_chat(user, "<spawn class='notice'>You insert \the [W] into \the [src]'s fuel port.</span>")
	update_icon()

/obj/machinery/cooker/fueled/proc/get_fuel_tank()
	if(contents)
		for(var/obj/item/I in contents)
			if(istype(I, /obj/item/weapon/tank))
				var/obj/item/weapon/tank/FT = I
				return FT
	else
		return null