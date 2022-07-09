package controller

import (
	"log"
	"math/rand"
	"net/http"

	"menu-planner/domain"
	"menu-planner/service"

	"github.com/gin-gonic/gin"
)

func MenuList(c *gin.Context) {
	menuService := service.MenuService{}
	MenuLists, err := menuService.GetMenuList()

	if err != nil {
		log.Print(err)
	}

	c.JSON(http.StatusOK, MenuLists)
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

	MenuRandom := make([]domain.Plan, 0)
	MenuRandom = append(MenuRandom, domain.Plan{
		Lunch:  MenuRandoms[lunchIndex],
		Dinner: MenuRandoms[dinnerIndex],
	})

	c.JSON(http.StatusOK, MenuRandom)
}
