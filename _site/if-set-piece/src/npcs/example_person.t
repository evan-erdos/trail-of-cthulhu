
#include <adv3.h>
#include <en_us.h>
#include "macros.h"
#pragma newline_spacing(preserve)


/** `example_person` : **`Person`**
 *
 * An object definition (don't objectify me!) like this can be
 * thought of as a new instance of its base class. This is an
 * instance of yours truly. This is an unusual concept, as a
 * program or programming language usually separates 'code' and
 * 'data' in a more rigorous way, but in TADS3, it's almost the
 * same thing, and the loose structure allows for it.
 *
 * - `vocabWords` : **`regex`**
 *     I'm not sure if these are real `regex`es, but they are
 *     patterns that the interpreter attempts to match against
 *     user input to determine if it's being referred to.
 *
 * - `name` : **`string`**
 *     The printed title of this object. Mine's bold. I might
 *     even color it all funny, who knows?
 *
 * - `location` : **`Room`**
 *     It's S&P to use the `@location` syntax instead of `+`
 *     for anything which has a tendency to move about. In the
 *     case of static scenery, or things which cannot move, the
 *     `+` is preferable, being a more suitable syntax.
 *
 * - `isBetterThanYou` : **`bool`**
 *     Just an example of how properties can be attached to any
 *     `object`, i.e., just via declaration.
 **/
example_person : Person
'(boring) person/author/guy'
'An Ordinary Person' @room_1
"""
This is the description of an ordinary person. You see nothing remarkable about this person yet, but you get the feeling that an author somewhere will endow this being with feelings, personality, and a very stylish pair of pants.
""" {
    isBetterThanYou = null;

    initSpecialDesc {
        isInInitState = null; // set to null once we've run
        """
        This is the first time you're seeing this human being, and you have to say, you're not impressed. They're dull, probably not intelligent, and not much for conversation.
        """;
    }

    specialDesc { example_person_list.doScript(); }
}


/** `example_person_list` : **`ShuffledEventList`**
 *
 * This of one of the most useful types of `EventList`s. It
 * iterates through the first list in the template in order,
 * and then it runs any of the elements in the second list in a
 * chaotic fashion, i.e., no element played twice in a row.
 **/
example_person_list : ShuffledEventList
[''' The person stands in a corner, not saying much yet. ''']
['''
The person picks up a nearby object, and fools with it just to look busy.
''','''
The person briefly makes eye contact, but then looks back at the ground.
'''];



