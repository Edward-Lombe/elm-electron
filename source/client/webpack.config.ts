'use strict'

import { join } from 'path'

module.exports = {
  entry: join(__dirname, 'main.ts'),
  output: {
    filename: join(__dirname, '../../distribution/main.js')
  },
  resolve: {
    // Add `.ts` and `.tsx` as a resolvable extension.
    extensions: ['', '.webpack.js', '.web.js', '.ts', '.tsx', '.js']
  },
  module: {
    loaders: [
      // all files with a `.ts` or `.tsx` extension will be handled by `ts-loader`
      { test: /\.tsx?$/, loader: 'ts-loader' }
    ]
  }
}