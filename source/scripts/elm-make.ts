'use strict'

/**
 * This script contains the actions to load
 * and compile the Main.elm file in client/elm
 * to a require-able file output to client/elm.js.
 * It also uses the elmx library to do a test
 * compile of the file ElmxTest.x.elm to the file
 * ElmxTest.elm
 */

import { join } from 'path'
import * as fsep from 'fs-extra-promise'
import * as debug from 'debug'

import { jd } from './utilities'

debug.enable('*')

const log = debug('scripts/elm-make.ts')

compile()


/**
 * Compiles the elm and elmx files to their
 * javascript and elm counterparts respectivety
 * 
 * @export
 */
export function compile() {

  const walk = fsep['walk']
  const elmSourceDirectory = jd('../client/elm')
  const walker = walk(elmSourceDirectory)

  walker
    .on('data', data => {
      const x = '.x.elm'
      const { path } = data
      if (path.includes(x)) {
        const outputPath = path.replace(x, '.elm')
        elmxMake(path, outputPath)
      }
    })

  const elmInputFile = jd('../client/elm/Main.elm')
  const elmOutputFile = jd('../client/elm.js')

  elmMake(elmInputFile, elmOutputFile)

}

/**
 * Takes two strings as input and output and then turns them into
 * an output file. Note the extension that you provide as the output
 * string will have an effect on the format of the output
 * 
 * @export
 * @param {string} inputFile
 * @param {string} outputFile
 */
export function elmMake(inputFile: string, outputFile: string): void {

  const elm = require('elm/binwrap')

  const argvCopy = [...process.argv]

  process.argv = [ , , inputFile, '--output', outputFile]

  elm('elm-make')

  process.argv = argvCopy

}

/**
 * Takes two strings and does the elmx to elm transformation to them
 * 
 * @export
 * @param {string} inputFile
 * @param {string} outputFile
 */
export function elmxMake(inputFile: string, outputFile: string): void {

  const elmx = require('elmx')

  const elmxFile = fsep.readFileSync(inputFile).toString()

  const elmSource = elmx(elmxFile)

  fsep.writeFileSync(outputFile, elmSource)

}