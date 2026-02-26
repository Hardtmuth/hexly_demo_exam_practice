import fastify from 'fastify'

const server = () => {
  const app = fastify({
    logger: true
  })

  app.get('/', async function handler (request, reply) {
  return { hello: 'world' }
  })

  return app
}

const port = 3000

server().listen({ port })