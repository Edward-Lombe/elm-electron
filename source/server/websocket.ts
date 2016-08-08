'use strict'

import { Server as WSServer, IServerOptions } from 'ws'
import * as debug from 'debug'
import { Server } from 'http'

const log = debug('elm-electron:server/websockets.ts')

export function initialize(server: Server): void {

  log('Starting web socket server')

  const options: IServerOptions = { server }
  const wsServer = new WSServer(options)

  wsServer.on('error', error => {
    log(`Websocket error ${error}`)
  })

  wsServer.on('close', () => {
    log('Connection closed')
  })

  wsServer.on('connection', client => {

    log('Client connection')

    client.on('message', (data, flags) => {
      if (typeof data === 'string') {
        client.send(data.toUpperCase())
      } else {
        client.send(data)
      }

    })

    client.send('data')
    client.send(JSON.stringify({ complex: 'object' }))

  })

}
