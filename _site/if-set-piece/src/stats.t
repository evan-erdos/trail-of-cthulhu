
#include <adv3.h>
#include <en_us.h>
#include "macros.h"

enum Health, Sanity, Stability;

class StatSet : object {
	health = 10;
	sanity = 10;
	stability = 10;

	change(stat, n) {
		if (n<1) return;
		local s = '''(You have <<(n>0)?'gained':'lost'>> <<abs(n)>> ''';
		switch (stat) {
			case Health:
				health += n;
				s += 'Health';
				break;
			case Sanity:
				sanity += n;
				s += 'Sanity';
				break;
			case Stability:
				stability += n;
				s += 'Stability';
				break;
		}
		println(s+' points)');
	}
}
