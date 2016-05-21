
/////////////
//WINDBLADE//
/////////////

/obj/item/weapon/katana/windblade
	name = "wind blade"
	desc = "Go with the flow."
	icon = 'code/cactus/obj/obj.dmi'
	icon_state = "windblade"
	item_state = "windblade"
	flags = CONDUCT
	slot_flags = SLOT_BELT | SLOT_BACK
	force = 19
	throwforce = 14
	w_class = 4
	hitsound = 'sound/weapons/bladeslice.ogg'
	attack_verb = list("attacked", "slashed", "stabbed", "sliced", "torn", "ripped", "diced", "cut")
	var/streak = 0
	var/phrase1 = list("Ton!", "Hasag!")
	var/phrase2 = list("Hasagi!", "Aseryo!")
	var/cooldown_time = 3
	var/cooldown = 0
	var/dashing = 0

/obj/item/weapon/katana/windblade/attack(mob/target, mob/living/user)
	var/aura = image('code/cactus/obj/obj.dmi', loc = src, icon_state = "[src.icon_state]_aura")
	if(streak == 0)
		overlays += aura
		force = 19
		armour_penetration = 0
		..()
		streak++
	else if(streak == 1)
		user.say(pick(phrase1))
		force = 21
		armour_penetration = 30
		..()
		streak++
		user << "Throw [src] to cast steel tempest!"

/obj/item/weapon/katana/windblade/throw_at(atom/target,throw_range, throw_speed, mob/user)
	if(streak >= 2)
		steel_tempest(target, user)
	else
		..()


/obj/item/weapon/katana/windblade/proc/steel_tempest(atom/target, mob/living/user)
	streak = 0
	overlays = list(null)
	user.say(pick(phrase2))

/obj/item/weapon/katana/windblade/proc/dash(mob/user)
	if(cooldown)
		return 0
	visible_message("<span class='notice'>[user] dashes forward!</span>", \
				"<span class='notice'>You dash forward!</span>", \
				"<span class='italics'>You hear wind...</span>")
	playsound(get_turf(src), 'code/cactus/sound/swish1.ogg', 100, 1)
	dashing = 1
	walk(user, user.dir, 0, -1)
	cooldown = 1
	spawn(5)
		walk(user,0)
		dashing = 0
	spawn(25)
		cooldown = 0

/obj/item/weapon/katana/windblade/attack_self(mob/user)
	dash(user)


/obj/effect/proc_holder/spell/targeted/projectile/whirlwind
	name = "whirlwind"
	desc = "This spell summons whirlwinds to blow away your enemies."

/obj/effect/proc_holder/spell/targeted/projectile/whirlwind/cast(list/targets)

/obj/effect/proc_holder/spell/targeted/inflict_handler/whirlwind
	amt_weakened = 2
	sound = "sound/magic/MM_Hit.ogg"

/obj/item/projectile/magic/whirlwind
	icon = 'code/cactus/obj/obj.dmi'
	icon_state = "whirlwind"
	damage = 15
	nodamage = 0

/*
	add_fingerprint(user)
	if((CLUMSY in user.disabilities) && prob(50))
		user << "<span class ='warning'>You club yourself over the head with [src].</span>"
		user.Weaken(3)
		if(ishuman(user))
			var/mob/living/carbon/human/H = user
			H.apply_damage(2*force, BRUTE, "head")
		else
			user.take_organ_damage(2*force)
		return
	if(isrobot(target))
		return ..()
	if(!isliving(target))
		return ..()
	var/mob/living/carbon/C = target
	if(C.stat)
		user << "<span class='warning'>It would be dishonorable to attack a foe while they cannot retaliate.</span>"
		return
	switch(user.a_intent)
		if("disarm")
			if(!wielded)
				return ..()
			if(!ishuman(target))
				return ..()
			var/mob/living/carbon/human/H = target
			var/list/fluffmessages = list("[user] clubs [H] with [src]!", \
										  "[user] smacks [H] with the butt of [src]!", \
										  "[user] broadsides [H] with [src]!", \
										  "[user] smashes [H]'s head with [src]!", \
										  "[user] beats [H] with front of [src]!", \
										  "[user] twirls and slams [H] with [src]!")
			H.visible_message("<span class='warning'>[pick(fluffmessages)]</span>", \
								   "<span class='userdanger'>[pick(fluffmessages)]</span>")
			playsound(get_turf(user), 'sound/effects/woodhit.ogg', 75, 1, -1)
			H.adjustStaminaLoss(rand(13,20))
			if(prob(10))
				H.visible_message("<span class='warning'>[H] collapses!</span>", \
									   "<span class='userdanger'>Your legs give out!</span>")
				H.Weaken(4)
			if(H.staminaloss && !H.sleeping)
				var/total_health = (H.health - H.staminaloss)
				if(total_health <= config.health_threshold_crit && !H.stat)
					H.visible_message("<span class='warning'>[user] delivers a heavy hit to [H]'s head, knocking them out cold!</span>", \
										   "<span class='userdanger'>[user] knocks you unconscious!</span>")
					H.sleeping += 30
					H.adjustBrainLoss(25)
			return
		else
			return ..()
	return ..()
*/