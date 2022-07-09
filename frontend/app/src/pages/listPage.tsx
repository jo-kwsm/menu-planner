import { Header } from '../components/Header'
import { MenuList } from '../components/MenuList'
import { MenuProvider } from '../provider/MenuProvider'

export const ListPage = () => {
  return (
    <div className="w-128 mx-auto my-20">
      <Header />
      <MenuProvider>
        <MenuList />
      </MenuProvider>
    </div>
  )
}
