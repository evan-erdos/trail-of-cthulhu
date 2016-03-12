
#include <adv3.h>
#include <en_us.h>
#include "macros.h"

enum Possess, CreateFire, MassMaddness;

class SpellSet : object {
	possess = 0;
	firebolt = 0;
	maddness = 0;

	learn(skill, n) {
		if (n<1) return;
		local s = '(You learn the spell ';
		switch (skill) {
			case Possess:
				possess += n;
				s += '<b>Possess Being</b>';
				break;
			case CreateFire:
				firebolt += n;
				s += '<b>Create Fire</b>';
				break;
			case MassMaddness:
				maddness += n;
				s += '<b>Mass Maddness</b>';
				break;
		}

		println(s+')');
	}
}
