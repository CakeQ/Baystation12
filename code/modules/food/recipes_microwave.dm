
// see code/datums/recipe.dm


/* No telebacon. just no...
/datum/recipe/cooked/telebacon
	items = list(
		/obj/item/weapon/reagent_containers/food/snacks/meat,
		/obj/item/device/assembly/signaler
	)
	result = /obj/item/weapon/reagent_containers/food/snacks/telebacon

I said no!
/datum/recipe/cooked/syntitelebacon
	items = list(
		/obj/item/weapon/reagent_containers/food/snacks/meat/syntiflesh,
		/obj/item/device/assembly/signaler
	)
	result = /obj/item/weapon/reagent_containers/food/snacks/telebacon
*/

/datum/recipe/cooked
	var/cooking_type = COOKING_FLAG_ANY //How you need to cook this recipe
	var/cooking_temp = T20C + 100 //Base cooking temp for progress to tick

/datum/recipe/cooked/friedegg
	reagents = list(/datum/reagent/sodiumchloride = 1, /datum/reagent/blackpepper = 1)
	items = list(
		/obj/item/weapon/reagent_containers/food/snacks/egg
	)
	result = /obj/item/weapon/reagent_containers/food/snacks/friedegg

/datum/recipe/cooked/friedegg2
	items = list(
		/obj/item/weapon/reagent_containers/food/snacks/egg,
		/obj/item/weapon/reagent_containers/food/snacks/egg,
	)
	result = /obj/item/weapon/reagent_containers/food/snacks/friedegg

/datum/recipe/cooked/boiledegg
	reagents = list(/datum/reagent/water = 10)
	items = list(
		/obj/item/weapon/reagent_containers/food/snacks/egg
	)
	result = /obj/item/weapon/reagent_containers/food/snacks/boiledegg

/datum/recipe/cooked/dionaroast
	fruit = list("apple" = 1)
	reagents = list(/datum/reagent/acid/polyacid = 5) //It dissolves the carapace. Still poisonous, though.
	items = list(/obj/item/weapon/holder/diona)
	result = /obj/item/weapon/reagent_containers/food/snacks/dionaroast

/datum/recipe/cooked/classichotdog
	items = list(
		/obj/item/weapon/reagent_containers/food/snacks/bun,
		/obj/item/weapon/holder/corgi
	)
	result = /obj/item/weapon/reagent_containers/food/snacks/classichotdog

/datum/recipe/cooked/jellydonut
	reagents = list(/datum/reagent/drink/juice/berry = 5, /datum/reagent/sugar = 5)
	items = list(
		/obj/item/weapon/reagent_containers/food/snacks/dough
	)
	result = /obj/item/weapon/reagent_containers/food/snacks/donut/jelly

/datum/recipe/cooked/jellydonut/slime
	reagents = list(/datum/reagent/slimejelly = 5, /datum/reagent/sugar = 5)
	items = list(
		/obj/item/weapon/reagent_containers/food/snacks/dough
	)
	result = /obj/item/weapon/reagent_containers/food/snacks/donut/slimejelly

/datum/recipe/cooked/jellydonut/cherry
	reagents = list(/datum/reagent/nutriment/cherryjelly = 5, /datum/reagent/sugar = 5)
	items = list(
		/obj/item/weapon/reagent_containers/food/snacks/dough
	)
	result = /obj/item/weapon/reagent_containers/food/snacks/donut/cherryjelly

/datum/recipe/cooked/donut
	reagents = list(/datum/reagent/sugar = 5)
	items = list(
		/obj/item/weapon/reagent_containers/food/snacks/dough
	)
	result = /obj/item/weapon/reagent_containers/food/snacks/donut/normal

/datum/recipe/cooked/meatburger
	items = list(
		/obj/item/weapon/reagent_containers/food/snacks/bun,
		/obj/item/weapon/reagent_containers/food/snacks/meat
	)
	result = /obj/item/weapon/reagent_containers/food/snacks/meatburger

/datum/recipe/cooked/brainburger
	items = list(
		/obj/item/weapon/reagent_containers/food/snacks/bun,
		/obj/item/organ/internal/brain
	)
	result = /obj/item/weapon/reagent_containers/food/snacks/brainburger

/datum/recipe/cooked/roburger
	items = list(
		/obj/item/weapon/reagent_containers/food/snacks/bun,
		/obj/item/robot_parts/head
	)
	result = /obj/item/weapon/reagent_containers/food/snacks/roburger

/datum/recipe/cooked/xenoburger
	items = list(
		/obj/item/weapon/reagent_containers/food/snacks/bun,
		/obj/item/weapon/reagent_containers/food/snacks/xenomeat
	)
	result = /obj/item/weapon/reagent_containers/food/snacks/xenoburger

/datum/recipe/cooked/fishburger
	items = list(
		/obj/item/weapon/reagent_containers/food/snacks/bun,
		/obj/item/weapon/reagent_containers/food/snacks/fish
	)
	result = /obj/item/weapon/reagent_containers/food/snacks/fishburger

/datum/recipe/cooked/tofuburger
	items = list(
		/obj/item/weapon/reagent_containers/food/snacks/bun,
		/obj/item/weapon/reagent_containers/food/snacks/tofu
	)
	result = /obj/item/weapon/reagent_containers/food/snacks/tofuburger

/datum/recipe/cooked/ghostburger
	items = list(
		/obj/item/weapon/reagent_containers/food/snacks/bun,
		/obj/item/weapon/ectoplasm //where do you even find this stuff
	)
	result = /obj/item/weapon/reagent_containers/food/snacks/ghostburger

/datum/recipe/cooked/clownburger
	items = list(
		/obj/item/weapon/reagent_containers/food/snacks/bun,
		/obj/item/clothing/mask/gas/clown_hat
	)
	result = /obj/item/weapon/reagent_containers/food/snacks/clownburger

/datum/recipe/cooked/mimeburger
	items = list(
		/obj/item/weapon/reagent_containers/food/snacks/bun,
		/obj/item/clothing/head/beret
	)
	result = /obj/item/weapon/reagent_containers/food/snacks/mimeburger

