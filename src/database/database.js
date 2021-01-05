const _ = require('lodash')
const fs = require('fs')
const path = require('path')
const { query } = require('./pg')

async function reset() {
  const create = fs.readFileSync(path.join(__dirname, '../../database/create.sql')).toString()
  await query(create)

  const load = fs.readFileSync(path.join(__dirname, '../../db/load.sql')).toString()
  await query(load)

  return true
}

module.exports = {
  reset
}