import { SimpleGrid, Card, Image, Text, Badge, Button, Group, Pagination, Center } from '@mantine/core'
import { useEffect } from 'react'
import { cardsData } from './tempData.js'

const renderCard = (cardData) => {
  const basePath = new URL('../../img/shoes', import.meta.url).href;
  const imgPath = `${basePath}${cardData.photo}`;
  // console.log(imgPath)
  return (
    <Card shadow="sm" padding="lg" radius="md" withBorder key={cardData.id}>
      <Card.Section>
        <Image
          src={imgPath}
          height={120}
          alt={cardData.model}
        />
      </Card.Section>

      <Group justify="space-between" mt="md">
        <Text fw={500}>{cardData.model}</Text>
        <Badge color="pink">{cardData.brand}</Badge>
      </Group>
      <Group justify="space-between" >
        
      <Text size="sm" c="dimmed">
        {cardData.color}

      </Text>
      <Text size="sm">
        {cardData.size}
      </Text>
      </Group>
      <Button color="blue" fullWidth mt="md" radius="md">
        {cardData.price} р.
      </Button>
    </Card>
  )
}


const CardsGreed = () => {
  return (
    <>
    <SimpleGrid cols={3} spacing="sm" mb="xl">
      {cardsData.map(renderCard)}
    </SimpleGrid>
    <Center>
      <Pagination total={10} />
    </Center>
    </>
  )
}

export { CardsGreed }