/datum/recipe/cooked/bunbun
	items = list(
		/obj/item/weapon/reagent_containers/food/snacks/bun,
		/obj/item/weapon/reagent_containers/food/snacks/bun
	)
	result = /obj/item/weapon/reagent_containers/food/snacks/bunbun

/datum/recipe/cooked/hotdog
	items = list(
		/obj/item/weapon/reagent_containers/food/snacks/bun,
		/obj/item/weapon/reagent_containers/food/snacks/sausage
	)
	result = /obj/item/weapon/reagent_containers/food/snacks/hotdog

/datum/recipe/cooked/waffles
	reagents = list(/datum/reagent/nutriment/batter/cakebatter = 20)
	result = /obj/item/weapon/reagent_containers/food/snacks/waffles

/datum/recipe/cooked/pancakesblu
	reagents = list(/datum/reagent/nutriment/batter = 20)
	fruit = list("blueberries" = 2)
	result = /obj/item/weapon/reagent_containers/food/snacks/pancakesblu

/datum/recipe/cooked/pancakes
	reagents = list(/datum/reagent/nutriment/batter = 20)
	result = /obj/item/weapon/reagent_containers/food/snacks/pancakes

/datum/recipe/cooked/donkpocket
	items = list(
		/obj/item/weapon/reagent_containers/food/snacks/doughslice,
		/obj/item/weapon/reagent_containers/food/snacks/meatball
	)
	result = /obj/item/weapon/reagent_containers/food/snacks/donkpocket //SPECIAL
	proc/warm_up(var/obj/item/weapon/reagent_containers/food/snacks/donkpocket/being_cooked)
		being_cooked.heat()
	make_food(var/obj/container as obj)
		var/obj/item/weapon/reagent_containers/food/snacks/donkpocket/being_cooked = ..(container)
		warm_up(being_cooked)
		return being_cooked

/datum/recipe/cooked/donkpocket2
	items = list(
		/obj/item/weapon/reagent_containers/food/snacks/doughslice,
		/obj/item/weapon/reagent_containers/food/snacks/rawmeatball
	)
	result = /obj/item/weapon/reagent_containers/food/snacks/donkpocket //SPECIAL

/datum/recipe/cooked/donkpocket2/proc/warm_up(var/obj/item/weapon/reagent_containers/food/snacks/donkpocket/being_cooked)
	being_cooked.heat()

/datum/recipe/cooked/donkpocket2/make_food(var/obj/container as obj)
	var/obj/item/weapon/reagent_containers/food/snacks/donkpocket/being_cooked = ..(container)
	warm_up(being_cooked)
	return being_cooked

/datum/recipe/cooked/donkpocket/warm
	reagents = list() //This is necessary since this is a child object of the above recipe and we don't want donk pockets to need flour
	items = list(
		/obj/item/weapon/reagent_containers/food/snacks/donkpocket
	)
	result = /obj/item/weapon/reagent_containers/food/snacks/donkpocket //SPECIAL
	make_food(var/obj/container as obj)
		var/obj/item/weapon/reagent_containers/food/snacks/donkpocket/being_cooked = locate() in container
		if(being_cooked && !being_cooked.warm)
			warm_up(being_cooked)
		return being_cooked

/datum/recipe/cooked/meatbread
	items = list(
		/obj/item/weapon/reagent_containers/food/snacks/dough,
		/obj/item/weapon/reagent_containers/food/snacks/dough,
		/obj/item/weapon/reagent_containers/food/snacks/meat,
		/obj/item/weapon/reagent_containers/food/snacks/meat,
		/obj/item/weapon/reagent_containers/food/snacks/cheesewedge,
		/obj/item/weapon/reagent_containers/food/snacks/cheesewedge,
	)
	result = /obj/item/weapon/reagent_containers/food/snacks/sliceable/meatbread

/datum/recipe/cooked/xenomeatbread
	items = list(
		/obj/item/weapon/reagent_containers/food/snacks/dough,
		/obj/item/weapon/reagent_containers/food/snacks/dough,
		/obj/item/weapon/reagent_containers/food/snacks/xenomeat,
		/obj/item/weapon/reagent_containers/food/snacks/xenomeat,
		/obj/item/weapon/reagent_containers/food/snacks/cheesewedge,
		/obj/item/weapon/reagent_containers/food/snacks/cheesewedge,
	)
	result = /obj/item/weapon/reagent_containers/food/snacks/sliceable/xenomeatbread

/datum/recipe/cooked/bananabread
	fruit = list("banana" = 2)
	reagents = list(/datum/reagent/drink/milk = 5, /datum/reagent/sugar = 5)
	items = list(
		/obj/item/weapon/reagent_containers/food/snacks/dough,
		/obj/item/weapon/reagent_containers/food/snacks/dough,
	)
	result = /obj/item/weapon/reagent_containers/food/snacks/sliceable/bananabread

/datum/recipe/cooked/omelette
	items = list(
		/obj/item/weapon/reagent_containers/food/snacks/egg,
		/obj/item/weapon/reagent_containers/food/snacks/egg,
		/obj/item/weapon/reagent_containers/food/snacks/cheesewedge,
	)
	result = /obj/item/weapon/reagent_containers/food/snacks/omelette

/datum/recipe/cooked/muffin
	reagents = list(/datum/reagent/nutriment/batter/cakebatter = 10)

	result = /obj/item/weapon/reagent_containers/food/snacks/muffin

/datum/recipe/cooked/eggplantparm
	fruit = list("eggplant" = 1)
	items = list(
		/obj/item/weapon/reagent_containers/food/snacks/cheesewedge,
		/obj/item/weapon/reagent_containers/food/snacks/cheesewedge
		)
	result = /obj/item/weapon/reagent_containers/food/snacks/eggplantparm

/datum/recipe/cooked/soylenviridians
	fruit = list("soybeans" = 1)
	reagents = list(/datum/reagent/nutriment/flour = 10)
	result = /obj/item/weapon/reagent_containers/food/snacks/soylenviridians

/datum/recipe/cooked/soylentgreen
	reagents = list(/datum/reagent/nutriment/flour = 10)
	items = list(
		/obj/item/weapon/reagent_containers/food/snacks/meat/human,
		/obj/item/weapon/reagent_containers/food/snacks/meat/human
	)
	result = /obj/item/weapon/reagent_containers/food/snacks/soylentgreen

