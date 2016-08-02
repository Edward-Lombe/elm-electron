'use strict'

import { join } from 'path'

export function jd(s: string) {
  return join(__dirname, s)
}