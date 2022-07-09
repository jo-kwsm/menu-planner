import { Routes, Route } from 'react-router-dom'
import { ListPage } from '../pages/listPage'
import { RandomPage} from '../pages/randomPage'

export const AppRouter = () => {
  return (
    <Routes>
      <Route path="/list" element={<ListPage />} />
      <Route path="/random" element={<RandomPage />} />
    </Routes>
  )
}