/datum/recipe/cooked/meatpie
	items = list(
		/obj/item/weapon/reagent_containers/food/snacks/sliceable/flatdough,
		/obj/item/weapon/reagent_containers/food/snacks/meat,
	)
	result = /obj/item/weapon/reagent_containers/food/snacks/meatpie

/datum/recipe/cooked/tofupie
	items = list(
		/obj/item/weapon/reagent_containers/food/snacks/sliceable/flatdough,
		/obj/item/weapon/reagent_containers/food/snacks/tofu,
	)
	result = /obj/item/weapon/reagent_containers/food/snacks/tofupie

/datum/recipe/cooked/xemeatpie
	items = list(
		/obj/item/weapon/reagent_containers/food/snacks/sliceable/flatdough,
		/obj/item/weapon/reagent_containers/food/snacks/xenomeat,
	)
	result = /obj/item/weapon/reagent_containers/food/snacks/xemeatpie

/datum/recipe/cooked/bananapie
	fruit = list("banana" = 1)
	reagents = list(/datum/reagent/sugar = 5)
	items = list(/obj/item/weapon/reagent_containers/food/snacks/sliceable/flatdough)
	result = /obj/item/weapon/reagent_containers/food/snacks/bananapie

/datum/recipe/cooked/cherrypie
	fruit = list("cherries" = 1)
	reagents = list(/datum/reagent/sugar = 10)
	items = list(
		/obj/item/weapon/reagent_containers/food/snacks/sliceable/flatdough,
	)
	result = /obj/item/weapon/reagent_containers/food/snacks/cherrypie

/datum/recipe/cooked/berryclafoutis
	fruit = list("berries" = 1)
	items = list(
		/obj/item/weapon/reagent_containers/food/snacks/sliceable/flatdough,
	)
	result = /obj/item/weapon/reagent_containers/food/snacks/berryclafoutis

/datum/recipe/cooked/wingfangchu
	reagents = list(/datum/reagent/nutriment/soysauce = 5)
	items = list(
		/obj/item/weapon/reagent_containers/food/snacks/xenomeat,
	)
	result = /obj/item/weapon/reagent_containers/food/snacks/wingfangchu

/datum/recipe/cooked/chaosdonut
	reagents = list(/datum/reagent/frostoil = 5, /datum/reagent/capsaicin = 5, /datum/reagent/sugar = 5)
	items = list(
		/obj/item/weapon/reagent_containers/food/snacks/dough
	)
	result = /obj/item/weapon/reagent_containers/food/snacks/donut/chaos

/datum/recipe/cooked/meatkabob
	items = list(
		/obj/item/stack/material/rods,
		/obj/item/weapon/reagent_containers/food/snacks/meat,
		/obj/item/weapon/reagent_containers/food/snacks/meat,
	)
	result = /obj/item/weapon/reagent_containers/food/snacks/meatkabob

/datum/recipe/cooked/tofukabob
	items = list(
		/obj/item/stack/material/rods,
		/obj/item/weapon/reagent_containers/food/snacks/tofu,
		/obj/item/weapon/reagent_containers/food/snacks/tofu,
	)
	result = /obj/item/weapon/reagent_containers/food/snacks/tofukabob

/datum/recipe/cooked/tofubread
	items = list(
		/obj/item/weapon/reagent_containers/food/snacks/dough,
		/obj/item/weapon/reagent_containers/food/snacks/dough,
		/obj/item/weapon/reagent_containers/food/snacks/dough,
		/obj/item/weapon/reagent_containers/food/snacks/tofu,
		/obj/item/weapon/reagent_containers/food/snacks/tofu,
		/obj/item/weapon/reagent_containers/food/snacks/tofu,
		/obj/item/weapon/reagent_containers/food/snacks/cheesewedge,
		/obj/item/weapon/reagent_containers/food/snacks/cheesewedge,
		/obj/item/weapon/reagent_containers/food/snacks/cheesewedge,
	)
	result = /obj/item/weapon/reagent_containers/food/snacks/sliceable/tofubread

/datum/recipe/cooked/loadedbakedpotato
	fruit = list("potato" = 1)
	items = list(/obj/item/weapon/reagent_containers/food/snacks/cheesewedge)
	result = /obj/item/weapon/reagent_containers/food/snacks/loadedbakedpotato

/datum/recipe/cooked/cheesyfries
	items = list(
		/obj/item/weapon/reagent_containers/food/snacks/fries,
		/obj/item/weapon/reagent_containers/food/snacks/cheesewedge,
	)
	result = /obj/item/weapon/reagent_containers/food/snacks/cheesyfries

/datum/recipe/cooked/cubancarp
	fruit = list("chili" = 1)
	reagents = list(/datum/reagent/nutriment/batter = 10)
	items = list(
		/obj/item/weapon/reagent_containers/food/snacks/fish
	)
	result = /obj/item/weapon/reagent_containers/food/snacks/cubancarp

/datum/recipe/cooked/popcorn
	reagents = list(/datum/reagent/sodiumchloride = 5)
	fruit = list("corn" = 1)
	result = /obj/item/weapon/reagent_containers/food/snacks/popcorn

/datum/recipe/cooked/cookie
	reagents = list(/datum/reagent/nutriment/batter/cakebatter = 5, /datum/reagent/nutriment/coco = 5)

	result = /obj/item/weapon/reagent_containers/food/snacks/cookie

/datum/recipe/cooked/fortunecookie
	reagents = list(/datum/reagent/sugar = 5)
	items = list(
		/obj/item/weapon/reagent_containers/food/snacks/doughslice,
		/obj/item/weapon/paper,
	)
	result = /obj/item/weapon/reagent_containers/food/snacks/fortunecookie
	make_food(var/obj/container as obj)
		var/obj/item/weapon/paper/paper = locate() in container
		paper.loc = null //prevent deletion
		var/obj/item/weapon/reagent_containers/food/snacks/fortunecookie/being_cooked = ..(container)
		paper.loc = being_cooked
		being_cooked.trash = paper //so the paper is left behind as trash without special-snowflake(TM Nodrak) code ~carn
		return being_cooked
	check_items(var/obj/container as obj)
		. = ..()
		if (.)
			var/obj/item/weapon/paper/paper = locate() in container
			if (!paper.info)
				return 0
		return .

