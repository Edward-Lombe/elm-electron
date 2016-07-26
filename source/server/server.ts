'use strict'

import { join } from 'path'
import { readFileSync } from 'fs'
import * as Koa from 'koa'
import * as mount from 'koa-mount'
import * as serve from 'koa-static'
import * as debug from 'debug'
import * as http from 'http'
import { renderToString } from 'react-dom/server'
import { createElement } from 'react'

import HTMLPage from '../client/components/html-page'

const log = debug('elm-electron:server.ts')

export const app = new Koa()

export function initialize() {

  const httpServer = http.createServer(app.callback())

  log('Starting HTTP server')

  app.use(mount('/', serveRoot()))

  app.use(context => {

    if (context.path === '/') {
      context.body = '<!DOCTYPE html>' + renderToString(createElement(HTMLPage))
    }

  })

  httpServer.listen(3000)

  return Promise.resolve()

}

function serveRoot() {

  const root = join(__dirname, '../../')

  return async function (context: Koa.Context, next: () => any) {
    return serve(root, { maxage: 0 })(context, next)
  }

}
