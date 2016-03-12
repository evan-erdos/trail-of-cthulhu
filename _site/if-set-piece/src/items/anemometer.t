
#include <adv3.h>
#include <en_us.h>
#include "macros.h"


/** `anemometer` : **`MultiLoc`**
 *
 * This is the Observatory's anemometer.
 **/
anemometer : MultiLoc, Fixture, Readable
[observatory_atrium, observatory_catwalk]
'(spinning) wind anemometer/weather vane/meter*meters'
'anemometer'
"""
The Observatory's anemometer is affixed to the outside of the canopy,
but you can see it through the aperature.
""" {

    readDesc {
        switch (wind.speed) {
            case 0:
                """
                The anemometer hangs limply from the canopy.
                There's little to no wind.
                """;
                break;
            case 1:
                """
                A gust of wind catches the anemometer now and then.
                Otherwise, it's pretty dead up there.
                """;
                break;
            case 2:
                """
                There's a small amount of wind.
                The anemometer spins loosely on its mount.
                """;
                break;
            case 3:
                """
                The anemometer keeps a fairly regular tempo.
                You would imagine it's somewhat gusty up there.
                """;
                break;
            case 4:
                """
                The anemometer is spinning quite rapidly.
                You can hear the wind whistling from here.
                """;
                break;
        }
    }
}