/datum/recipe/cooked/plainsteak
	items = list(/obj/item/weapon/reagent_containers/food/snacks/meat)
	result = /obj/item/weapon/reagent_containers/food/snacks/plainsteak

/datum/recipe/cooked/meatsteak
	reagents = list(/datum/reagent/sodiumchloride = 1, /datum/reagent/blackpepper = 1)
	items = list(/obj/item/weapon/reagent_containers/food/snacks/meat)
	result = /obj/item/weapon/reagent_containers/food/snacks/meatsteak

/datum/recipe/cooked/loadedsteak
	reagents = list(/datum/reagent/nutriment/garlicsauce = 5)
	fruit = list("onion" = 1, "mushroom" = 1)
	items = list(/obj/item/weapon/reagent_containers/food/snacks/meat)
	result = /obj/item/weapon/reagent_containers/food/snacks/loadedsteak

/datum/recipe/cooked/syntisteak
	reagents = list(/datum/reagent/sodiumchloride = 1, /datum/reagent/blackpepper = 1)
	items = list(/obj/item/weapon/reagent_containers/food/snacks/meat/syntiflesh)
	result = /obj/item/weapon/reagent_containers/food/snacks/meatsteak

/datum/recipe/cooked/pizzamargherita
	fruit = list("tomato" = 1)
	items = list(
		/obj/item/weapon/reagent_containers/food/snacks/sliceable/flatdough,
		/obj/item/weapon/reagent_containers/food/snacks/cheesewedge,
		/obj/item/weapon/reagent_containers/food/snacks/cheesewedge,
		/obj/item/weapon/reagent_containers/food/snacks/cheesewedge,
	)
	result = /obj/item/weapon/reagent_containers/food/snacks/sliceable/pizza/margherita

/datum/recipe/cooked/meatpizza
	fruit = list("tomato" = 1)
	items = list(
		/obj/item/weapon/reagent_containers/food/snacks/sliceable/flatdough,
		/obj/item/weapon/reagent_containers/food/snacks/meat,
		/obj/item/weapon/reagent_containers/food/snacks/meat,
		/obj/item/weapon/reagent_containers/food/snacks/cheesewedge
	)
	result = /obj/item/weapon/reagent_containers/food/snacks/sliceable/pizza/meatpizza

/datum/recipe/cooked/mushroompizza
	fruit = list("mushroom" = 5, "tomato" = 1)
	items = list(
		/obj/item/weapon/reagent_containers/food/snacks/sliceable/flatdough,
		/obj/item/weapon/reagent_containers/food/snacks/cheesewedge
	)
	result = /obj/item/weapon/reagent_containers/food/snacks/sliceable/pizza/mushroompizza

/datum/recipe/cooked/vegetablepizza
	fruit = list("eggplant" = 1, "carrot" = 1, "corn" = 1, "tomato" = 1)
	items = list(
		/obj/item/weapon/reagent_containers/food/snacks/sliceable/flatdough,
		/obj/item/weapon/reagent_containers/food/snacks/cheesewedge
	)
	result = /obj/item/weapon/reagent_containers/food/snacks/sliceable/pizza/vegetablepizza

/datum/recipe/cooked/spacylibertyduff
	reagents = list(/datum/reagent/water = 10, /datum/reagent/ethanol/vodka = 5, /datum/reagent/psilocybin = 5)
	result = /obj/item/weapon/reagent_containers/food/snacks/spacylibertyduff

/datum/recipe/cooked/amanitajelly
	reagents = list(/datum/reagent/water = 10, /datum/reagent/ethanol/vodka = 5, /datum/reagent/toxin/amatoxin = 5)
	result = /obj/item/weapon/reagent_containers/food/snacks/amanitajelly
	make_food(var/obj/container as obj)
		var/obj/item/weapon/reagent_containers/food/snacks/amanitajelly/being_cooked = ..(container)
		being_cooked.reagents.del_reagent(/datum/reagent/toxin/amatoxin)
		return being_cooked

/datum/recipe/cooked/meatballsoup
	fruit = list("carrot" = 1, "potato" = 1)
	reagents = list(/datum/reagent/water = 10)
	items = list(/obj/item/weapon/reagent_containers/food/snacks/meatball)
	result = /obj/item/weapon/reagent_containers/food/snacks/meatballsoup

/datum/recipe/cooked/vegetablesoup
	fruit = list("carrot" = 1, "potato" = 1, "corn" = 1, "eggplant" = 1)
	reagents = list(/datum/reagent/water = 10)
	result = /obj/item/weapon/reagent_containers/food/snacks/vegetablesoup

/datum/recipe/cooked/nettlesoup
	fruit = list("nettle" = 1, "potato" = 1)
	reagents = list(/datum/reagent/water = 10)
	items = list(
		/obj/item/weapon/reagent_containers/food/snacks/egg
	)
	result = /obj/item/weapon/reagent_containers/food/snacks/nettlesoup

/datum/recipe/cooked/wishsoup
	reagents = list(/datum/reagent/water = 20)
	result= /obj/item/weapon/reagent_containers/food/snacks/wishsoup

/datum/recipe/cooked/hotchili
	fruit = list("chili" = 1, "tomato" = 1)
	items = list(/obj/item/weapon/reagent_containers/food/snacks/meat)
	result = /obj/item/weapon/reagent_containers/food/snacks/hotchili

/datum/recipe/cooked/coldchili
	fruit = list("icechili" = 1, "tomato" = 1)
	items = list(/obj/item/weapon/reagent_containers/food/snacks/meat)
	result = /obj/item/weapon/reagent_containers/food/snacks/coldchili

/datum/recipe/cooked/amanita_pie
	reagents = list(/datum/reagent/toxin/amatoxin = 5)
	items = list(/obj/item/weapon/reagent_containers/food/snacks/sliceable/flatdough)
	result = /obj/item/weapon/reagent_containers/food/snacks/amanita_pie

