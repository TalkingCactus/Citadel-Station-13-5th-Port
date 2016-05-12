////////////
//CONTENTS//
////////////
//
//CANDY CORN SMG
//
//CANDY CORN REVOLVER
//
///////
//END//
///////

//CC SMG
/obj/item/weapon/gun/projectile/automatic/candycorn
	name = "candy corn SMG"
	desc = "Hailing from planet Mars, this deadly combination of delicious and deadly will make everyone think twice about messing with you."
	icon = 'code/cactus/obj/obj.dmi'
	icon_state = "candy"
	origin_tech = "combat=1;materials=1"
	w_class = 3
	mag_type = /obj/item/ammo_box/magazine/candycorn
	burst_size = 2
	fire_delay = 2
	action_button_name = "Toggle Firemode"
	fire_sound = 'code/cactus/sound/pew2.ogg'
	can_suppress = 0
	needs_permit = 0

/obj/item/weapon/gun/projectile/automatic/candycorn/update_icon()
	..()
	icon_state = "candy[magazine ? "-[Ceiling(get_ammo(0)/2)*2]" : ""]"
	return

/obj/item/ammo_casing/candycorn
	name = "candy-corn cartridge"
	desc = "Is this edible, too?"
	fire_sound = 'code/cactus/sound/pew2.ogg'
	caliber = "candy"
	projectile_type = /obj/item/projectile/candycorn

/obj/item/projectile/candycorn
	name = "candy corn"
	damage = 0
	stamina = 5
	icon_state = "ccorn"

/obj/item/projectile/candycorn/on_hit(atom/target, blocked = 0, hit_zone)
	new /obj/item/weapon/reagent_containers/food/snacks/candy_corn(get_turf(src))
	..()


/obj/item/ammo_box/magazine/candycorn
	name = "candy corn magazine"
	icon_state = "oldrifle"
	origin_tech = "combat=1"
	ammo_type = /obj/item/ammo_casing/candycorn
	caliber = "candy"
	max_ammo = 20
	multiple_sprites = 2

//CC REVOLVER

/obj/item/weapon/gun/projectile/revolver/candycorn
	name = "candy corn revolver"
	desc = "Hailing from planet Mars, this stylish shooter is sure to fix (or break) that sweet tooth."
	icon = 'code/cactus/obj/obj.dmi'
	icon_state = "candyrev"
	origin_tech = "combat=1;materials=1"
	mag_type = /obj/item/ammo_box/magazine/internal/cylinder/candycorn
	needs_permit = 0

/obj/item/ammo_box/magazine/internal/cylinder/candycorn
	icon = 'code/cactus/obj/obj.dmi'
	icon_state = "candysl"
	name = "candy corn revolver cylinder"
	ammo_type = /obj/item/ammo_casing/candycorn
	caliber = "candy"
	max_ammo = 6
