package repository

import (
	"fmt"

	"github.com/jo-kwsm/menu-planner/domain"
)

type MenuRepository struct{}

func (MenuRepository) List() ([]domain.Menu, error) {
	sql := `SELECT menu_id, menu_name, calorie, burden_id FROM menu`

	rows, err := Db.Query(sql)
	if err != nil {
		return nil, err
	}
	defer rows.Close()

	menus := make([]domain.Menu, 0)

	for rows.Next() {
		var (
			menuId, burdenId  int64
			menuName, calorie string
		)

		err = rows.Scan(&menuId, &menuName, &calorie, &burdenId)
		if err != nil {
			return nil, err
		}

		menus = append(menus, domain.Menu{
			MenuId:   menuId,
			MenuName: menuName,
			Calorie:  calorie,
			BurdenId: burdenId,
		})
	}

	return menus, nil
}

type RecipeRepository struct{}

func (RecipeRepository) List(menuId int64) ([]domain.Recipe, error) {
	sql := fmt.Sprintf(
		`SELECT r.ingredient_id, r.num, i.ingredient_name, i.category_id
		FROM recipe r
		join ingredient i on r.ingredient_id = i.ingredient_id
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
			ingredientNmae                string
		)

		err = rows.Scan(&ingredientId, &num, &ingredientNmae, &categoryId)
		if err != nil {
			return nil, err
		}

		recipes = append(recipes, domain.Recipe{
			RecipeIngredient: domain.Ingredient{
				IngredientId:   ingredientId,
				IngredientName: ingredientNmae,
				CategoryId:     categoryId,
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
