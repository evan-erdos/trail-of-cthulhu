
#include <adv3.h>
#include <en_us.h>
#include "macros.h"

soviet_troops : Mortal
'soviet/russian troop*troops/soviets/russians/soldiers/men'
'Soviet Troops' @observatory_catwalk
"""
The troops look menacing, and they are all carrying assault weapons.
""" {
    isPlural = true;
}

+ NPCWorn '(assault) gun/rifle/weapon*rifles/guns/weapons'
'Assault Rifles'
"""
They're the most efficient tools of death around.
""" {
    isListed = (!isIn(soviet_troops));
}
