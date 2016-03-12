
#include <adv3.h>
#include <en_us.h>
#include "macros.h"
#pragma newline_spacing(preserve)


birchwell_angry : ActorState @birchwell {
    specialDesc { birchwell_angry_list.doScript(); }
}

+ DefaultAnyTopic
"""
Professor Birchwell's expression is a fixed glare.
""";//<<gPlayerChar.scriptedTravelTo(root)>>

birchwell_angry_list : ShuffledEventList
['''
The professor glowers at you.
''','''
The professor looks over his shoulder very quickly.
You didn't see anything unusual there.
''','''
The professor looks down at his notes for a moment,
but then resumes staring at you, angrily.
''','''
He unclenches his fists, but still appears to be quite cross with you.
''']['''
The professor stares at the floor, still scowling.
''','''
The professor leans up from his work for a moment, but then continues writing.
'''];
