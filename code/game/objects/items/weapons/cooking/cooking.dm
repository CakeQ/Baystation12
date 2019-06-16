GLOBAL_LIST_EMPTY(recipes_by_cooker_type)

/obj/item/weapon/reagent_containers/food/cooking
	name = "cooking utensil"
	icon = 'icons/obj/cooking_utensil.dmi'
	icon_state = "pot"
	desc = "A cooking utensil to cook food in."
	throwforce = 12.0
	throwforce = 10.0
	throw_speed = 1
	throw_range = 5
	volume = 30
	w_class = ITEM_SIZE_NORMAL
	obj_flags = OBJ_FLAG_CONDUCTIBLE
	item_flags = ITEM_FLAG_COOKER
	matter = list(MATERIAL_STEEL = 3000)
	center_of_mass = "x=16;y=17"

	var/progress_sound
	var/cooking_progress = 0
	var/item_capacity = 0
	var/cooking_type = COOKING_FLAG_GRILL
	var/datum/recipe/cooked/current_recipe
	var/global/list/acceptable_items // List of the items you can put in
	var/global/list/acceptable_reagents // List of the reagents you can put in
	var/list/available_recipes // List of all the recipes applicable to the current cooking_type
	var/datum/sound_token/sound_token
	var/sound_id

/obj/item/weapon/reagent_containers/food/cooking/Initialize()
	. = ..()
	sound_id = "[type]_[sequential_id(type)]"
	if(!GLOB.recipes_by_cooker_type["[cooking_type]"])
		acceptable_items = list(
			/obj/item/weapon/holder,
			/obj/item/weapon/reagent_containers/food/snacks/grown
		)
		acceptable_reagents = list()

		var/list/children = list()
		for (var/T in subtypesof(/datum/recipe/cooked))
			var/datum/recipe/cooked/R = new T
			// Only want grandchildren.
			if (R.parent_type == /datum/recipe/cooked)
				qdel(R)
				continue
			children += R

		for(var/thing in children)
			var/datum/recipe/cooked/recipe = thing
			LAZYADD(GLOB.recipes_by_cooker_type["[recipe.cooking_type]"], recipe)
			for(var/item in recipe.items)
				acceptable_items |= item
			for(var/reagent in recipe.reagents)
				acceptable_reagents |= reagent
			if(recipe.items)
				item_capacity = max(item_capacity,recipe.items.len)

	available_recipes = GLOB.recipes_by_cooker_type["[cooking_type]"]

/obj/item/weapon/reagent_containers/food/cooking/attackby(var/obj/item/I as obj, var/mob/user as mob)
	if(is_type_in_list(I,acceptable_items))
		if (contents.len >= item_capacity)
			to_chat(user, "<span class='warning'>\The [src] is full of ingredients.</span>")
			return
		if (!user.unEquip(I, src))
			return
		user.visible_message("<span class='notice'>\The [user] has added \the [I] to \the [src].</span>", "<span class='notice'>You add \the [I] to \the [src].</span>")
		update_recipe()
	else if(istype(I,/obj/item/weapon/reagent_containers/glass) || istype(I,/obj/item/weapon/reagent_containers/food/drinks) || istype(I,/obj/item/weapon/reagent_containers/food/condiment) || istype(I,/obj/item/weapon/reagent_containers/food/cooking))
		if (!I.reagents)
			return
		for (var/datum/reagent/R in I.reagents.reagent_list)
			if (!(R.type in acceptable_reagents))
				to_chat(user, "<span class='warning'>\The [I] contains components unsuitable for cookery.</span>")
				return
		update_recipe()
	..()

/obj/item/weapon/reagent_containers/food/cooking/afterattack(atom/A as mob|obj|turf|area, mob/user as mob, proximity)
	..()
	update_recipe()
	update_icon()

/obj/item/weapon/reagent_containers/food/cooking/MouseDrop(over_object, src_location, over_location)
	..()
	if(in_range(src, usr) && (contents || reagents))
		for(var/obj/item/I in contents)
			I.forceMove(over_object)
		if(!istype(over_object, /obj/structure/hygiene/sink))
			reagents.splash(over_object, reagents.total_volume)
			visible_message("<span class='notice'>\The [usr] tips the contents of \the [src] out.</span>")
		update_icon()