/datum/recipe/cooked/plump_pie
	fruit = list("plumphelmet" = 1)
	items = list(/obj/item/weapon/reagent_containers/food/snacks/sliceable/flatdough)
	result = /obj/item/weapon/reagent_containers/food/snacks/plump_pie

/datum/recipe/cooked/spellburger
	items = list(
		/obj/item/weapon/reagent_containers/food/snacks/meatburger,
		/obj/item/clothing/head/wizard,
	)
	result = /obj/item/weapon/reagent_containers/food/snacks/spellburger

/datum/recipe/cooked/bigbiteburger
	items = list(
		/obj/item/weapon/reagent_containers/food/snacks/meatburger,
		/obj/item/weapon/reagent_containers/food/snacks/meat,
		/obj/item/weapon/reagent_containers/food/snacks/meat,
		/obj/item/weapon/reagent_containers/food/snacks/egg,
	)
	result = /obj/item/weapon/reagent_containers/food/snacks/bigbiteburger

/datum/recipe/cooked/enchiladas
	fruit = list("chili" = 2, "corn" = 1)
	items = list(/obj/item/weapon/reagent_containers/food/snacks/cutlet)
	result = /obj/item/weapon/reagent_containers/food/snacks/enchiladas

/datum/recipe/cooked/creamcheesebread
	items = list(
		/obj/item/weapon/reagent_containers/food/snacks/dough,
		/obj/item/weapon/reagent_containers/food/snacks/dough,
		/obj/item/weapon/reagent_containers/food/snacks/cheesewedge,
		/obj/item/weapon/reagent_containers/food/snacks/cheesewedge,
	)
	result = /obj/item/weapon/reagent_containers/food/snacks/sliceable/creamcheesebread

/datum/recipe/cooked/monkeysdelight
	fruit = list("banana" = 1)
	reagents = list(/datum/reagent/sodiumchloride = 1, /datum/reagent/blackpepper = 1, /datum/reagent/nutriment/flour = 10)
	items = list(
		/obj/item/weapon/reagent_containers/food/snacks/monkeycube
	)
	result = /obj/item/weapon/reagent_containers/food/snacks/monkeysdelight

/datum/recipe/cooked/baguette
	reagents = list(/datum/reagent/sodiumchloride = 1, /datum/reagent/blackpepper = 1)
	items = list(
		/obj/item/weapon/reagent_containers/food/snacks/dough,
		/obj/item/weapon/reagent_containers/food/snacks/dough,
	)
	result = /obj/item/weapon/reagent_containers/food/snacks/baguette

/datum/recipe/cooked/fishandchips
	items = list(
		/obj/item/weapon/reagent_containers/food/snacks/fries,
		/obj/item/weapon/reagent_containers/food/snacks/fish
	)
	result = /obj/item/weapon/reagent_containers/food/snacks/fishandchips

/datum/recipe/cooked/bread
	items = list(
		/obj/item/weapon/reagent_containers/food/snacks/dough,
		/obj/item/weapon/reagent_containers/food/snacks/dough,
		/obj/item/weapon/reagent_containers/food/snacks/egg
	)
	result = /obj/item/weapon/reagent_containers/food/snacks/sliceable/bread

/datum/recipe/cooked/sandwich
	items = list(
		/obj/item/weapon/reagent_containers/food/snacks/meatsteak,
		/obj/item/weapon/reagent_containers/food/snacks/slice/bread,
		/obj/item/weapon/reagent_containers/food/snacks/slice/bread,
		/obj/item/weapon/reagent_containers/food/snacks/cheesewedge,
	)
	result = /obj/item/weapon/reagent_containers/food/snacks/sandwich

/datum/recipe/cooked/toastedsandwich
	items = list(
		/obj/item/weapon/reagent_containers/food/snacks/sandwich
	)
	result = /obj/item/weapon/reagent_containers/food/snacks/toastedsandwich

/datum/recipe/cooked/grilledcheese
	items = list(
		/obj/item/weapon/reagent_containers/food/snacks/slice/bread,
		/obj/item/weapon/reagent_containers/food/snacks/slice/bread,
		/obj/item/weapon/reagent_containers/food/snacks/cheesewedge,
	)
	result = /obj/item/weapon/reagent_containers/food/snacks/grilledcheese

/datum/recipe/cooked/tomatosoup
	fruit = list("tomato" = 2)
	reagents = list(/datum/reagent/water = 10)
	result = /obj/item/weapon/reagent_containers/food/snacks/tomatosoup

/datum/recipe/cooked/rofflewaffles
	reagents = list(/datum/reagent/psilocybin = 5, /datum/reagent/nutriment/batter/cakebatter = 20)
	result = /obj/item/weapon/reagent_containers/food/snacks/rofflewaffles

/datum/recipe/cooked/stew
	fruit = list("potato" = 1, "tomato" = 1, "carrot" = 1, "eggplant" = 1, "mushroom" = 1)
	reagents = list(/datum/reagent/water = 10)
	items = list(/obj/item/weapon/reagent_containers/food/snacks/meat)
	result = /obj/item/weapon/reagent_containers/food/snacks/stew

/datum/recipe/cooked/slimetoast
	reagents = list(/datum/reagent/slimejelly = 5)
	items = list(
		/obj/item/weapon/reagent_containers/food/snacks/slice/bread,
	)
	result = /obj/item/weapon/reagent_containers/food/snacks/jelliedtoast/slime

/datum/recipe/cooked/jelliedtoast
	reagents = list(/datum/reagent/nutriment/cherryjelly = 5)
	items = list(
		/obj/item/weapon/reagent_containers/food/snacks/slice/bread,
	)
	result = /obj/item/weapon/reagent_containers/food/snacks/jelliedtoast/cherry

/datum/recipe/cooked/milosoup
	reagents = list(/datum/reagent/water = 10)
	items = list(
		/obj/item/weapon/reagent_containers/food/snacks/soydope,
		/obj/item/weapon/reagent_containers/food/snacks/soydope,
		/obj/item/weapon/reagent_containers/food/snacks/tofu,
		/obj/item/weapon/reagent_containers/food/snacks/tofu,
	)
	result = /obj/item/weapon/reagent_containers/food/snacks/milosoup

