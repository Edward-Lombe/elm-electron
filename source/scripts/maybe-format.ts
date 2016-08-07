'use strict'

/**
 * This file formats the elm code sometimes,
 * so that it does not trigger an infinite 
 * edit repeat cycle with nodemon (the watch utility)
 */

import { spawn } from 'child_process'
import { jd } from './utilities'
import * as debug from 'debug'
import * as fsep from 'fs-extra-promise'
import * as ms from 'ms'

debug.enable('*')

const log = debug('elm-electron:scripts/maybe-format.ts')

formatByTimestamp()

/**
 * Hey I just met you
 * and this is crazy
 * this code is random
 */
function soFormatDefinitely() {

  log('Formatting code')

  const elmFormatPath = jd('../../binaries/elm-format')
  const elmSourcePath = jd('../client/elm')
  const process = spawn(elmFormatPath, ['--yes', elmSourcePath])
  const handler = d => log(d.toString())

  process.stdout.on('data', handler)

  process.stderr.on('data', handler)

}

function formatByTimestamp() {

  const FIVE_MINUTES = 1000 * 60 * 5
  const timestampPath = jd('timestamp')
  const now = new Date()

  if (fsep.existsSync(timestampPath)) {

    const oldTimestamp = fsep.readFileSync(timestampPath).toString()
    const oldDate = new Date(oldTimestamp)
    const difference = now.valueOf() - oldDate.valueOf()

    if (difference > FIVE_MINUTES) {
      log('Running 5 minute code format')
      updateTimestamp()
      soFormatDefinitely()
    } else {
      log(ms(FIVE_MINUTES - difference) + ' to next format')
      return
    }

  }

  updateTimestamp()

  function updateTimestamp() {
    fsep.writeFileSync(timestampPath, now.toISOString())
  }

}
