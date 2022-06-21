package domain

type Recipe struct {
	RecipeIngredient Ingredient `json:"ingredient" form:"ingredient"`
	Num              int64      `json:"num" form:"num"`
}
