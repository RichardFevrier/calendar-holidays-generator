package france

import "../calendar"
import "core:time/datetime"

name :: "france"
code :: "FR"

// https://fr.wikipedia.org/wiki/F%C3%AAtes_et_jours_f%C3%A9ri%C3%A9s_en_France

rec_events :: proc(year: int) -> [dynamic]calendar.Event {

	events: [dynamic]calendar.Event = make([dynamic]calendar.Event, 0)

	date, _ := datetime.components_to_date(year, 1, 1)
	append(
		&events,
		calendar.Event {
			date,
			"YEARLY",
			"Jour de l'An",
			"Nommé également « nouvel an » : ce jour devient férié sous le 1er Empire par avis du Conseil d'État du 23 mars 1810.",
		},
	)

	date, _ = datetime.components_to_date(year, 2, 2)
	append(
		&events,
		calendar.Event {
			date,
			"YEARLY",
			"Chandeleur",
			"D'origine chrétienne, elle commémore la présentation de Jésus, reconnu comme lumière du peuple d'Israël, au Temple de Jérusalem. Jour de bénédiction des cierges pour les chrétiens, c'est l'occasion de manger des crêpes pour les gourmands.",
		},
	)

	date, _ = datetime.components_to_date(year, 2, 14)
	append(
		&events,
		calendar.Event {
			date,
			"YEARLY",
			"Saint-Valentin",
			"Fête des amoureux, jour de la Saint-Valentin.",
		},
	)

	date, _ = datetime.components_to_date(year, 3, 1)
	ord, _ := datetime.date_to_ordinal(date)
	dow := datetime.day_of_week(ord)
	if dow != datetime.Weekday.Sunday {
		date, _ = datetime.add_days_to_date(date, 7 - i64(dow))
	}
	append(
		&events,
		calendar.Event {
			date,
			"YEARLY;BYMONTH=3;BYDAY=1SU",
			"Fête des grands-mères",
			"Premier dimanche de mars : fête des grands-mères.",
		},
	)

	date, _ = datetime.components_to_date(year, 5, 1)
	append(
		&events,
		calendar.Event {
			date,
			"YEARLY",
			"Fête du travail",
			"Ce jour est, en premier, déclaré jour chômé le 23 avril 1919 en même temps qu'est ratifiée la journée de 8 heures. Le maréchal Pétain la change en « fête du Travail et de la Concorde sociale » en en faisant un jour férié, chômé et payé. L'instauration de ce jour commémorant les luttes de travailleurs n'aboutit qu'avec la loi du 30 avril 1947 (jour chômé et payé), modifiée par celle du 29 avril 1948 (« fête du Travail »).",
		},
	)

	date, _ = datetime.components_to_date(year, 5, 8)
	append(
		&events,
		calendar.Event {
			date,
			"YEARLY",
			"Victoire 1945",
			"Commémoration de la « capitulation sans condition » (à ne pas confondre avec un armistice) de l'Allemagne nazie mettant fin à la Seconde Guerre mondiale en Europe. Déclaré jour férié de commémoration, en France, le 20 mars 1953, le caractère férié est supprimé par le président Charles de Gaulle en 1959. Par la suite, le président Giscard d'Estaing supprime également la commémoration en 1975. Ce n'est qu'en 1981 que la loi rétablit le jour férié commémoratif sous la présidence de François Mitterrand.",
		},
	)

	date, _ = datetime.components_to_date(year, 6, 1)
	ord, _ = datetime.date_to_ordinal(date)
	dow = datetime.day_of_week(ord)
	if dow != datetime.Weekday.Sunday {
		date, _ = datetime.add_days_to_date(date, 7 - i64(dow))
	}
	date, _ = datetime.add_days_to_date(date, 14)
	append(
		&events,
		calendar.Event {
			date,
			"YEARLY;BYMONTH=6;BYDAY=3SU",
			"Fête des Pères",
			"Troisième dimanche de juin : fête des Pères.",
		},
	)

	date, _ = datetime.components_to_date(year, 6, 21)
	append(&events, calendar.Event{date, "YEARLY", "Fête de la musique", "Fête de la musique."})

	date, _ = datetime.components_to_date(year, 7, 14)
	append(
		&events,
		calendar.Event {
			date,
			"YEARLY",
			"Fête nationale française",
			"Commémoration de la Fête de la Fédération, le 14 juillet 1790, qui célébrait la prise de la Bastille l'année précédente. C'est sous la Troisième République que ce jour devient la fête nationale par la loi du 6 juillet 1880.",
		},
	)

	date, _ = datetime.components_to_date(year, 8, 15)
	append(
		&events,
		calendar.Event {
			date,
			"YEARLY",
			"Assomption",
			"Fête catholique célébrant la montée au ciel de Marie, mère de Jésus, sainte patronne de la France dès l'Ancien Régime, puis remplacé par un jour chômé par Napoléon pour fêter son anniversaire. Sous le Second Empire, ce jour était à la fois une fête religieuse dédiée à la Vierge et la Saint-Napoléon, anniversaire de l'Empereur.",
		},
	)

	date, _ = datetime.components_to_date(year, 10, 1)
	ord, _ = datetime.date_to_ordinal(date)
	dow = datetime.day_of_week(ord)
	if dow != datetime.Weekday.Sunday {
		date, _ = datetime.add_days_to_date(date, 7 - i64(dow))
	}
	append(
		&events,
		calendar.Event {
			date,
			"YEARLY;BYMONTH=10;BYDAY=1SU",
			"Fête des grands-pères",
			"Premier dimanche d'octobre : fête des grands-pères.",
		},
	)

	date, _ = datetime.components_to_date(year, 10, 31)
	append(
		&events,
		calendar.Event {
			date,
			"YEARLY",
			"Halloween",
			"Fête d'origine irlandaise, fêtée depuis peu en France. Cette fête était le réveillon du jour de l'an qui était le 1er novembre ; ce soir-là les gens se déguisaient en monstres ou fantômes. Halloween était devenue la 3e fête commerciale en France à partir de 2000, mais ce fut passager. Malgré tout, Halloween reste assez fêtée, notamment par les enfants. Cette fête n'est pas fériée en France.",
		},
	)

	date, _ = datetime.components_to_date(year, 11, 1)
	append(
		&events,
		calendar.Event {
			date,
			"YEARLY",
			"Toussaint",
			"Fête catholique célébrant tous les saints.",
		},
	)

	date, _ = datetime.components_to_date(year, 11, 11)
	append(
		&events,
		calendar.Event {
			date,
			"YEARLY",
			"Armistice 1918",
			"Jour anniversaire de l'armistice de 1918 mettant fin à la Première Guerre mondiale et de commémoration annuelle de la victoire et de la paix, journée d'hommage à tous les morts pour la France.",
		},
	)

	date, _ = datetime.components_to_date(year, 12, 25)
	append(
		&events,
		calendar.Event {
			date,
			"YEARLY",
			"Noël",
			"Fête célébrant la naissance de Jésus-Christ. La veille, le 24, est consacrée au réveillon de Noël et à la messe de Minuit dans certains pays par les chrétiens.",
		},
	)

	return events
}

