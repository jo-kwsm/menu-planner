package main

import (
	"github.com/gin-gonic/gin"
	"github.com/jo-kwsm/menu-planner/controller"
)

func main() {
	router := gin.Default()

	router.GET("/menu", controller.MenuList)

	router.Run(":8080")
}
