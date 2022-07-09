package domain

type Plan struct {
	Lunch  Menu `json:"lunch" form:"lunch"`
	Dinner Menu `json:"dinner" form:"dinner"`
}
