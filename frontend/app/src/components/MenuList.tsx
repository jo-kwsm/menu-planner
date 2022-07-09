import { useEffect, useContext } from 'react'
import { client } from '../libs/axios'
import { MenuContext } from '../provider/MenuProvider'

const omitText = (text: string): string => {
  if (text.length > 10) {
    return text.substring(0, 7) + '...'
  }
  return text
}

export const MenuList = () => {
  const { menus, setMenus } = useContext(MenuContext)

  useEffect(() => {
    client.get('menu').then(({ data }) => {
      setMenus(data)
    })
    console.log(menus)
  })

  return (
    <div className="p-4 border border-gray-200 rounded shadow-lg">
      <p className="font-bold mb-2">レシピ一覧</p>
      <table className="border-collapse table-auto">
        <thead>
          <tr>
            <th className="py-1">番号</th>
            <th className="p-1">料理名</th>
            <th className="p-1">負担</th>
          </tr>
        </thead>
        <tbody>
          {menus.map((menu) => {
            return (
              <tr key={menu.menuId}>
                <td className="p-1">{menu.menuId}</td>
                <td className="p-1">{omitText(menu.menuName)}</td>
                <td className="p-1">{menu.burdenName}</td>
              </tr>
            )
          })}
        </tbody>
      </table>
    </div>
  )
}
