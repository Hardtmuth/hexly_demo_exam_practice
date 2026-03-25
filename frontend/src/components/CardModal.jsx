import { Grid, Image, Text, Badge, Button, Box } from '@mantine/core'

const CardModal = ({ cardData }) => {
  // console.log(data)
  const basePath = new URL('../../img/shoes', import.meta.url).href
  const imgPath = `${basePath}${cardData.photo}`
  return (
    <Box>
      <Grid>
        <Grid.Col span={7}>
          <Image
            src={imgPath}
            height={160}
            alt={imgPath}
          />
        </Grid.Col>
        <Grid.Col span={3}>
          <Text fw={500}>
            Color:
            {cardData.color}
          </Text>
          <Text fw={500}>
            Size:
            {cardData.size}
          </Text>
          <Badge color="pink">
            {cardData.price}
            {' '}
            р.
          </Badge>
        </Grid.Col>
      </Grid>
      <Button color="blue" fullWidth mt="md" radius="md">
        Add to Cart
      </Button>
    </Box>
  )
}

export { CardModal }
