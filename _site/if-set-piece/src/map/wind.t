
#include <adv3.h>
#include <en_us.h>
#include "macros.h"


/** `wind` : **`Noise`**
 *
 * This represents the wind near the Observatory.
 **/
wind : MultiLoc, Noise
[observatory_atrium, observatory_catwalk]
'(blowing) whistling wind/air/gust*winds/gusts'
'wind'
"""
It's windy out tonight.
""" {
    speed = 2;
}

