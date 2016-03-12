
#include <adv3.h>
#include <en_us.h>
#include "macros.h"


/** `grimoire` : **`Book`**
 *
 * This is **`Professor Birchwell`**'s book of spells.
 **/
grimoire : Readable, Openable, Hidden
'(black) book/grimoire/tome*notes'
'grimoire' @observatory_desk
"""
The grimoire is thick, and is bound in heavy black leather.
""" {
    bulk = 2;
    weight = 2;
    hasReadTwice = null;

    initSpecialDesc { isInInitState = null;
        """
        Under some scribbled notes you find a strange, black tome.
        """;
    }

    readDesc {
        if (user.skills.occult>0) {
            if (user.skills.mythos>0 && !hasReadTwice) {
                """
                You pore over the tome's contents, but you don't find anything new.
                <br>
                Some of the things that catch your eye are unfathomably horrifying.
                """;
                user.stats.change(Sanity,-1);
                hasReadTwice = true;
            }

            if (hasReadTwice) {
                """
                Until you have a specific passage to find, you decide you should not read further.
                It's already beginning to have an effect on your mind.
                """;
                if (isOpen) makeOpen(null);
                return;
            }
            next;
            """
            <p>
            You know enough about the professor's research to determine that the contents of this tome are not mad ramblings, but magical incantations.
            </p><p>
            You begin to read through it.
            It describes strange rituals and arcane incantations.
            One passage describes a way to invoke great, ancient gods,
            and use their might to possess living beings.
            You memorize it.
            """;
            user.spells.learn(Possess,1);
            user.skills.change(Mythos,1);
            user.stats.change(Sanity,-1);
            return;
        }
        """
        You open the grimoire, however most of it's contents are beyond you.
        Either that or the professor wasn't lucid when he wrote it.
        You close the grimoire.
        """;
        if (isOpen) makeOpen(null);
    }

    dobjFor(Take) {
        check() {
            if (birchwell.location==observatory_desk.location) {
                """
                You won't get very far with it while the professor is around.
                """;
                exit;
            }
        }
    }

    dobjFor(Read) {

        check() {
            if (birchwell.location==observatory_desk.location) {
                """
                The professor would never allow that.
                """;
                exit;
                return;
            }

            preCond = (inherited()+objOpen);
        }
    }
}

