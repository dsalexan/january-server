const _ = require('lodash')
const { query } = require('./pg')

function all() {
  return query('SELECT * FROM roles')
}

async function byEmail(email) {
  return (await query('SELECT * FROM roles WHERE email = $1', [email]))[0]
}


module.exports = {
  all,
  byEmail
}