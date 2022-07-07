import {
  createContext,
  ReactNode,
  useState,
  Dispatch,
  SetStateAction,
} from 'react'
import { MenuType } from '../types'

interface PropType {
  children: ReactNode
}

interface ProviderType {
  menus: MenuType[]
  setMenus: Dispatch<SetStateAction<MenuType[]>>
}

export const MenuContext = createContext<ProviderType>({} as ProviderType)

export const MenuProvider = (props: PropType) => {
  const { children } = props

  const [menus, setMenus] = useState<MenuType[]>([])

  return (
    <MenuContext.Provider value={{ menus, setMenus }}>
      {children}
    </MenuContext.Provider>
  )
}
