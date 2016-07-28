'use strict'

/**
 * This file is the main line for the actual electron app.
 * It is what starts the http server and points a new
 * window to the index
 */

import * as electron from 'electron'
import * as debug from 'debug'

import * as server from './server'

const log = debug('elm-electron:server/main.ts')

const { app, BrowserWindow } = electron

server.initialize()

app.on('ready', () => {

  log('Opening main app window')

  const options: Electron.BrowserWindowOptions = {
    width: 1024,
    height: 768,
    minWidth: 600,
    minHeight: 400
  }
  const browserWindow = new BrowserWindow(options)
  const { webContents } = browserWindow

  webContents.openDevTools()
  webContents.loadURL('http://127.0.0.1:3000')

  if (process.env.NODE_ENV === 'development') {
    webContents.openDevTools()
  }

})
