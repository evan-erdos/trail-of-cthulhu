
#include <adv3.h>
#include <en_us.h>
#include "macros.h"


observatory_atrium : AreaRoom -> observatory 'Atrium'
"""
You stand underneath a grand optical telescope,
aimed up into the night sky.
""" {
    west = observatory_catwalk;
    east = metal_door_1;
}

+ observatory_desk : Surface, Fixture, Heavy 'desk/table'
'desk'
"""
The desk is of plain wooden construction, and is littered with books,
magnifying glasses, fountain pens, and mounds of paper.
""";

+ metal_door_1 : AutoClosingDoor -> metal_door_0
'(metal) portal/porthole/exit/door*doors' 'door'
"""
The door to the outside of the Obseratory is here.
""" {

    specialDescOrder = 50;

    reportAutoClose { "The metal door creaks shut behind you. "; };
}

+ observatory_telescope : Heavy, Fixture, MultiLoc
[observatory_atrium, observatory_catwalk]
'tele/telescope/scope/eye/lens'
'Dioptric Telescope'
"""
A grand, refracting telescope is the centerpiece of this Observatory.
It creaks as it rotates on its pivot, but is otherwise solid.
""" {
    isCalibrated = null;

    dobjFor(LookIn) {
        action() {
            """
            You peer into the telescope.
            """;
            if (isCalibrated)
                """
                You can see a blinking object amongst the stars.
                """;
            else "You don't see anything.";
        }
    }
}

++ telescope_eyepiece : Component, SenseConnector
'(glass) eye/eyepiece/lens'
'telescope eyepiece'
"""
The eyepiece is small, and has a rubber pad around its edge.
You could see where the telescope is pointed through it.
""" {
    connectorMaterial = glass;
}



