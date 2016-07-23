'use strict'

import * as React from 'react'
import * as ReactDOM from 'react-dom'

const Elm = require('react-elm-components')
const { Main } = require('./elm')
const rootElement = document.getElementById('root')
const reactElement = React.createElement(Elm, { src: Main })

ReactDOM.render(reactElement, rootElement)
