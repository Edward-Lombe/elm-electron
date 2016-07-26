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

  const elmInputFile = join(__dirname, '../client/elm/Main.elm')
  const elmOutputFile = join(__dirname, '../client/elm.js')

  const elmxInputFile = join(__dirname, '../client/elm/ElmxTest.x.elm')
  const elmxOutputFile = join(__dirname, '../client/elm/ElmxTest.elm')

  elmxMake(elmxInputFile, elmxOutputFile)
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

  log('reading elmx source file')

  const elmxFile = fsep.readFileSync(inputFile).toString()

  log('compiling elmx file to elm')

  const elmSource = elmx(elmxFile)

  log('successfully compiled elmx file to elm')

  fsep.writeFileSync(outputFile, elmSource)

}