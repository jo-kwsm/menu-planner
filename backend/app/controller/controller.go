package controller

import (
	"log"
	"math/rand"
	"net/http"

	"github.com/gin-gonic/gin"
	"github.com/jo-kwsm/menu-planner/domain"
	"github.com/jo-kwsm/menu-planner/service"
)

func MenuList(c *gin.Context) {
	menuService := service.MenuService{}
	MenuLists, err := menuService.GetMenuList()

	if err != nil {
		log.Print(err)
	}

	c.JSONP(http.StatusOK, MenuLists)
}

func MenuRandom(c *gin.Context) {
	menuService := service.MenuService{}
	MenuRandoms, err := menuService.GetMenuList()

	if err != nil {
		log.Print(err)
	}

	lunchIndex, dinnerIndex := 0, 0
	for lunchIndex == dinnerIndex && len(MenuRandoms) > 1 {
		lunchIndex = rand.Intn(len(MenuRandoms))
		dinnerIndex = rand.Intn(len(MenuRandoms))
	}

	MenuRandom := domain.Plan{
		Lunch:  MenuRandoms[lunchIndex],
		Dinner: MenuRandoms[dinnerIndex],
	}

	c.JSON(http.StatusOK, MenuRandom)
}
