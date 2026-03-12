import { SimpleGrid, Card, Image, Text, Badge, Button, Group } from '@mantine/core'
import { cardsData } from './tempData.js'


const renderCard = (cardData) => {
  return (
    <Card shadow="sm" padding="lg" radius="md" withBorder key={cardData.id}>
      <Card.Section>
        <Image
          src="https://raw.githubusercontent.com/mantinedev/mantine/master/.demo/images/bg-8.png"
          height={100}
          alt="Norway"
        />
      </Card.Section>

      <Group justify="space-between" mt="md" mb="xs">
        <Text fw={500}>{cardData.brand}</Text>
        <Badge color="pink">On Sale</Badge>
      </Group>

      <Text size="sm" c="dimmed">
        {cardData.model}
        {cardData.color}
        {cardData.size}
        {cardData.price}
      </Text>

      <Button color="blue" fullWidth mt="md" radius="md">
        Buy now
      </Button>
    </Card>
  )
}


const CardsGreed = () => {
  return (
    <SimpleGrid cols={3} spacing="sm">
      {cardsData.map(renderCard)}
    </SimpleGrid>
  )
}

export { CardsGreed }
