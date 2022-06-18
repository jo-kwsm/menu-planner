package service

import (
	"fmt"

	"github.com/jo-kwsm/menu-planner/model"
)

type MenuService struct{}

func (MenuService) SetMenu() error {
	return nil
}

func (MenuService) GetMenuList() ([]model.Menu, error) {
	sql := `SELECT menu_id, menu_name, calorie, burden_id FROM menu`
	fmt.Println("service")

	rows, err := Db.Query(sql)
	if err != nil {
		return nil, err
	}
	defer rows.Close()

	menus := make([]model.Menu, 0)

	for rows.Next() {
		var (
			menuId, burdenId  int64
			menuName, calorie string
		)

		if err := rows.Scan(&menuId, &menuName, &calorie, &burdenId); err != nil {
			return nil, err
		}

		menus = append(menus, model.Menu{
			MenuId:   menuId,
			MenuName: menuName,
			Calorie:  calorie,
			BurdenId: burdenId,
		})
	}
	fmt.Println(menus)
	fmt.Println("ok")

	return menus, nil
}

func (MenuService) UpdateMenu() error {
	return nil
}

func (MenuService) DeleteMenu() error {
	return nil
}
