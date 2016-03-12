
#include <adv3.h>
#include <en_us.h>
#include "macros.h"

observatory : Area 'Observatory'
['''
The wrought iron trusses of the Observatory's canopy creak in the wind.
''','''
The wind whistles quietly as it blows into the open aperature.
''']
"""
The canopy of the Observatory looms over you.
""";

observatory_entrance : AreaRoom -> observatory 'Entrance'
"""
This is the entrance to the Observatory.
There's a door leading outside, and a door which leads to the Atrium.
""" {
	out = metal_door_0;
	west = asExit(out);
}

+ metal_door_0 : AutoClosingDoor {
    reportAutoClose { "You close the metal door behind you as you leave. "; };
    desc { "The door leads out. "; }
    name = 'Door to the Observatory.';
    vocabWords = 'door/doors/portal/porthole/exit';
}

observatory_catwalk : AreaRoom -> observatory 'Catwalk'
"""
Corrugated metal catwalks squeak underfoot.
""" {
    east = observatory_atrium;
}







