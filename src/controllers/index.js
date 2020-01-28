const fs = require('fs')
const auth = require('./auth')
const materias = require('./materias')
const booking = require('./booking')
const users = require('./users')

const {database} = require('~/database')

module.exports = {
  auth,
  materias,
  booking,
  users,
  database: {
    reset: async function() {
      await database.reset()
    }
  }
}