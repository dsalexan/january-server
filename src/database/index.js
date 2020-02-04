const user = require('./user')
const materias = require('./materias')
const booking = require('./booking')
const database = require('./database')
const emails = require('./emails')

module.exports = {
  materias,
  user,
  booking,
  database,
  emails
}