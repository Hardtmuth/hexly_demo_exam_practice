import '@mantine/core/styles.css';
import { MantineProvider, Container } from '@mantine/core'
import { Header } from './components/Header.jsx'
import { HeroPage } from './components/HeroPage.jsx'
import { CardsGreed } from './components/CardsGreed.jsx'

const App = () => {
  return (
    <MantineProvider>
     <Header />
     <Container size={700}>
      <CardsGreed />
      {/* <HeroPage /> */}
     </Container>
    </MantineProvider>
  )
}

export default App
