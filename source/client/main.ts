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
import * as PouchDB from 'pouchdb'
import * as fetch from 'isomorphic-fetch'

render()

testCouchDB()

function render() {

  const Elm = require('react-elm-components')
  const { Main } = require('./elm')
  const rootElement = document.getElementById('root')
  const props = { src: Main }
  const reactElement = React.createElement(Elm, props)

  ReactDOM.render(reactElement, rootElement)

}

async function testCouchDB() {

  const DATABASE_URL = 'http://52.62.108.14:5984/test'

  const canGet = await fetch(DATABASE_URL)
  console.log(canGet)

  const pouchDB = new PouchDB(DATABASE_URL)
  const doc = await pouchDB.get('myJam')

  Object.assign(doc, { newKey: 'value', time: new Date().toISOString() })

  const update = await pouchDB.put(doc)

  console.log(doc, update)

}

function setupPorts(ports) {

  ports.testPort.subscribe(a => console.log(a))

}