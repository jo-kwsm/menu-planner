package service

import (
	"menu-planner/domain"
	"menu-planner/repository"
)

type MenuService struct{}

func (MenuService) GetMenuList() ([]domain.Menu, error) {
	menuRepository := repository.MenuRepository{}
	recipeRepository := repository.RecipeRepository{}

	menuList, err := menuRepository.List()
	if err != nil {
		return nil, err
	}

	for i := 0; i < len(menuList); i++ {
		menuList[i].MenuRecipe, err = recipeRepository.List(menuList[i].MenuId)
		if err != nil {
			return nil, err
		}
	}

	return menuList, nil
}
