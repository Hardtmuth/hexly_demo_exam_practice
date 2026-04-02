import fastify from 'fastify'
import { getCards } from './queries.js'


const apiPath = '/api/v1'
const getPath = (keyword) => [apiPath, keyword].join('/')

const server = () => {
  const app = fastify({
    logger: true
  })

  app.get(apiPath, async function handler (request, reply) { 
    return  { hello: 'world' }
  })

  app.get(getPath('goods'), async (request, reply) => {
    const res = await getCards()
    reply.send(res)
  })

  return app
}

const port = 3000

server().listen({ port })