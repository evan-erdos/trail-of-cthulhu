

#include <adv3.h>
#include <en_us.h>
#include "macros.h"
#pragma newline_spacing(preserve)


/** `user` : **`Mortal`**
 *
 * This is the primary class representing the player. Anything
 * which pertains to the main player should be included here.
 * It inherits from **`BagOfHolding`**, to simulate a person's
 * pockets and general ability to carry things, and from the
 * **`Mortal`** class, which is a kind of **`Person`** which
 * can be killed or harmed in one way or another.
 *
 * - `name` : **`string`**
 *     The `user` will be referred to as this when being listed
 *     in a room, or when being addressed by another `Actor`.
 *
 * - `firstname` : **`string`**
 *     a surname to be used in certain special encounters.
 *
 * - `lastname` : **`string`**
 *     see `firstname`
 *
 * - `gender` : **`Gender`**
 *     a value of the `enum` which defines gender.
 *
 * - `location` : **`Room`**
 *     the initial location for the player.
 *
 * - `bulk` : **`int`**
 *     amount of weight the `user` can carry without using a
 *     holdall, e.g., the `backpack`.
 **/
user : BagOfHolding, Mortal {
    name = 'Paul Erdos';
    firstname = 'Paul';
    lastname = 'Erdos';
    gender = Male;
    vocabWords = 'me/self/<<name>>';
    location = root;
    issueCommandsSynchronously = true;
    bulk = 10;
    reputation = 50;
    desc {
        local s = '<b>Health</b>: ';
        switch (stats.health) {
            case -1:
                s+= '''
                Your wounds are mortal,
                and you're barely conscious.
                ''';
                break;
            case 0:
                s+= '''
                You have been maimed.
                Your wounds are very serious.
                Without some sort of medical attention,
                you're not going to survive.
                ''';
                break;
            case 1:
            case 2:
            case 3:
                s+= '''
                You're just barely clinging onto life.
                If anything happens to you now,
                it's unlikely that you'll recover.
                ''';
                break;
            case 4:
            case 5:
            case 6:
                s+= '''
                You're quite hurt. You're able to walk,
                but not much more than that.
                ''';
                break;
            case 7:
            case 8:
            case 9:
                s+= '''
                You've been pretty well roughed-up,
                but you can still keep going.
                ''';
            default:
                s+= '''
                You're in perfect health.
                ''';
                break;
        }
        s += '\n<b>Stability</b>: ';
        switch(stability) {
            case 0:
                s += '''
                You're completely gone.
                When you're aware of your thoughts, they horrify you.
                When you're not, you lose entire days, lost in maddness.
                ''';
            case 1:
            case 2:
                s += '''
                Your mind is ablaze.
                Little noises set you off, and you hear voices everywhere.
                Very soon, you fear you're going to get lost in your head,
                and you're never going to be able to find your way out.
                ''';
                break;
            case 3:
            case 4:
                s += '''
                You're completely shell-shocked.
                Your body hurts, you've been tense for days.
                You forget what you're doing almost constantly,
                and you have a hard time forming complete sentences.
                The horrors you've seen are nearly overpowering your reason.
                ''';
                break;
            case 5:
            case 6:
            case 7:
                s += '''
                You feel lost in your own head.
                Strange feelings flit in and out, spontaneously.
                Smaller and smaller things frighten you,
                and every day you feel like something's chipping away at you.
                ''';
                break;
            case 8:
            case 9:
                s += '''
                At one point in your life,
                you would have claimed to be unafraid of things like this.
                You've always been able to rely on your own thoughts,
                but now you question whether or not you're fully sane.
                ''';
                break;
            case 10:
                s += '''
                For some reason, you aren't so afraid.
                Though some strange things have happened,
                you feel as though you're in control.
                ''';
                break;
            default:
                s += '''
                Strangely, you feel fine.
                ''';
                break;
        }

        s += '\n<b>Sanity</b>: ';
        switch(sanity) {
            case 0:
                s += '''
                scatteringmountains greatwheel
                mindfailingwindingtwistshifting
                *#pZ_5A#WbQM*Mkitchen just the k#G5*v&M%Mitchen. dark.safe.
                no murdereiPLgB3*(mXWL?M*{nRUoL4Lr$nRq
                here. murdereiPLgB3*(mXWL?M*{nRUoL4Lcan't get you here.
                They can't get yo5*v&M%MKB/ nearnearnear
                QPY3Uca19M9hpbnw86xf?0@Gj3f5sRjx,Fk`qKXNVk9 get you in here...
                safe..#hhF7SNG|>m@m^$PjOzVS),0BJR%/
                ''';
                break;
            case 1:
                s += '''
                T|QPz~P#LBev4?L\<E9tmMtable in kitchen. dirty,
                2UUAx~}nc#vM9i_Wo16VqCgZM5&F+DmZ1hTi
                <b>  You have angered the gods.  </b>VP\<YetW>$E]
                bVZWP6#1Kg@H6m9E#~1u1ob(y{ig4[#V)2~MygGiCndbuy it,i put...
                here...SZ#VPE#mSaTPO
                ''';
                break;
            case 2:
                s += '''
                illerseverywhere, GO INTPmMCa&n\>22\<M\VvRbZo!>G0|`bT![|D7}
                L$/{v$VCU(Ym[\hiB7Z_3Wr brokecindy gone don't come home please
                pleaseMzDF+tvery broken, you broke it, you r(s)th
                <b>  They know what you've done, and they will kill you. </b>
                6BEymMe/e5L9x\+(t+\M7L^M/come after you and-when-they
                do-they will gone don't come home please pleaseey
                andwillleaveyouandyouwill get f_vomL(!,!x=\zjLEtPM!9#.v?
                ''';
                break;
            default:
                s += '''
                Your mind is intact, as far as you can tell.
                ''';
                break;
        }

        println(s);

        holdingDesc;
        /* inventoryListener: actorInventoryListener */
    }

    stats = user_stats;
    skills = user_skills;
    spells = user_spells;

    firstNames = [
        ['Robert', Male],   ['Roberta', Female],
        ['Harold', Male],   ['Carol', Female],
        ['Jessie', Male],   ['Jessica', Female],
        ['Reginald', Male], ['Regina', Female],
        ['Leonard', Male],  ['Leah', Female],
        ['Jerry', Male],    ['Jenny', Female],
        ['Thomas', Male],   ['Tina', Female],
        ['Alex', Male],     ['Alex', Female]];

    lastNames = [
        'Watson', 'Wilson', 'King', 'Seinfeld',
        //'the Marauder', 'the Baby Crusher',
        'Faulkner', 'Card', 'Clark', 'Skywalker',
        'Joyce', 'Rivera', 'Fitzgerald', 'Huxley',
        'Thompson', 'Poe', 'Vogel', 'Hoenikker',
        'Austen', 'Wilde', 'Tolstoy', 'Pynchon',
        'Kafka', 'Bradbury', 'Dickinson', 'Plath',
        'Salinger', 'Lysander', 'Orwell', 'Eliot',
        'Goethe', 'Lindgren', 'Roethke', 'Asimov'];


    init() {
        " "; user.setName();
        "\b\nName: <<user.name>>, <<user.printGender()>>";
        clear;
    }

    reset() {
        user.travelTo(root,metal_door_1, metal_door_0);
        travelerTravelWithin(user,root_bed);
        user.makePosture(lying);
    }

    engender(m,f) { return (user.gender==Male)?(m):(f); }

    setName() {
        local cmd;
        for (local i=0;true;i++) {
            cmd = inputManager.getInputLine(null,
                {:"\b\nWho will you be?  &gt;" });
            cls();
            if (cmd=='' || i>2) {
                local n = 1+rand(firstNames.length-1);
                user.firstname = firstNames[n][1];
                user.gender = firstNames[n][2];
                user.lastname = lastNames[1+rand(lastNames.length-1)];
                user.name = '<<user.firstname>> <<user.lastname>>';
                return;
            }

            else if (cmd.length()<3)
                "You really should have a name.";
            else if (cmd.length()>24)
                "What are you, some kind of 16th century Spanish noble? Be reasonable, here.";
            else if (rexSearch('%d',cmd))
                "A real name please.";
            else if (rexSearch(util.obscenities,cmd))
                "So, common decency, too. Call me particular.";
            else {
                user.name = cmd; " ";
                user.setGender();
                return;
            }
        }
    }

    formatName(cmd) {
        user.name = cmd;
        if (rexSearch('%w %w',cmd)) {
            local s = cmd.split(' ');
            if (s!=null && s.length()>=2) {
                user.firstname = util.capitalize(s[0]);
                user.lastname = util.capitalize(s[1]);
            }
        }
    }

    setGender() {
        local cmd;
        for (local i=0;true;i++) {
            cmd = inputManager.getInputLine(null,
                {:"\b\nMale or Female?  &gt; " });
            cls();
            if (cmd=='' || i>5) {
                if (i<1) {
                    "Pick a gender. "; continue;
                } else if (i<2) {
                    local b = ((rand(3)%2)==0);
                    user.gender = (b)?Male:Female; return;
                }
            }
            else if (i>3) "Can we get to the point, here?";
            else if (rexMatch('b|boy|m|male|man|masculine',cmd.toLower())) { user.gender = Male; break; }
            else if (rexMatch('f|fe|female|feminine|g|girl|lady',cmd.toLower())) { user.gender = Female; break; }
        }
    }

    printGender() { return (user.gender==Male)?'Male':'Female'; }
}


user_stats : StatSet { }
user_skills : SkillSet { }
user_spells : SpellSet { }













