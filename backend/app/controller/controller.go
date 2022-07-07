package controller

import (
	"log"
	"net/http"

	"github.com/gin-gonic/gin"
	"github.com/jo-kwsm/menu-planner/service"
)

func MenuList(c *gin.Context) {
	menuService := service.MenuService{}
	MenuLists, err := menuService.GetMenuList()

	if err != nil {
		log.Print(err)
	}

	c.Writer.Header().Set("Access-Control-Allow-Origin", "http://localhost:3000")
	c.JSONP(http.StatusOK, MenuLists)
}
