
#include <adv3.h>
#include <en_us.h>
#include "macros.h"

enum Occult, Mythos, Scuffling, Intimidation,
	Filch, Fleeing, Psychoanalysis, SenseTrouble, Stealth;

class SkillSet : object {
	occult = 0;
	mythos = 0;
	scuffling = 1;
	intimidation = 2;
	filch = 1;
	fleeing = 1;
	psychoanalysis = 3;
	sense_trouble = 1;
	stealth = 2;
	sanity = 10;
	stability = 10;

	change(skill, n) {
		local s = '(Your ';
		switch (skill) {
			case Occult:
				occult += n;
				s += 'knowledge of the Occult';
				break;
			case Mythos:
				mythos += n;
				s += 'knowledge of the Cthulhu Mythos';
				break;
			case Scuffling:
				scuffling += n;
				s += 'skill with scuffling';
				break;
			case Intimidation:
				intimidation += n;
				s += 'ability to intimidate';
				break;
			case Filch:
				filch += n;
				s += 'ability to steal';
				break;
			case Fleeing:
				fleeing += n;
				s += 'skill with fleeing';
				break;
			case Psychoanalysis:
				psychoanalysis += n;
				s += 'ability to psychoanalyze';
				break;
			case SenseTrouble:
				sense_trouble += n;
				s += 'ability to sense trouble';
				break;
			case Stealth:
				stealth += n;
				s += 'skill for stealth';
				break;
		}

		s += ''' has <<(n>0)?'in':'de'>>creased)''';
		println(s);
	}
}
