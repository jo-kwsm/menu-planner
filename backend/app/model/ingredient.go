package model

type Ingredient struct {
	IngredientId   int64  `json:"ingredientId" form:"ingredientId"`
	IngredientName string `json:"ingredientName" form:"ingredientName"`
	MeasureId      int64  `json:"measureId" form:"measureId"`
	CategoryId     int64  `json:"categoryId" form:"categoryId"`
}
