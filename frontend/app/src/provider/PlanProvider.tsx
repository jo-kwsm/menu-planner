import {
    createContext,
    ReactNode,
    useState,
    Dispatch,
    SetStateAction,
  } from 'react'
  import { PlanType } from '../types'
  
  interface PropType {
    children: ReactNode
  }
  
  interface ProviderType {
    plans: PlanType[]
    setPlans: Dispatch<SetStateAction<PlanType[]>>
  }
  
  export const PlanContext = createContext<ProviderType>({} as ProviderType)
  
  export const PlanProvider = (props: PropType) => {
    const { children } = props
  
    const [plans, setPlans] = useState<PlanType[]>([])
  
    return (
      <PlanContext.Provider value={{ plans, setPlans }}>
        {children}
      </PlanContext.Provider>
    )
  }
