
#include <adv3.h>
#include <en_us.h>
#include "macros.h"
#pragma newline_spacing(preserve)


birchwell_afraid : ActorState @birchwell
"""
He now appears to be twitching a bit.
""" {
    specialDesc =
        """
       	The professor has a look of terror, frozen on his face.
        <<birchwell_list.doScript()>>.
        """;
}

+ DefaultAnyTopic
"""
<<birchwell_afraid_list.doScript()>>
He looks horrified.
<br>
You should probably leave him alone.
""";

birchwell_afraid_list : ShuffledEventList
['''
The professor whimpers at you.
''']['''
The professor avoids eye contact.
''','''
You try to speak to him, but he just whimpers, and turns his back a little. It's a pitiful sight. He's quite scared.
'''];

