import '@mantine/core/styles.css';
import { MantineProvider } from '@mantine/core';
import { Header } from './components/Header.jsx'
import { HeroPage } from './components/HeroPage.jsx'

const App = () => {
  return (
    <MantineProvider>
     <Header />
     <HeroPage />
    </MantineProvider>
  )
}

export default App
