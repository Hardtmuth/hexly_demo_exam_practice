import fastify from 'fastify'
import { getCards } from './queries.js'

const server = () => {
  const app = fastify({
    logger: true
  })

  app.get('/', async function handler (request, reply) { 
    return  { hello: 'world' }
  })

  app.get('/api/cards', async (request, reply) => {
    const res = await getCards()
    reply.send(res)
  })

  return app
}

const port = 3000

server().listen({ port })