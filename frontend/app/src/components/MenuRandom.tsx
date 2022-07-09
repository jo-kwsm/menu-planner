import { useEffect, useContext } from 'react'
import { client } from '../libs/axios'
import { PlanContext } from '../provider/PlanProvider'

const omitText = (text: string): string => {
  if (text.length > 10) {
    return text.substring(0, 7) + '...'
  }
  return text
}

export const MenuRandom = () => {
  const { plans, setPlans } = useContext(PlanContext)

  useEffect(() => {
    client.get('menu/random').then(({ data }) => {
      setPlans(data)
    })
    console.log(plans)
  }, [])

  return (
    <div className="p-4 border border-gray-200 rounded shadow-lg">
      <p className="font-bold mb-2">献立案</p>
      <table className="border-collapse table-auto">
        <thead>
          <tr>
            <th className="py-1">番号</th>
            <th className="p-1">料理名</th>
            <th className="p-1">負担</th>
          </tr>
        </thead>
        <tbody>
          {plans.map((plan, index) => {
            return (
              <tr key={index}>
                <tbody>
                  <tr>
                    <td className="p-1">昼</td>
                    <td className="p-1">{omitText(plan.lunch.menuName)}</td>
                    <td className="p-1">{plan.lunch.burdenName}</td>
                  </tr>
                  <tr>
                    <td className="p-1">夜</td>
                    <td className="p-1">{omitText(plan.dinner.menuName)}</td>
                    <td className="p-1">{plan.dinner.burdenName}</td>
                  </tr>
                </tbody>
              </tr>
            )
          })}
        </tbody>
      </table>
    </div>
  )
}