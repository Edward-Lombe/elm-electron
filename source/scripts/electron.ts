'use strict'

import { join } from 'path'
import { spawn } from 'child_process'
import * as debug from 'debug'

import * as electronPrebuilt from 'electron-prebuilt'

debug.enable('*')

const log = debug('elm-electron:scripts/electron.ts')
const sourceDirectory = join(__dirname, '../../')
const options = { stdio: 'inherit' }
const process = spawn(electronPrebuilt, [sourceDirectory], options)
