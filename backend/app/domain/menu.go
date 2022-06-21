package domain

type Menu struct {
	MenuId     int64    `json:"menuId" form:"menuId"`
	MenuName   string   `json:"menuName" form:"menuName"`
	Calorie    string   `json:"calorie" form:"calorie"`
	BurdenId   int64    `json:"burdenId" form:"burdenId"`
	MenuRecipe []Recipe `json:"recipe" form:recipe`
}
