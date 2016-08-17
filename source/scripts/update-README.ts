'use strict'

import { jd } from './utilities'
import { spawn } from 'child_process'
import * as fsep from 'fs-extra-promise'
import * as debug from 'debug'

const dedent = require('dedent')
const log = debug('elm-electron:scripts/update-README.ts')

debug.enable('*')

updateREADME()

async function updateREADME() {

  const README_PATH = jd('../../README.md')
  const README_BUFFER = await fsep.readFileAsync(README_PATH)
  const README_CONTENTS = README_BUFFER.toString()
  const SOURCE_TREE = await sourceFolderTree()

  const commentMarker = c => `[//]: # (${c})`
  const START_MARKER = commentMarker('START_FILE_STRUCTURE')
  const END_MARKER = commentMarker('END_FILE_STRUCTURE')

  const t = '```'
  const pre =
`
${START_MARKER}

${t}plaintext
${SOURCE_TREE}${t}

${END_MARKER}
`

  const newReadme = replaceBetween(START_MARKER, END_MARKER)(README_CONTENTS, pre)

  await fsep.writeFileAsync(README_PATH, newReadme)

  log('Wrote new README sucessfulyl')

}

function replaceBetween(start: string, end: string) {
  return (replaceString: string, withString: string) => {
    const startIndex = replaceString.indexOf(start)
    const endIndex = replaceString.indexOf(end) + end.length
    return replaceString.slice(0, startIndex)
      + withString
      + replaceString.slice(endIndex)
  }
}

function sourceFolderTree(): Promise<string> {


  const cwd = jd('../../')
  const process = spawn('tree', ['./source'], { cwd })

  return new Promise<string>((resolve, reject) => {
    process.stdout.on('data', data => {
      log('Generate source tree')
      resolve(data.toString())
    })
  })

}

