
#include <adv3.h>
#include <en_us.h>
#include "macros.h"
#pragma newline_spacing(preserve)


birchwell_writing : ConversationReadyState @birchwell {
    inConvState = birchwell_talking;
    isInitState = true;
    specialDesc { birchwell_list.doScript(); }
    stateDesc =
        """
        The professor scribbles away at his desk.
        """;
}

+ HelloTopic, StopEventList
['''
"Professor..." you say.
<br>
He puts down his pen, and turns to you.
<br>
"What are you doing here?" he intones.
<br>
<<birchwell.setKnowsAbout(gPlayerChar)>>
<<birchwell.initiateTopic(location)>>
''','''
"Hello, professor."
<br>
He puts down his pen again.
<br>
"Yes, <<user.firstname>>?"
''','''
"Hi, professor."
<br>
He stops writing for a moment.
<br>
"I tire of this, <<user.firstname>>."
''','''
You attempt to get the professor's attention again,
but he just continues to write.
'''];

+ ImpHelloTopic, ShuffledEventList
['''
The professor, somehow, notices your presence.
He puts down his pen, and turns to you.
<br>
"What are you doing here?" he intones.

<<birchwell.setKnowsAbout(gPlayerChar)>>
<<birchwell.initiateTopic(location)>>
''','''
The professor notices you again.
<br>
"I ask again, <<user.firstname>>, what are you doing here?"
''']['''
The professor glances up at you from his desk.
''','''
The professor is still writing, but you're sure he know's you're here.
''','''
The professor watches you, quietly.
'''];

+ ByeTopic
"""
"They will find you if you leave, <<user.firstname>>."
""";

+ ImpByeTopic
"""
"Going somewhere, <<user.firstname>>?"
""";


birchwell_talking : InConversationState @birchwell {
    specialDesc =
        """
        He stares at you intensely. It's unnerving.
        """;
    stateDesc =
        """
        You're speaking with Professor Birchwell. It feels like he's staring right through you.
        """;
}

+ AskTellTopic, SuggestedAskTopic @soviet_troops
"""
"We saw you speaking to some Soviet troops earlier." you say.

The professor becomes visibly angry with you.

"Since you know <i>so</i> much already, I take it you won't have any questions for them when they arrive?"

"What? You--"

<<birchwell.setCurState(birchwell_angry)>>
<.convnode>
""" { fullName = 'ask him about the soviet troops you saw him with' }

+ ConvNode 'confront';

++ SpecialTopic '''tell him you're researching'''
'research(ing)?|learn(ing)?'
"""
"I'm... doing research, professor."

He gives you a momentary, skeptical look.

"...very well," he replies, seemingly unconcerned.

"What is it that you're here researching then, <<user.firstname>>?"
""";

++ SpecialTopic 'leave, very quickly'
'leav(e|ing)'
"""
<br>
"Why are... you still here, <<user.firstname>>?" the professor intones.
<br>
"You know, sir, that's a great point, so I'll just be on my way now, sorry to bother!" You begin to run away.
<<birchwell.setCurState(birchwell_angry)>>
<<gPlayerChar.scriptedTravelTo(root)>>
""";

