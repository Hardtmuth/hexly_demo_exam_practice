import '@mantine/core/styles.css'
import { MantineProvider, Container } from '@mantine/core'
import { Header } from './Header.jsx'
import { HeroPage } from './HeroPage.jsx'
import { CardsGreed } from './CardsGreed.jsx'


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
