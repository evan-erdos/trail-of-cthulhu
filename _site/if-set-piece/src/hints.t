
#include <adv3.h>
#include <en_us.h>
#include "macros.h"
#pragma newline_spacing(preserve)


TopHintMenu 'Hints';

+ HintMenu 'General Questions';

++ StaticGoal 'How do I even'
['''
First text adventure, huh?
''','''
Yeah, it figures. It might be helpful to read over the <b>Basic Commands</b> section.
''','''
If you sort-of know what you're doing, maybe pore over <b>Command Aliases</b> for some game-specific commands you might not know.
''','''
There aren't a lot of special formats here, but it is important to note that the bolded and caps-locked texts represent commands that you might enter.
''','''
Additionally, the listed commands are just the most common usages: usually, if you're close enough, the parser will understand.
'''];

++ HintMenu 'Commands';

+++ StaticGoal 'Basic Commands'
['''
Lots of things can be accomplished with a single word. You can:
- <b>LOOK</b>
- <b>WAIT</b>
- <b>DANCE</b>

Well, really, you can <i>try</i> to do anything, but you'll be able to look and wait, among other things.
''','''
The most common commands are abbreviated to a single letter, e.g., <b>L</b> will look around the room. Instead of typing <b>GO NORTHWEST</b>, you could simply type <b>NW</b>.
'''];

+++ StaticGoal 'Direct-Object Commands'
['''
<b>Direct-Object Commands</b> are quite common, given the number of verbs that are used with objects. One might reasonably expect to be able to <b>GET LAMP</b> or <b>READ THE BOOK</b>, and you usually can. A list of such verbs can be found elsewhere in this menu.
'''];

+++ StaticGoal 'Indirect-Object Commands'
['''
Even more complicated are <b>Indirect-Object Commands</b>, which allows you to use such fancy lexical acrobatics as:
- <b>UNLOCK THE DOOR WITH THEY KEY</b>
- <b>PUT THE LOTION IN THE BASKET</b>
- whatever else your imagination is capable of

In these ways, you can use objects on other objects, put such-and-such on top of this-or-that, etc.
''','''
Additionally, you can string commands together with periods or writing <b>AND</b> between two other valid commands. A quick way to travel through places you've already been would be to type <b>W. N. SW. NW. W</b>, if indeed you wanted to go west, then north then southwest then northwest then west again.
'''];

+++ HintMenu 'List of Commands';

++++ StaticGoal 'Command Aliases'
['Look Around: <b>L</b>',
 'Examine: <b>X</b>',
 'Wait: <b>Z</b>',
 'Tell About: <b>T</b>',
 'Inventory: <b>I</b>',
 'Quit Game: <b>Q</b>'];

++++ StaticGoal 'Directional Commands'
['Go East: <b>E</b>',
 'Go Northeast: <b>NE</b>',
 'Go North: <b>N</b>',
 'Go Northwest: <b>NW</b>',
 'Go West: <b>W</b>',
 'Go Southwest: <b>SW</b>',
 'Go South: <b>S</b>',
 'Go Southeast: <b>SE</b>',
 'Go Down: <b>D</b>',
 'Go Up: <b>U</b>',
 'Go In: <b>IN</b>',
 'Go Out: <b>OUT</b>'];

+ HintMenu 'Observatory';

++ StaticGoal -> (some.achievement)
'How do I win the game?'
['''
Try the magical portal.
''','''
Oh, there is no magical portal? My mistake.
That won't work at all, then.
''','''
If I were you, I'd assess the situation.
A good question to ask might be:
> <i>Who am I?</i>
''','''
Who is <i>anyone</i>, really, in the larger scheme of things?
''','''
The answer is "don't think about it".
''','''
<i>What should I be doing?</i>
''','''
Finally, a good question.
You've got to get that book back from the professor.
'''];

some : object {
    achievement : Achievement { +3 "Amazing!" };
}