/obj/item/weapon/reagent_containers/food/cooking/Process()
	. = ..()
	if(. != PROCESS_KILL)
		if(current_recipe && temperature >= current_recipe.cooking_temp)
			if(!sound_token)
				sound_token = GLOB.sound_player.PlayLoopingSound(src, sound_id, progress_sound, 25, range = 7, falloff = 3, prefer_mute = TRUE)
			cooking_progress += 1
			if(cooking_progress >= current_recipe.cooking_effort)
				if(current_recipe == select_recipe(available_recipes,src))
					current_recipe.make_food(src)
					visible_message("<span class='notice'>\The [src] looks ready.</span>")
			if(cooking_progress >= current_recipe.cooking_effort * 2)
				fail_cooking()
		else
			if(sound_token)
				QDEL_NULL(sound_token)
			cooking_progress = 0

/obj/item/weapon/reagent_containers/food/cooking/ProcessAtomTemperature()
	for(var/obj/item/I in contents)
		QUEUE_TEMPERATURE_ATOMS(I)
		queue_icon_update()
		return TRUE
	. = ..()

/obj/item/weapon/reagent_containers/food/cooking/on_update_icon()
	overlays.Cut()
	if(contents)
		for(var/obj/O in contents)
			var/image/I = image(icon = icon, icon_state = "[icon_state]_chunks")
			if(istype(O, /obj/item/weapon/reagent_containers/food))
				var/obj/item/weapon/reagent_containers/food/F = O
				I.color = F.filling_color
			else
				I.color = COLOR_BROWN
			overlays += I
			break
	if(reagents)
		var/reagent_type = get_master_reagent_type()
		if(current_recipe && temperature >= current_recipe.cooking_temp)
			var/image/I = image(icon = icon, icon_state = "[icon_state]_fill_cooking")
			I.color = reagent_type.color
			overlays += I
		else
			var/image/I = image(icon = icon, icon_state = "[icon_state]_fill")
			I.color = reagent_type.color
			overlays += I
	if(current_recipe && cooking_progress >= current_recipe.cooking_effort)
		overlays += "[icon_state]_steam"
	if(!istype(loc, /obj))
		loc.update_icon()
	..()

/obj/item/weapon/reagent_containers/food/cooking/proc/update_recipe()
	cooking_progress = 0
	current_recipe = select_recipe(available_recipes,src)

/obj/item/weapon/reagent_containers/food/cooking/proc/fail_cooking()
	var/amount = 0
	for (var/obj/O in contents)
		amount++
		if (O.reagents)
			var/reagent_type = O.reagents.get_master_reagent_type()
			if (reagent_type)
				amount+=O.reagents.get_reagent_amount(reagent_type)
		qdel(O)
	var/obj/item/weapon/reagent_containers/food/snacks/badrecipe/burned = new(src)
	burned.reagents.add_reagent(/datum/reagent/carbon, amount)
	burned.reagents.add_reagent(/datum/reagent/toxin, amount/10)
	visible_message("<span class='danger'>\The [src] vomits a gout of rancid smoke!</span>")
	var/datum/effect/effect/system/smoke_spread/bad/smoke = new /datum/effect/effect/system/smoke_spread/bad()
	smoke.attach(src)
	smoke.set_up(10, 0, usr.loc)
	smoke.start()
	update_recipe()

/obj/item/weapon/reagent_containers/food/cooking/pot
	name = "cooking pot"
	icon_state = "pot"
	desc = "A cooking pot, for boiling ingredients and making soups."
	center_of_mass = "x=16;y=19"
	item_capacity = 20
	volume = 60
	cooking_type = COOKING_FLAG_BOIL
	progress_sound = 'sound/effects/food_boiling.ogg'

/obj/item/weapon/reagent_containers/food/cooking/fryingpan
	name = "frying pan"
	icon_state = "pan"
	desc = "A frying pan, for all your frying needs."
	item_capacity = 10
	volume = 20
	cooking_type = COOKING_FLAG_FRY
	progress_sound = 'sound/effects/food_frying.ogg'

/obj/item/weapon/reagent_containers/food/cooking/fryingpan/saucepan
	name = "saucepan"
	icon_state = "saucepan"
	desc = "A suacepan, for making succulent sauces to go with your dishes."
	item_capacity = 6
	volume = 40