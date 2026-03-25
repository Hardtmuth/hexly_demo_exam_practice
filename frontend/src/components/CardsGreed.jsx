import { SimpleGrid, Card, Image, Text, Badge, Button, Group, Pagination, Center, Modal, Box } from '@mantine/core'
import { useDisclosure } from '@mantine/hooks'
import { cardsData } from './tempData.js'
import { CardModal } from './CardModal.jsx'

const RenderCard = (cardData) => {
  const [opened, { open, close }] = useDisclosure(false)
  const basePath = new URL('../../img/shoes', import.meta.url).href
  const imgPath = `${basePath}${cardData.photo}`
  // console.log(imgPath)
  return (
    <Box key={cardData.id}>
      <Modal opened={opened} onClose={close} title={`${cardData.brand} ${cardData.model}`}>
        <CardModal cardData={cardData} />
      </Modal>
      <Card shadow="sm" padding="lg" radius="md" withBorder onClick={open}>
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
        <Group justify="space-between">

          <Text size="sm" c="dimmed">
            {cardData.color}

          </Text>
          <Text size="sm">
            {cardData.size}
          </Text>
        </Group>
        <Button color="blue" fullWidth mt="md" radius="md">
          {cardData.price}
          {' '}
          р.
        </Button>
      </Card>
    </Box>
  )
}

const CardsGreed = () => {
  return (
    <>
      <SimpleGrid cols={3} spacing="sm" mb="xl">
        {cardsData.map(RenderCard)}
      </SimpleGrid>
      <Center>
        <Pagination total={10} />
      </Center>
    </>
  )
}

export { CardsGreed }
