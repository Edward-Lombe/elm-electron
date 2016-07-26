'use strict'

/**
 * This file is the top level react wrapper
 * that uses the react-elm-components library
 * to place the Main.elm file into the top level
 * root node specified on the page. This allows us
 * to handle HTML meta.
 */

import * as React from 'react'
import * as ReactDOM from 'react-dom'

const Elm = require('react-elm-components')
const { Main } = require('./elm')
const rootElement = document.getElementById('root')
const props = { src: Main }
const reactElement = React.createElement(Elm, props)

ReactDOM.render(reactElement, rootElement)
