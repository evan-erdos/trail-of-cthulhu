
#include <adv3.h>
#include <en_us.h>
#include "macros.h"
#pragma newline_spacing(preserve)


class Mortal : Person {
    maxHealth = 16;
    health = 16;
    isDead = null;
    strength = 9;
    swing = 9;
    dodge = 5;
    weapon_damage = 1;

    Harm(n) { /* virtual */ }

    attackDamage() { return self.strength+weapon_damage; }
}

class NPCWorn : Wearable {
    wornBy = (location);
    hideFromAll(action) { return true; }
}

class Group : Mortal { isPlural = true; isIt = true; }

