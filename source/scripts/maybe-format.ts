'use strict'

/**
 * This file formats the elm code sometimes,
 * so that it does not trigger an infinite 
 * edit repeat cycle with nodemon (the watch utility)
 */

import { spawn } from 'child_process'
import { jd } from './utilities'
import * as debug from 'debug'

debug.enable('*')

const log = debug('elm-electron:scripts/maybe-format.ts')

soFormatMaybe()

/**
 * Hey I just met you
 * and this is crazy
 * this code is random
 */
function soFormatMaybe() {

  const format = Math.random() < (1 / 4)

  if (!format) {
    return
  }

  log('Formatting code')

  const elmFormatPath = jd('../../binaries/elm-format')
  const elmSourcePath = jd('../client/elm')
  const process = spawn(elmFormatPath, ['--yes', elmSourcePath])
  const handler = d => log(d.toString())

  process.stdout.on('data', handler)

  process.stderr.on('data', handler)

}