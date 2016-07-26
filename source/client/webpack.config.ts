'use strict'

/**
 * This file contains all of the configuration required for
 * webpack to produce a single script-requireable file that
 * can be consumed by the browser
 */

import { join } from 'path'

// The main entry point to our application
const entry = join(__dirname, 'main.ts')

// The output filename, this is the file included via a script tag
const filename = join(__dirname, '../../distribution/main.js')
const output = { filename }

// The list of file extensions webpack can resolve without specfiying the extension
const extensions = ['', '.webpack.js', '.web.js', '.ts', '.tsx', '.js']
const resolve = { extensions }

// Handles the typescript compilation for us
const loaders = [
  { test: /\.tsx?$/, loader: 'ts-loader' }
]

module.exports = { entry, output, resolve, module: { loaders } }
