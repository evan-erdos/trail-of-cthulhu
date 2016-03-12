
#include <adv3.h>
#include <en_us.h>
#include "macros.h"
#pragma newline_spacing(preserve)


birchwell_neutral : ActorState @birchwell {

}

+ DefaultAskTopic, ShuffledEventList
['''
He doesn't seem like he's here. He stares right through you.
''','''
You realize the professor is staring at something behind you.
'''];

+ DefaultTellTopic, ShuffledEventList
['''
"Yes..."

The professor doesn't appear to have any idea what you said.
'''];

+ ByeTopic
"""
"Goodbye, professor." you say.

He gives no response.
""";

+ ImpByeTopic
"""
The professor doesn't notice you leave.
""";

