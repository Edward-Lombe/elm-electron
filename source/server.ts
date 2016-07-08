'use strict'

import { join } from 'path'
import { readFileSync } from 'fs'
import * as Koa from 'koa'
import * as mount from 'koa-mount'
import * as serve from 'koa-static'
import * as debug from 'debug'

const log = debug('elm-electron:server.ts')

export const app = new Koa()

export function initialize() {

  log('Starting HTTP server')

  app.use(mount('/', serveRoot()))

  app.listen(3000)

  return Promise.resolve()

}

function serveRoot() {

  const root = join(__dirname, '../')

  return async function (context: Koa.Context, next: () => any) {
    return serve(root)(context, next)
  }

}