/datum/recipe/cooked/stewedsoymeat
	fruit = list("carrot" = 1, "tomato" = 1)
	items = list(
		/obj/item/weapon/reagent_containers/food/snacks/soydope,
		/obj/item/weapon/reagent_containers/food/snacks/soydope
	)
	result = /obj/item/weapon/reagent_containers/food/snacks/stewedsoymeat

/datum/recipe/cooked/boiledspagetti
	reagents = list(/datum/reagent/water = 10)
	items = list(
		/obj/item/weapon/reagent_containers/food/snacks/spagetti,
	)
	result = /obj/item/weapon/reagent_containers/food/snacks/boiledspagetti

/datum/recipe/cooked/boiledrice
	reagents = list(/datum/reagent/water = 10, /datum/reagent/nutriment/rice = 10)
	result = /obj/item/weapon/reagent_containers/food/snacks/boiledrice

/datum/recipe/cooked/chazuke
	reagents = list(/datum/reagent/nutriment/rice/chazuke = 10)
	result = /obj/item/weapon/reagent_containers/food/snacks/boiledrice/chazuke

/datum/recipe/cooked/katsucurry
	fruit = list("apple" = 1, "carrot" = 1, "potato" = 1)
	reagents = list(/datum/reagent/water = 10, /datum/reagent/nutriment/rice = 10, /datum/reagent/nutriment/flour = 5)
	items = list(
		/obj/item/weapon/reagent_containers/food/snacks/meat/chicken
	)
	result = /obj/item/weapon/reagent_containers/food/snacks/katsucurry

/datum/recipe/cooked/ricepudding
	reagents = list(/datum/reagent/drink/milk = 5, /datum/reagent/nutriment/rice = 10)
	result = /obj/item/weapon/reagent_containers/food/snacks/ricepudding

/datum/recipe/cooked/pastatomato
	fruit = list("tomato" = 2)
	reagents = list(/datum/reagent/water = 10)
	items = list(/obj/item/weapon/reagent_containers/food/snacks/spagetti)
	result = /obj/item/weapon/reagent_containers/food/snacks/pastatomato

/datum/recipe/cooked/poppypretzel
	fruit = list("poppy" = 1)
	items = list(/obj/item/weapon/reagent_containers/food/snacks/dough)
	result = /obj/item/weapon/reagent_containers/food/snacks/poppypretzel

/datum/recipe/cooked/meatballspagetti
	reagents = list(/datum/reagent/water = 10)
	items = list(
		/obj/item/weapon/reagent_containers/food/snacks/spagetti,
		/obj/item/weapon/reagent_containers/food/snacks/meatball,
		/obj/item/weapon/reagent_containers/food/snacks/meatball,
	)
	result = /obj/item/weapon/reagent_containers/food/snacks/meatballspagetti

/datum/recipe/cooked/spesslaw
	reagents = list(/datum/reagent/water = 10)
	items = list(
		/obj/item/weapon/reagent_containers/food/snacks/spagetti,
		/obj/item/weapon/reagent_containers/food/snacks/meatball,
		/obj/item/weapon/reagent_containers/food/snacks/meatball,
		/obj/item/weapon/reagent_containers/food/snacks/meatball,
		/obj/item/weapon/reagent_containers/food/snacks/meatball,
	)
	result = /obj/item/weapon/reagent_containers/food/snacks/spesslaw

/datum/recipe/cooked/nanopasta
	reagents = list(/datum/reagent/water = 10)
	items = list(/obj/item/weapon/reagent_containers/food/snacks/spagetti,
				/obj/item/stack/nanopaste)
	result = /obj/item/weapon/reagent_containers/food/snacks/nanopasta

/datum/recipe/cooked/superbiteburger
	fruit = list("tomato" = 1)
	reagents = list(/datum/reagent/sodiumchloride = 5, /datum/reagent/blackpepper = 5)
	items = list(
		/obj/item/weapon/reagent_containers/food/snacks/bigbiteburger,
		/obj/item/weapon/reagent_containers/food/snacks/dough,
		/obj/item/weapon/reagent_containers/food/snacks/meat,
		/obj/item/weapon/reagent_containers/food/snacks/cheesewedge,
		/obj/item/weapon/reagent_containers/food/snacks/boiledegg,
	)
	result = /obj/item/weapon/reagent_containers/food/snacks/superbiteburger

/datum/recipe/cooked/candiedapple
	fruit = list("apple" = 1)
	reagents = list(/datum/reagent/water = 10, /datum/reagent/sugar = 5)
	result = /obj/item/weapon/reagent_containers/food/snacks/candiedapple

/datum/recipe/cooked/applepie
	fruit = list("apple" = 1)
	items = list(/obj/item/weapon/reagent_containers/food/snacks/sliceable/flatdough)
	result = /obj/item/weapon/reagent_containers/food/snacks/applepie

/datum/recipe/cooked/slimeburger
	reagents = list(/datum/reagent/slimejelly = 5)
	items = list(
		/obj/item/weapon/reagent_containers/food/snacks/bun
	)
	result = /obj/item/weapon/reagent_containers/food/snacks/jellyburger/slime

/datum/recipe/cooked/jellyburger
	reagents = list(/datum/reagent/nutriment/cherryjelly = 5)
	items = list(
		/obj/item/weapon/reagent_containers/food/snacks/bun
	)
	result = /obj/item/weapon/reagent_containers/food/snacks/jellyburger/cherry

/datum/recipe/cooked/twobread
	reagents = list(/datum/reagent/ethanol/wine = 5)
	items = list(
		/obj/item/weapon/reagent_containers/food/snacks/slice/bread,
		/obj/item/weapon/reagent_containers/food/snacks/slice/bread,
	)
	result = /obj/item/weapon/reagent_containers/food/snacks/twobread

/datum/recipe/cooked/threebread
	items = list(
		/obj/item/weapon/reagent_containers/food/snacks/twobread,
		/obj/item/weapon/reagent_containers/food/snacks/slice/bread,
	)
	result = /obj/item/weapon/reagent_containers/food/snacks/threebread

