package repository

import (
	"fmt"

	"github.com/jo-kwsm/menu-planner/domain"
)

type MenuRepository struct{}

func (MenuRepository) List() ([]domain.Menu, error) {
	sql := `SELECT m.menu_id, m.menu_name, m.calorie, m.burden_id, b.burden_name
	FROM menu m
	JOIN burden b ON m.burden_id = b.burden_id`

	rows, err := Db.Query(sql)
	if err != nil {
		return nil, err
	}
	defer rows.Close()

	menus := make([]domain.Menu, 0)

	for rows.Next() {
		var (
			menuId, burdenId, calorie int64
			menuName, burdenName      string
		)

		err = rows.Scan(&menuId, &menuName, &calorie, &burdenId, &burdenName)
		if err != nil {
			return nil, err
		}

		menus = append(menus, domain.Menu{
			MenuId:     menuId,
			MenuName:   menuName,
			Calorie:    calorie,
			BurdenId:   burdenId,
			BurdenName: burdenName,
		})
	}

	return menus, nil
}

type RecipeRepository struct{}

func (RecipeRepository) List(menuId int64) ([]domain.Recipe, error) {
	sql := fmt.Sprintf(
		`SELECT r.ingredient_id, r.num, i.ingredient_name, i.category_id, c.category_name
		FROM recipe r
		JOIN ingredient i ON r.ingredient_id = i.ingredient_id
		JOIN category c on i.category_id = c.category_id
		where menu_id=%d`,
		menuId)

	rows, err := Db.Query(sql)
	if err != nil {
		return nil, err
	}
	defer rows.Close()

	recipes := make([]domain.Recipe, 0)

	for rows.Next() {
		var (
			ingredientId, num, categoryId int64
			ingredientNmae, categoryName  string
		)

		err = rows.Scan(&ingredientId, &num, &ingredientNmae, &categoryId, &categoryName)
		if err != nil {
			return nil, err
		}

		recipes = append(recipes, domain.Recipe{
			RecipeIngredient: domain.Ingredient{
				IngredientId:   ingredientId,
				IngredientName: ingredientNmae,
				CategoryId:     categoryId,
				CategoryName:   categoryName,
			},
			Num: num,
		})
	}

	return recipes, nil
}

type IngredientRepository struct{}

func (IngredientRepository) Get(ingredientId int64) (domain.Ingredient, error) {
	sql := fmt.Sprintf(`SELECT ingredient_name, category_id FROM ingredient where ingredient_id=%d`, ingredientId)

	rows, err := Db.Query(sql)
	if err != nil {
		return domain.Ingredient{}, err
	}
	defer rows.Close()

	var (
		categoryId     int64
		ingredientName string
	)

	err = rows.Scan(&ingredientName, &categoryId)
	if err != nil {
		return domain.Ingredient{}, err
	}

	ingredient := domain.Ingredient{
		IngredientId:   ingredientId,
		IngredientName: ingredientName,
		CategoryId:     categoryId,
	}

	return ingredient, nil
}
