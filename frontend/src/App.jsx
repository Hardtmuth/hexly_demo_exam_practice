import '@mantine/core/styles.css';
import { MantineProvider } from '@mantine/core';
import { HeroPage } from './components/HeroPage.jsx'

const App = () => {
  return (
    <MantineProvider>
     <h1>Hello World</h1>
     <HeroPage />
    </MantineProvider>
  )
}

export default App
