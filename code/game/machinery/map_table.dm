var/global/list/map_tables = list()

/obj/effect/map_table_screen
	name = "map table screen"
	appearance_flags = KEEP_TOGETHER|TILE_BOUND|PIXEL_SCALE
	mouse_opacity = 0
	vis_flags = VIS_INHERIT_ID
	layer = ABOVE_LIGHTING_LAYER
	icon_state = "nothing"
	var/obj/machinery/map_table/map_table
	anchored = TRUE
	unacidable = TRUE

/obj/effect/map_table_screen/proc/link_table(obj/machinery/map_table/new_map_table)
	map_table = new_map_table
	update_screen()

/obj/effect/map_table_screen/proc/update_screen()
	filters = null
	var/icon/I = icon(icon, icon_state)
	for(var/i = 1 to 4)
		I.Blend(icon('icons/obj/machines/map_table.dmi', "maptable_screen_[map_table.connections[i]]", SHIFTL(1, i - 1)), ICON_OVERLAY)
	filters += filter("type" = "alpha", "icon" = I, "x" = 0, "y" = 0)
	// filters += filter("type" = "alpha", "icon" = icon('icons/obj/machines/map_table.dmi', "maptable_screen"), "x" = 0, "y" = 0)

/obj/effect/map_table_visuals
	name = "map table visuals"
	appearance_flags = KEEP_TOGETHER|TILE_BOUND|PIXEL_SCALE
	mouse_opacity = 0
	vis_flags = VIS_INHERIT_ID
	layer = ABOVE_OBJ_LAYER
	icon_state = "nothing"
	var/obj/machinery/map_table/map_table
	anchored = TRUE
	unacidable = TRUE

/obj/effect/map_table_visuals/proc/link_table(obj/machinery/map_table/new_map_table)
	map_table = new_map_table
	if(map_table && map_table.linked)
		GLOB.moved_event.register(map_table.linked, src, .proc/update_visuals)
	update_visuals()

/obj/effect/map_table_visuals/proc/update_visuals()
	clear_vis_contents()

	if(!map_table || !map_table.linked)
		return

	var/obj/machinery/shipsensors/sensor = map_table.sensor_ref.resolve()
	if(!sensor)
		return

	var/sensor_range = sensor.get_sensor_range()
	if(!sensor_range)
		return
	var/sensor_size = (sensor_range * 2) + 1
	var/table_reach_x = ceil(sensor_size / map_table.table_size_x)
	var/table_reach_y = ceil(sensor_size / map_table.table_size_y)

	var/matrix/M = matrix()
	M.Scale(1 / table_reach_x, 1 / table_reach_y)
	transform = M
	pixel_x = -32 * ((table_reach_x / 2) - 1)
	pixel_y = -32 * ((table_reach_y / 2) - 1)

	var/turf/ref_turf = get_offset_target_turf(map_table.linked.loc, table_reach_x * map_table.map_offset_x, table_reach_y * map_table.map_offset_y)
	for(var/turf/T in range(ceil(max(table_reach_x, table_reach_y) / 2), ref_turf))
		add_vis_contents(T)

/obj/machinery/map_table
	name = "sensors display table"
	icon = 'icons/obj/machines/map_table.dmi'
	icon_state = "maptable_preview"
	density = TRUE
	anchored = TRUE
	idle_power_usage = 300
	active_power_usage = 300
	// construct_state = /singleton/machine_construction/default/panel_closed/maptable
	// uncreated_component_parts = null
	// stat_immune = 0
	// frame_type = /obj/machinery/constructable_frame/map_table/deconstruct
	// var/processing = 0
	health_max = 80
	damage_hitsound = 'sound/weapons/smash.ogg'
	var/light_power_on = 1
	var/light_range_on = 2
	atom_flags = ATOM_FLAG_NO_TEMP_CHANGE | ATOM_FLAG_CLIMBABLE

	var/list/connections = list("0", "0", "0", "0")
	var/obj/overmap/visitable/ship/linked
	var/obj/effect/map_table_screen/screen = null
	var/obj/effect/map_table_visuals/visuals = null
	var/weakref/sensor_ref
	var/map_offset_x = 0
	var/map_offset_y = 0
	var/table_size_x = 1
	var/table_size_y = 1

/obj/machinery/map_table/New()
	. = ..()
	map_tables += src

/obj/machinery/map_table/Destroy()
	map_tables -= src
	if(linked)
		GLOB.moved_event.unregister(linked, src, .proc/on_moved)
		linked.map_tables -= src
	else
		for(var/obj/overmap/visitable/ship/S in SSshuttle.ships)
			S.map_tables -= src
	QDEL_NULL(screen)
	. = ..()

/obj/machinery/map_table/Initialize(mapload)
	. = ..()
	if(!mapload)
		for (var/obj/overmap/visitable/ship/ship as anything in SSshuttle.ships)
			if (attempt_hook_up(ship))
				break
	visuals = new(src)
	visuals.link_table(src)
	screen = new(src)
	screen.link_table(src)
	screen.add_vis_contents(visuals)
	update_connections(!mapload)
	update_icon()

/obj/machinery/map_table/proc/attempt_hook_up(obj/overmap/visitable/ship/sector)
	if(!istype(sector))
		return
	if(sector.check_ownership(src))
		linked = sector
		GLOB.moved_event.register(linked, src, .proc/on_moved)
		LAZYADD(linked.map_tables, src)
		find_sensors()
		update_icon()
		return 1

/obj/machinery/map_table/proc/on_moved()
	if(istype(screen))
		screen.update_screen()
	if(istype(visuals))
		visuals.update_visuals()

/obj/machinery/map_table/proc/update_connections(propagate = 0, list/already_updated)
	var/list/dirs = list()

	if(propagate)
		LAZYINITLIST(already_updated)
		already_updated += src

	for(var/obj/machinery/map_table/M in orange(src, 1))
		if(propagate && !already_updated.Find(M))
			M.update_connections(TRUE, already_updated)
			M.update_icon()
		dirs += get_dir(src, M)
	connections = dirs_to_corner_states(dirs)

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
			for (var/obj/machinery/map_table/other_table in other_turf)
				if (istype(other_table, /obj/machinery/map_table))
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
	if(screen)
		screen.update_screen()

/obj/machinery/map_table/proc/update_visuals()
	if(visuals)
		visuals.update_visuals()

/obj/machinery/map_table/on_update_icon()
	. = ..()
	icon_state = "blank"
	clear_vis_contents()
	ClearOverlays()

	var/image/I
	for(var/i = 1 to 4)
		I = image(icon, "maptable_[connections[i]]", dir = SHIFTL(1, i - 1))
		AddOverlays(I)

	add_vis_contents(screen)

/obj/machinery/map_table/proc/find_sensors()
	if (!linked)
		return
	for (var/obj/machinery/shipsensors/S in SSmachines.machinery)
		if (linked.check_ownership(S))
			sensor_ref = weakref(S)
			break
