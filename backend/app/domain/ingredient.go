package domain

type Ingredient struct {
	IngredientId   int64  `json:"ingredientId" form:"ingredientId"`
	IngredientName string `json:"ingredientName" form:"ingredientName"`
	CategoryId     int64  `json:"categoryId" form:"categoryId"`
}
