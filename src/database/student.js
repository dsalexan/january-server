const _ = require('lodash')
const { query } = require('./pg')

function all() {
  return query('SELECT * FROM students')
}

async function byId(id) {
  return (await query('SELECT * FROM students WHERE _id = $1', [id]))[0]
}

async function byEmail(email) {
  return (await query('SELECT * FROM students WHERE email = $1', [email]))[0]
}

async function byParent(email) {
  return await query('SELECT * FROM students WHERE parent = $1 OR parent2 = $1', [email])
}

module.exports = {
  all,
  byId,
  byEmail,
  byParent
}