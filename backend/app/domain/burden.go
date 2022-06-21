package domain

type Burden struct {
	BurdenId   int64  `json:"burdenId" form:"burdenId"`
	BurdenName string `json:"burdenName" form:"burdenName"`
}