dyn_events :: proc(year: int) -> [dynamic]calendar.Event {

	events: [dynamic]calendar.Event = make([dynamic]calendar.Event, 0)

	date, _ := datetime.components_to_date(year, 1, 1)
	ord, _ := datetime.date_to_ordinal(date)
	dow := datetime.day_of_week(ord)
	if dow != datetime.Weekday.Sunday {
		date, _ = datetime.add_days_to_date(date, 7 - i64(dow))
	}
	if date.day == 1 {
		date, _ = datetime.add_days_to_date(date, 7)
	}
	append(
		&events,
		calendar.Event {
			date,
			"",
			"Épiphanie",
			"Officiellement, l'Épiphanie est célébrée le 6 janvier, soit 12 jours après Noël. Cette date symbolique, ancrée dans la tradition chrétienne, marque la visite des Rois mages, Gaspard, Melchior et Balthazar, venus offrir leurs présents à l'enfant Jésus. Mais, petite subtilité : en France, une réforme liturgique de 1802 a déplacé la fête au premier dimanche suivant le 1er janvier pour faciliter la participation des fidèles. Résultat ? Selon les années, l'Épiphanie peut tomber entre le 2 et le 8 janvier.",
		},
	)

	easter := algo_delambre_butcher(year)

	date, _ = datetime.components_to_date(year, 3, 1)
	date, _ = datetime.add_days_to_date(date, i64(easter))
	append(
		&events,
		calendar.Event {
			date,
			"",
			"Lundi de Pâques",
			"Date variable, tombe un lundi compris entre le 23 mars et le 26 avril, suivant le calcul de la date de Pâques, qui célèbre la résurrection du Christ.",
		},
	)

	date, _ = datetime.add_days_to_date(date, -48)
	append(
		&events,
		calendar.Event {
			date,
			"",
			"Mardi gras",
			"(soit 40 jours, sans compter les dimanches, avant Pâques) : veille du Carême.",
		},
	)

	date, _ = datetime.add_days_to_date(date, 48)
	date, _ = datetime.add_days_to_date(date, 38)
	append(
		&events,
		calendar.Event {
			date,
			"",
			"Ascension",
			"(40e jour à partir du dimanche de Pâques) : date variable, commémorant la montée de Jésus au ciel.",
		},
	)

	pdate, _ := datetime.add_days_to_date(date, 11)
	append(
		&events,
		calendar.Event {
			pdate,
			"",
			"Lundi de Pentecôte",
			"(50 jours après le dimanche de Pâques) : date variable, lendemain de la fête commémorant l'envoi du Saint-Esprit aux disciples et la naissance de l'Église.",
		},
	)

	date, _ = datetime.components_to_date(year, 5, 31)
	ord, _ = datetime.date_to_ordinal(date)
	dow = datetime.day_of_week(ord)
	if dow != datetime.Weekday.Sunday {
		date, _ = datetime.add_days_to_date(date, -i64(dow))
	}
	pdate, _ = datetime.add_days_to_date(pdate, -1)
	if date.day == pdate.day {
		date, _ = datetime.add_days_to_date(date, 7)
	}
	append(
		&events,
		calendar.Event {
			date,
			"",
			"Fête des Mères",
			"Dernier dimanche de mai : fête des Mères. Si cette date coïncide avec celle de la Pentecôte, la fête des mères a lieu le premier dimanche de juin.",
		},
	)

	return events
}

algo_delambre_butcher :: proc(year: int) -> int {
	a := year % 19
	b := year / 100
	c := year % 100
	d := b / 4
	e := b % 4
	f := (b + 8) / 25
	g := (b - f + 1) / 3
	h := (19 * a + b - d - g + 15) % 30
	i := c / 4
	k := c % 4
	l := (32 + 2 * e + 2 * i - h - k) % 7
	m := (a + 11 * h + 22 * l) / 451
	r := 22 + h + l - 7 * m
	return r
}
