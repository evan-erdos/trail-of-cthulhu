
#include <adv3.h>
#include <en_us.h>
#include "macros.h"
//#pragma newline_spacing(preserve)


versionInfo : GameID {
    name = 'Trail of Cthulhu';
    tagline =
    '''
    <p> Red Tide Rising, Act I : The Observatory</p>
    ''';
    byline = 'by Ben Scott';
    email = 'bescott@andrew.cmu.edu';
    genre = 'Lovecraftian Horror';
    version = 'v0.1.2';
    published = '2016';
    IFID = 'TADS3TOC-3DFD-4E23-8419-89B0337C6A19';

    scoreRankTable = [
        [0,  'a silly student'],
        [25, 'something of an expert'],
        [50, 'a bona-fide private investigator']];

    intro() {
        """<p>
        October 20th, 1957
        </p><p>
        You have learned of a strange Jungle Observatory,
        being operated by Soviet spies in Northern Africa.
        Sputnik has been in low Earth orbit for a few weeks now,
        and you have reason to believe that not everything is as it seems.
        </p>
        """;
    } /* intro */


    title() {
        about();
        """
        <p>(Type <<aHref('about', 'ABOUT')>> for basic information about this game, or <<aHref('restore', 'RESTORE')>> to restore a saved position. To <<aHref('', 'begin the game')>>, just press the Enter key, and type <<aHref('help','HELP')>> once you start if you get stuck.) </p>
        """;
    } /* title */


    about() {
        """
        <p><b><u>
        <p><<versionInfo.name.toUpper()>></u></b></p>
        <<versionInfo.tagline>>
        </p><p>
        <center>
        <<versionInfo.byline>>, <<versionInfo.email>>
        <p>Release <<versionInfo.version>>, <<versionInfo.published>></p></p>
        </center>
        """;
    } /* about */
} /* versionInfo */


