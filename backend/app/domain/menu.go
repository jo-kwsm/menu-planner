package domain

type Menu struct {
	MenuId     int64    `json:"menuId" form:"menuId"`
	MenuName   string   `json:"menuName" form:"menuName"`
	Calorie    int64    `json:"calorie" form:"calorie"`
	BurdenId   int64    `json:"burdenId" form:"burdenId"`
	BurdenName string   `json:"burdenName" form:"burdenName"`
	MenuRecipe []Recipe `json:"recipe" form:"recipe"`
}
