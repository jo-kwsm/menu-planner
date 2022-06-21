package domain

type Category struct {
	CategoryId   int64  `json:"categoryId" form:"categoryId"`
	CategoryName string `json:"categoryName" form:"categoryName"`
}
