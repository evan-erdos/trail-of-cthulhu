
#include <adv3.h>
#include <en_us.h>
#include "macros.h"


root : Room
'room' 'your room'
"""
It's a standard-issue dwelling:
theres random furniture crammed into all sorts of odd angles,
and the effects of a roommate you haven't seen in months,
not including his wallet, unfortunately.
""" {
    out = metal_door_0;
    west asExit(out);
}

+ drafting_table : Surface, Fixture
'desk/desks/table/surface' 'desk'
"""
You've been using this old-style drafting table as a desk for as long as you've needed a desk.
It's edged with a dented but sturdy aluminum frame.
It has a hefty steel pivot, its arc stretching 135° or more.
Four triangularly trussed legs extend to spherical rubber feet which match perfectly your dented floor.
""";

