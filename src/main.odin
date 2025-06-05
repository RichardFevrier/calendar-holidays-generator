package main

import "calendar"
import "core:fmt"
import "core:mem"
import "core:os"
import "core:strings"
import "core:time"
import "core:time/datetime"
import "core:unicode"
import "france"

main :: proc() {

	// https://gist.github.com/karl-zylinski/4ccf438337123e7c8994df3b03604e33
	when ODIN_DEBUG {
		track: mem.Tracking_Allocator
		mem.tracking_allocator_init(&track, context.allocator)
		context.allocator = mem.tracking_allocator(&track)

		defer {
			if len(track.allocation_map) > 0 {
				fmt.eprintf("=== %v allocations not freed: ===\n", len(track.allocation_map))
				for _, entry in track.allocation_map {
					fmt.eprintf("- %v bytes @ %v\n", entry.size, entry.location)
				}
			}
			if len(track.bad_free_array) > 0 {
				fmt.eprintf("=== %v incorrect frees: ===\n", len(track.bad_free_array))
				for entry in track.bad_free_array {
					fmt.eprintf("- %p @ %v\n", entry.memory, entry.location)
				}
			}
			mem.tracking_allocator_destroy(&track)
		}
	}

	calendar_str_builder(france.name, france.code, france.rec_events, france.dyn_events)
}

calendar_str_builder :: proc(
	name: string,
	code: string,
	rec_events: proc(year: int) -> [dynamic]calendar.Event,
	dyn_events: proc(year: int) -> [dynamic]calendar.Event,
) {
	dir_name := "output"
	path := strings.concatenate({dir_name, "/", name, ".ics"})
	defer delete(path)

	os.make_directory(dir_name)
	file, err := os.open(path, os.O_CREATE | os.O_TRUNC | os.O_RDWR, 0o644)
	defer os.close(file)
	if err != nil {
		fmt.eprintln("Failed to create file:", err)
		return
	}

	b := strings.builder_make()
	defer strings.builder_destroy(&b)

	strings.write_string(&b, "BEGIN:VCALENDAR\n")
	strings.write_string(&b, "VERSION:2.0\n")
	fmt.sbprintf(&b, "PRODID:-//RichardFevrier//NONSGML calendar-holidays-generator//%s\n", code)
	strings.write_string(&b, "CALSCALE:GREGORIAN\n")

	current_year := time.year(time.now())
	window :: 75

	events := rec_events(current_year - window)
	for event in events {
		event_str_builder(&b, event)
	}
	delete(events)

	for year := current_year - window; year <= current_year + window; year += 1 {
		events = dyn_events(year)
		for event in events {
			event_str_builder(&b, event)
		}
		delete(events)
	}

	strings.write_string(&b, "END:VCALENDAR")

	final_str := strings.to_string(b)

	written, err2 := os.write_string(file, final_str)
	if err2 != nil {
		fmt.eprintln("Write failed:", err2)
		return
	}
}

event_str_builder :: proc(b: ^strings.Builder, event: calendar.Event) {

	summary := sanitize_string(event.summary)
	defer delete(summary)

	strings.write_string(b, "BEGIN:VEVENT\n")

	if len(event.rec_rules) > 0 {
		fmt.sbprintf(b, "UID:%s@fevrier.io\n", summary)
	} else {
		fmt.sbprintf(b, "UID:%s-%d@fevrier.io\n", summary, event.date.year)
	}

	fmt.sbprintf(
		b,
		"DTSTART;VALUE=DATE:%d%02d%02d\n",
		event.date.year,
		event.date.month,
		event.date.day,
	)
	date, _ := datetime.add_days_to_date(event.date, 1)
	fmt.sbprintf(b, "DTEND;VALUE=DATE:%d%02d%02d\n", date.year, date.month, date.day)
	if len(event.rec_rules) > 0 {
		fmt.sbprintf(b, "RRULE:FREQ=%s\n", event.rec_rules)
	}
	fmt.sbprintf(b, "SUMMARY:%s\n", event.summary)
	fmt.sbprintf(b, "DESCRIPTION:%s\n", event.description)
	strings.write_string(b, "END:VEVENT\n")
}

sanitize_string :: proc(input: string) -> string {

	b := strings.builder_make()
	defer strings.builder_destroy(&b)

	inputl := strings.to_lower(input)
	defer delete(inputl)

	for c in inputl {
		if unicode.is_letter(c) || unicode.is_number(c) {
			nc: string
			switch c {
			case 'à', 'á', 'â', 'ä', 'ã', 'å':
				nc = "a"
			case 'ç':
				nc = "c"
			case 'è', 'é', 'ê', 'ë':
				nc = "e"
			case 'ì', 'í', 'î', 'ï':
				nc = "i"
			case 'ñ':
				nc = "n"
			case 'ò', 'ó', 'ô', 'ö', 'õ':
				nc = "o"
			case 'ù', 'ú', 'û', 'ü':
				nc = "u"
			case 'ý', 'ÿ':
				nc = "y"
			case '\u0153':
				nc = "oe"
			}
			if len(nc) > 0 {
				strings.write_string(&b, nc)
			} else {
				strings.write_rune(&b, c)
			}
		}
	}

	return strings.clone(strings.to_string(b))
}
