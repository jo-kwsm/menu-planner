package controller

import (
	"log"
	"net/http"

	"github.com/gin-gonic/gin"
	"github.com/jo-kwsm/menu-planner/service"
)

func MenuAdd(c *gin.Context) {

}

func MenuList(c *gin.Context) {
	menuService := service.MenuService{}
	MenuLists, err := menuService.GetMenuList()

	if err != nil {
		log.Print(err)
	}

	c.JSONP(http.StatusOK, gin.H{
		"message": "ok",
		"data":    MenuLists,
	})
}

func MenuUpdate(c *gin.Context) {

}

func MenuDelete(c *gin.Context) {

}
