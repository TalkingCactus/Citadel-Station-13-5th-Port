////////////
//CONTENTS//
////////////
//
//CANDY CORN GUNS
//
//MICROS SHOOTING GUNS
//
///////
//END//
///////


/obj/item/weapon/gun/projectile/automatic/candycorn
	name = "candy-corn SMG"
	desc = "Hailing from planet Mars, this deadly combination of delicious and deadly will make everyone think twice about messing with you."
	icon = 'code/cactus/obj/obj.dmi'
	icon_state = "candy"
	origin_tech = "combat=1;materials=1"
	w_class = 3
	mag_type = /obj/item/ammo_box/magazine/candycorn
	can_suppress = 1
	burst_size = 2
	fire_delay = 2
	action_button_name = "Toggle Firemode"
	fire_sound = 'code/cactus/sound/pew2.ogg'
	can_suppress = 0

/obj/item/weapon/gun/projectile/automatic/wt550/update_icon()
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
	stamina = 1
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

////////////////////////
//MICROS SHOOTING GUNS//
////////////////////////

/obj/item/weapon/gun/projectile/shoot_live_shot(mob/living/user as mob|obj, pointblank = 0, mob/pbtarget = null, message = 1)
	..()
	if(user.sizeplay_size == 1)
		if(user.get_active_hand() == src)
			user.Weaken(3)
			user.visible_message("<span class='danger'>[user] is knocked over by the recoil of [src]!</span>", "<span class='userdanger'>The recoil knocks you over!</span>")
			if(heavy_weapon)
				user.take_organ_damage(10)

/obj/item/weapon/gun/projectile/shotgun/shoot_live_shot(mob/living/user as mob|obj, pointblank = 0, mob/pbtarget = null, message = 1)
	..()
	if(user.sizeplay_size == 1)
		if(user.get_active_hand() == src)
			user.Weaken(3)
			user.visible_message("<span class='danger'>[user] is knocked over by the recoil of [src]!</span>", "<span class='userdanger'>The recoil knocks you over!</span>")
			user.take_organ_damage(5)
			if(heavy_weapon)
				user.take_organ_damage(10)
/////////////
//M1 GARAND//
/////////////

/obj/item/weapon/gun/projectile/automatic/m1garand
	name = "\improper M1 Garand"
	desc = "You're pretty sure this thing isn't an original."
	icon_state = "m1garand"
	item_state = "moistnugget"
	origin_tech = "combat=3;materials=3"
	mag_type = /obj/item/ammo_box/magazine/m3006
	burst_size = 1
	fire_sound = 'sound/weapons/sniper.ogg'
	eject_mag = 1
	action_button_name = null
/obj/item/weapon/gun/projectile/automatic/m1garand/update_icon()
	..()
	icon_state = "m1garand"
	if(zoomable)
		icon_state = "m1garand-scoped"

//obj/item/weapon/gun/projectile/automatic/m1garand/proc/eject_clip
//	if(magazine &&

/obj/item/weapon/gun/projectile/automatic/m1garand/scoped
	name = "scoped M1 Garand"
	icon_state = "m1garand-scoped"
	desc = "You're pretty sure this thing isn't an original. There's some sort of optical enhancement apparatus on top."
	zoomable = TRUE
	zoom_amt = 7

/obj/item/projectile/bullet/b3006
	damage = 35

/obj/item/ammo_casing/c3006
	desc = "A .30-06 bullet casing."
	caliber = ".30-06"
	icon_state = "762-casing"
	projectile_type = /obj/item/projectile/bullet/b3006

/obj/item/ammo_box/magazine/m3006
	name = ".30-06 rifle clip"
	icon_state = "3006"
	origin_tech = "combat=2"
	ammo_type = /obj/item/ammo_casing/c3006
	caliber = ".30-06"
	max_ammo = 8

/obj/item/ammo_box/magazine/m3006/update_icon()
	..()
	icon_state = "3006-[ammo_count() ? "8" : "0"]"