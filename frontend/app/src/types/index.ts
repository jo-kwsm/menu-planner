export interface MenuType {
  menuId: number
  menuName: string
  calorie: number
  burdenId: number
  burdenName: string
  // recipe:
}

export interface PlanType {
  lunch: MenuType
  dinner: MenuType
}
