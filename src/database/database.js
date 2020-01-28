const _ = require('lodash')
const fs = require('fs')
const path = require('path')
const { query } = require('./pg')

async function reset() {
  const create = fs.readFileSync(path.join(__dirname, '../../database/create.sql')).toString()
  await query(create)

  const materias = fs.readFileSync(path.join(__dirname, '../../database/materias.sql')).toString()
  await query(materias)

  return true
}

module.exports = {
  reset
}