/datum/recipe/cooked/slimesandwich
	reagents = list(/datum/reagent/slimejelly = 5)
	items = list(
		/obj/item/weapon/reagent_containers/food/snacks/slice/bread,
		/obj/item/weapon/reagent_containers/food/snacks/slice/bread,
	)
	result = /obj/item/weapon/reagent_containers/food/snacks/jellysandwich/slime

/datum/recipe/cooked/cherrysandwich
	reagents = list(/datum/reagent/nutriment/cherryjelly = 5)
	items = list(
		/obj/item/weapon/reagent_containers/food/snacks/slice/bread,
		/obj/item/weapon/reagent_containers/food/snacks/slice/bread,
	)
	result = /obj/item/weapon/reagent_containers/food/snacks/jellysandwich/cherry

/datum/recipe/cooked/bloodsoup
	reagents = list(/datum/reagent/blood = 30)
	result = /obj/item/weapon/reagent_containers/food/snacks/bloodsoup

/datum/recipe/cooked/slimesoup
	reagents = list(/datum/reagent/water = 10, /datum/reagent/slimejelly = 5)
	items = list()
	result = /obj/item/weapon/reagent_containers/food/snacks/slimesoup

/datum/recipe/cooked/boiledslimeextract
	reagents = list(/datum/reagent/water = 10)
	items = list(
		/obj/item/slime_extract,
	)
	result = /obj/item/weapon/reagent_containers/food/snacks/boiledslimecore

/datum/recipe/cooked/chocolateegg
	items = list(
		/obj/item/weapon/reagent_containers/food/snacks/egg,
		/obj/item/weapon/reagent_containers/food/snacks/chocolatebar,
	)
	result = /obj/item/weapon/reagent_containers/food/snacks/chocolateegg

/datum/recipe/cooked/sausage
	items = list(
		/obj/item/weapon/reagent_containers/food/snacks/rawmeatball,
		/obj/item/weapon/reagent_containers/food/snacks/rawcutlet,
	)
	result = /obj/item/weapon/reagent_containers/food/snacks/sausage

/datum/recipe/cooked/fatsausage
	reagents = list(/datum/reagent/blackpepper = 2)
	items = list(
		/obj/item/weapon/reagent_containers/food/snacks/rawmeatball,
		/obj/item/weapon/reagent_containers/food/snacks/rawcutlet,
	)
	result = /obj/item/weapon/reagent_containers/food/snacks/fatsausage

/datum/recipe/cooked/fishfingers
	reagents = list(/datum/reagent/nutriment/flour = 10)
	items = list(
		/obj/item/weapon/reagent_containers/food/snacks/egg,
		/obj/item/weapon/reagent_containers/food/snacks/fish
	)
	result = /obj/item/weapon/reagent_containers/food/snacks/fishfingers

/datum/recipe/cooked/mysterysoup
	reagents = list(/datum/reagent/water = 10)
	items = list(
		/obj/item/weapon/reagent_containers/food/snacks/badrecipe,
		/obj/item/weapon/reagent_containers/food/snacks/tofu,
		/obj/item/weapon/reagent_containers/food/snacks/egg,
		/obj/item/weapon/reagent_containers/food/snacks/cheesewedge,
	)
	result = /obj/item/weapon/reagent_containers/food/snacks/mysterysoup

/datum/recipe/cooked/pumpkinpie
	fruit = list("pumpkin" = 1)
	reagents = list(/datum/reagent/sugar = 5)
	items = list(/obj/item/weapon/reagent_containers/food/snacks/sliceable/flatdough)
	result = /obj/item/weapon/reagent_containers/food/snacks/sliceable/pumpkinpie

/datum/recipe/cooked/plumphelmetbiscuit
	fruit = list("plumphelmet" = 1)
	reagents = list(/datum/reagent/nutriment/batter = 10)
	result = /obj/item/weapon/reagent_containers/food/snacks/plumphelmetbiscuit

/datum/recipe/cooked/plumphelmetbiscuitvegan
	fruit = list("plumphelmet" = 1)
	reagents = list(/datum/reagent/nutriment/flour = 10, /datum/reagent/water = 10)
	result = /obj/item/weapon/reagent_containers/food/snacks/plumphelmetbiscuit

/datum/recipe/cooked/mushroomsoup
	fruit = list("mushroom" = 1)
	reagents = list(/datum/reagent/drink/milk = 10)
	result = /obj/item/weapon/reagent_containers/food/snacks/mushroomsoup

/datum/recipe/cooked/chawanmushi
	fruit = list("mushroom" = 1)
	reagents = list(/datum/reagent/water = 10, /datum/reagent/nutriment/soysauce = 5)
	items = list(
		/obj/item/weapon/reagent_containers/food/snacks/egg,
		/obj/item/weapon/reagent_containers/food/snacks/egg
	)
	result = /obj/item/weapon/reagent_containers/food/snacks/chawanmushi

/datum/recipe/cooked/beetsoup
	fruit = list("whitebeet" = 1, "cabbage" = 1)
	reagents = list(/datum/reagent/water = 10)
	result = /obj/item/weapon/reagent_containers/food/snacks/beetsoup

/datum/recipe/cooked/appletart
	fruit = list("goldapple" = 1)
	items = list(/obj/item/weapon/reagent_containers/food/snacks/sliceable/flatdough)
	result = /obj/item/weapon/reagent_containers/food/snacks/appletart

/datum/recipe/cooked/tossedsalad
	fruit = list("cabbage" = 2, "tomato" = 1, "carrot" = 1, "apple" = 1)
	result = /obj/item/weapon/reagent_containers/food/snacks/tossedsalad

/datum/recipe/cooked/aesirsalad
	fruit = list("goldapple" = 1, "ambrosiadeus" = 1)
	result = /obj/item/weapon/reagent_containers/food/snacks/aesirsalad

/datum/recipe/cooked/validsalad
	fruit = list("potato" = 1, "ambrosia" = 3)
	items = list(/obj/item/weapon/reagent_containers/food/snacks/meatball)
	result = /obj/item/weapon/reagent_containers/food/snacks/validsalad
	make_food(var/obj/container as obj)
		var/obj/item/weapon/reagent_containers/food/snacks/validsalad/being_cooked = ..(container)
		being_cooked.reagents.del_reagent(/datum/reagent/toxin)
		return being_cooked

