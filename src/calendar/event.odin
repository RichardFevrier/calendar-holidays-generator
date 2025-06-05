package calendar

import "core:time/datetime"

Event :: struct {
	date:        datetime.Date,
	rec_rules:   string,
	summary:     string,
	description: string,
}
