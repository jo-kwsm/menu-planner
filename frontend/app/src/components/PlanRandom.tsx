import { useEffect, useContext } from 'react'
import { client } from '../libs/axios'
import { PlanContext } from '../provider/PlanProvider'

const omitText = (text: string): string => {
  if (text.length > 10) {
    return text.substring(0, 7) + '...'
  }
  return text
}

export const PlanRandom = () => {
  const { plans, setPlans } = useContext(PlanContext)

  useEffect(() => {
    client.get('menu/random').then(({ data }) => {
      setPlans(data)
      console.log(data)
    })
  }, [])

  return (
    <div className="p-4 border border-gray-200 rounded shadow-lg">
      <p className="font-bold mb-2">献立案</p>
      <table className="border-collapse table-auto">
        <thead>
          <tr>
            <th className="py-1"></th>
            <th className="p-1">料理名</th>
            <th className="p-1">負担</th>
          </tr>
        </thead>
        {plans[0] &&
          <tbody>
            <tr>
              <td className="p-1">昼</td>
              <td className="p-1">{omitText(plans[0].lunch.menuName)}</td>
              <td className="p-1">{plans[0].lunch.burdenName}</td>
            </tr>
            <tr>
              <td className="p-1">夜</td>
              <td className="p-1">{omitText(plans[0].dinner.menuName)}</td>
              <td className="p-1">{plans[0].dinner.burdenName}</td>
            </tr>
          </tbody>
        }
      </table>
    </div>
  )
}