import { Routes, Route } from 'react-router-dom'
import { ListPage } from '../pages/listPage'

export const AppRouter = () => {
  return (
    <Routes>
      <Route path="/list" element={<ListPage />}></Route>
    </Routes>
  )
}
