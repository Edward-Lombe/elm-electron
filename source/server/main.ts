'use strict'

import * as electron from 'electron'

import * as server from './server'

const { app, BrowserWindow } = electron

server.initialize()

app.on('ready', () => {

  const browserWindow = new BrowserWindow()
  const { webContents } = browserWindow

  webContents.loadURL('http://127.0.0.1:3000')
  webContents.openDevTools()

})
