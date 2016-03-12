
#include <adv3.h>
#include <en_us.h>
#include "macros.h"

birchwell : Person
'professor/cameron birchwell/prof/professor'
'Professor Birchwell' @observatory_atrium
"""
He looks thinner than he did the last time you saw him.
He's scribbling away madly at his desk.
""" {
    isProperName = true;
    properName = 'Professor Cameron T. Birchwell';
    isHim = true;
    globalParamName = 'birchwell';

    initSpecialDesc { isInInitState = null;
        """
        As you enter, you notice Professor Birchwell, sitting alone at a desk.
        <br>
        You stand quietly in the doorway, he hasn't noticed you yet.
        """;
    }

    specialDesc { birchwell_list.doScript(); }
}

birchwell_list : ShuffledEventList, RandomFiringScript
['''
The professor gets up from his desk, and begins to pace around.
''','''
The professor stares up towards the stars, lost in thought.
''','''
He looks back at the telescope.
''','''
He sits down at his desk, and begins to write.
''']['''
The professor continues scrawling away.
''','''
The professor leans up from his work for a moment, but then continues writing.
''']
eventPercent = 80;


birchwell_init : PreinitObject {
    execute() {
        birchwell.setKnowsAbout(soviet_troops);
    }
}