/datum/recipe/cooked/cracker
	reagents = list(/datum/reagent/sodiumchloride = 1)
	items = list(
		/obj/item/weapon/reagent_containers/food/snacks/doughslice
	)
	result = /obj/item/weapon/reagent_containers/food/snacks/cracker

/datum/recipe/cooked/stuffing
	reagents = list(/datum/reagent/water = 10, /datum/reagent/sodiumchloride = 1, /datum/reagent/blackpepper = 1)
	items = list(
		/obj/item/weapon/reagent_containers/food/snacks/sliceable/bread,
	)
	result = /obj/item/weapon/reagent_containers/food/snacks/stuffing

/datum/recipe/cooked/tofurkey
	items = list(
		/obj/item/weapon/reagent_containers/food/snacks/tofu,
		/obj/item/weapon/reagent_containers/food/snacks/tofu,
		/obj/item/weapon/reagent_containers/food/snacks/stuffing,
	)
	result = /obj/item/weapon/reagent_containers/food/snacks/tofurkey

// Fuck Science!
/datum/recipe/cooked/ruinedvirusdish
	items = list(
		/obj/item/weapon/virusdish
	)
	result = /obj/item/weapon/ruinedvirusdish

//////////////////////////////////////////
// bs12 food port stuff
//////////////////////////////////////////

/datum/recipe/cooked/taco
	items = list(
		/obj/item/weapon/reagent_containers/food/snacks/doughslice,
		/obj/item/weapon/reagent_containers/food/snacks/cutlet,
		/obj/item/weapon/reagent_containers/food/snacks/cheesewedge
	)
	result = /obj/item/weapon/reagent_containers/food/snacks/taco

/datum/recipe/cooked/bun
	items = list(
		/obj/item/weapon/reagent_containers/food/snacks/dough
	)
	result = /obj/item/weapon/reagent_containers/food/snacks/bun

/datum/recipe/cooked/flatbread
	items = list(
		/obj/item/weapon/reagent_containers/food/snacks/sliceable/flatdough
	)
	result = /obj/item/weapon/reagent_containers/food/snacks/flatbread

/datum/recipe/cooked/meatball
	items = list(
		/obj/item/weapon/reagent_containers/food/snacks/rawmeatball
	)
	result = /obj/item/weapon/reagent_containers/food/snacks/meatball

/datum/recipe/cooked/cutlet
	items = list(
		/obj/item/weapon/reagent_containers/food/snacks/rawcutlet
	)
	result = /obj/item/weapon/reagent_containers/food/snacks/cutlet

/datum/recipe/cooked/fries
	items = list(
		/obj/item/weapon/reagent_containers/food/snacks/rawsticks
	)
	result = /obj/item/weapon/reagent_containers/food/snacks/fries

/datum/recipe/cooked/onionrings
	fruit = list("onion" = 1)
	reagents = list(/datum/reagent/nutriment/batter = 10)
	result = /obj/item/weapon/reagent_containers/food/snacks/onionrings

/datum/recipe/cooked/mint
	reagents = list(/datum/reagent/sugar = 5, /datum/reagent/frostoil = 5)
	result = /obj/item/weapon/reagent_containers/food/snacks/mint

// Cakes.
/datum/recipe/cooked/cake
	reagents = list(/datum/reagent/nutriment/batter/cakebatter = 60)
	result = /obj/item/weapon/reagent_containers/food/snacks/sliceable/plaincake

/datum/recipe/cooked/cake/carrot
	fruit = list("carrot" = 3)
	result = /obj/item/weapon/reagent_containers/food/snacks/sliceable/carrotcake

/datum/recipe/cooked/cake/cheese
	items = list(
		/obj/item/weapon/reagent_containers/food/snacks/cheesewedge,
		/obj/item/weapon/reagent_containers/food/snacks/cheesewedge
	)
	result = /obj/item/weapon/reagent_containers/food/snacks/sliceable/cheesecake

/datum/recipe/cooked/cake/orange
	fruit = list("orange" = 1)
	result = /obj/item/weapon/reagent_containers/food/snacks/sliceable/orangecake

/datum/recipe/cooked/cake/lime
	fruit = list("lime" = 1)
	result = /obj/item/weapon/reagent_containers/food/snacks/sliceable/limecake

/datum/recipe/cooked/cake/lemon
	fruit = list("lemon" = 1)
	result = /obj/item/weapon/reagent_containers/food/snacks/sliceable/lemoncake

/datum/recipe/cooked/cake/chocolate
	items = list(/obj/item/weapon/reagent_containers/food/snacks/chocolatebar)
	result = /obj/item/weapon/reagent_containers/food/snacks/sliceable/chocolatecake

//datum/recipe/cooked/cake/birthday
//	items = list(/obj/item/clothing/head/cakehat)
//	result = /obj/item/weapon/reagent_containers/food/snacks/sliceable/birthdaycake

/datum/recipe/cooked/cake/birthday
	reagents = list(/datum/reagent/nutriment/sprinkles = 10)
	result = /obj/item/weapon/reagent_containers/food/snacks/sliceable/birthdaycake

/datum/recipe/cooked/cake/apple
	fruit = list("apple" = 2)
	result = /obj/item/weapon/reagent_containers/food/snacks/sliceable/applecake

/datum/recipe/cooked/cake/brain
	items = list(/obj/item/organ/internal/brain)
	result = /obj/item/weapon/reagent_containers/food/snacks/sliceable/braincake

/datum/recipe/cooked/cake/chocolatebar
	reagents = list(/datum/reagent/drink/milk/chocolate = 10, /datum/reagent/nutriment/coco = 5, /datum/reagent/sugar = 5)
	result = /obj/item/weapon/reagent_containers/food/snacks/chocolatebar

/datum/recipe/cooked/boiledspiderleg
	reagents = list(/datum/reagent/water = 10)
	items = list(
		/obj/item/weapon/reagent_containers/food/snacks/spider
	)
	result = /obj/item/weapon/reagent_containers/food/snacks/spider/cooked