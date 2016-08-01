'use strict'

import { join } from 'path'

export function j_d(s: string) {
  return join(__dirname, s)
}