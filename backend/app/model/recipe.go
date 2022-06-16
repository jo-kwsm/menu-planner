package model

type Recipe struct {
	MenuId       int64 `json:"menuId" form:"menuId"`
	IngredientId int64 `json:"ingredientId" form:"ingredientId"`
	Num          int64 `json:"num" form:"num"`
}
