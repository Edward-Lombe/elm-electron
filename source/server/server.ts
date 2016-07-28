'use strict'

/**
 * This file is responsible for handling the http request made
 * from the client. It serves the node_modules and renders
 * the react root
 */

import { join } from 'path'
import { readFileSync } from 'fs'
import * as Koa from 'koa'
import * as mount from 'koa-mount'
import * as serve from 'koa-static'
import * as debug from 'debug'
import * as http from 'http'
import { renderToString } from 'react-dom/server'
import { createElement } from 'react'

import HTMLPage from '../client/react-components/html-page'

const log = debug('elm-electron:server/server.ts')

export const app = new Koa()

export function initialize() {

  const httpServer = http.createServer(app.callback())

  log('Starting HTTP server')

  // We serve the root of the application at the moment
  app.use(mount('/', serveRoot()))

  // Renders the main html wrapper for the index
  app.use(context => {

    context.body = '<!DOCTYPE html>' + renderToString(createElement(HTMLPage))

  })

  httpServer.listen(3000)

}

function serveRoot() {

  const root = join(__dirname, '../../')

  return async function (context: Koa.Context, next: () => any) {
    return serve(root, { maxage: 0 })(context, next)
  }

}
