package main

import (
	"github.com/gin-gonic/gin"
	"github.com/jo-kwsm/menu-planner/controller"
)

func main() {
	router := gin.Default()

	menuRouter := router.Group("menu")
	{
		menuRouter.POST("/", controller.MenuAdd)
		menuRouter.GET("/", controller.MenuList)
		menuRouter.PUT("/", controller.MenuUpdate)
		menuRouter.DELETE("/", controller.MenuDelete)
	}

	router.Run(":8080")
}
