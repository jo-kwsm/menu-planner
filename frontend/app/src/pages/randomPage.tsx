import { Header } from '../components/Header'
import { PlanRandom } from '../components/PlanRandom'
import { PlanProvider } from '../provider/PlanProvider'

export const RandomPage = () => {
  return (
    <div className="w-128 mx-auto my-20">
      <Header />
      <PlanProvider>
        <PlanRandom />
      </PlanProvider>
    </div>
  )
}
