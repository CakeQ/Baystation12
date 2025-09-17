/obj/structure/table/map_table
	// name = "sensors display table"
	// icon = 'icons/obj/machines/map_table.dmi'
	// icon_state = "maptable_base"
	// density = TRUE
	// anchored = TRUE
	// idle_power_usage = 300
	// active_power_usage = 300
	// construct_state = /singleton/machine_construction/default/panel_closed/maptable
	// uncreated_component_parts = null
	// stat_immune = 0
	// frame_type = /obj/machinery/constructable_frame/map_table/deconstruct
	// var/processing = 0

	// health_max = 80
	// damage_hitsound = 'sound/weapons/smash.ogg'

	// var/table_offset_x = 0
	// var/table_offset_y = 0
	// var/table_view_scale
	// var/light_power_on = 1
	// var/light_range_on = 2
	// var/overlay_layer
	// atom_flags = ATOM_FLAG_NO_TEMP_CHANGE | ATOM_FLAG_CLIMBABLE
	// clicksound = "switch"
	icon_state = "maptable_preview"
	material = MATERIAL_GLASS
	reinforced = MATERIAL_STEEL
	var/obj/overmap/visitable/ship/linked
	var/weakref/sensor_ref
	var/map_offset_x = 0
	var/map_offset_y = 0
	var/table_size_x = 1
	var/table_size_y = 1

/obj/structure/table/map_table/Initialize()
	. = ..()
	update_connections(TRUE)

/obj/structure/table/map_table/update_connections(propagate = 0)
	. = ..()
	map_offset_x = 0
	map_offset_y = 0
	table_size_x = 1
	table_size_y = 1
	for (var/direction in GLOB.cardinal)
		var/found_all = FALSE
		var/offset_value_x = 0
		var/offset_value_y = 0
		var/turf/ref_turf = src.loc
		while (!found_all)
			var/turf/other_turf = get_step(ref_turf, direction)
			var/success = 0
			for (var/obj/structure/table/map_table/other_table in other_turf)
				if (istype(other_table, /obj/structure/table/map_table))
					success = TRUE
					break
			if (success)
				offset_value_x = ref_turf.x - other_turf.x
				offset_value_y = ref_turf.y - other_turf.y
				if (direction == EAST || direction == WEST)
					table_size_x += 1
				else
					table_size_y += 1
				ref_turf = other_turf
				continue
			map_offset_x += offset_value_x
			map_offset_y += offset_value_y
			found_all = TRUE

/obj/structure/table/map_table/proc/find_sensors()
	if (!linked)
		return
	for (var/obj/machinery/shipsensors/S in SSmachines.machinery)
		if (linked.check_ownership(S))
			S.link_ship(linked)
			sensor_ref = weakref(S)
			break
