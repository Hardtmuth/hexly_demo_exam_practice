import { SimpleGrid, Card, Image, Text, Badge, Button, Group, Pagination, Center, Modal, Box } from '@mantine/core'
import { useDisclosure } from '@mantine/hooks'
// import { cardsData } from './tempData.js'
import { CardModal } from './CardModal.jsx'

import { useEffect, useState } from 'react'
import { useSelector, useDispatch } from 'react-redux'
import { fetchGoods, goodsSelectors } from '../slices/goodsSlice.js'


const RenderCard = ({ cardData, onOpenModal} ) => {
  const basePath = new URL('../../img/shoes', import.meta.url).href
  const imgPath = `${basePath}${cardData.photo}`
  // console.log(imgPath)

  return (
    <Box key={cardData.id}>
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
  const dispatch = useDispatch()
  const goods = useSelector(goodsSelectors.selectEntities)
  const goodsIds = useSelector(goodsSelectors.selectIds)
  const goodsEntities = useSelector(goodsSelectors.selectEntities)
  const goodsList = goodsIds.map(id => goodsEntities[id])
  console.log('goods is: ',goods)

  const [opened, { open, close }] = useDisclosure(false)
  const [selectedCard, setSelectedCard] = useState(null);

  useEffect(() => {
    dispatch(fetchGoods())
  }, [dispatch])

  const handleOpenModal = (cardData) => {
    setSelectedCard(cardData);
    open();
  };

  return (
    <>
      <Modal opened={opened} onClose={close} title={selectedCard ? `${selectedCard.brand} ${selectedCard.model}` : ''}>
        {selectedCard && <CardModal cardData={selectedCard} />}
      </Modal>

      <SimpleGrid cols={3} spacing="sm" mb="xl">
        {goodsList.map((cardData) => (
          <RenderCard
            key={cardData.id}
            cardData={cardData}
            onOpenModal={handleOpenModal}
          />
        ))}
      </SimpleGrid>
      <Center>
        <Pagination total={10} />
      </Center>
    </>
  )
}

export { CardsGreed }
