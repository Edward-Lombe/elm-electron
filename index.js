'use strict'

/**
 * This is our electron entry point that
 * sets up the typescript compilation
 * for initialisation of the electron app
 * using the ts-node library
 */

require('ts-node/register')
require('./source/server/main')
