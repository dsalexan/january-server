const user = require('./user')
const materias = require('./materias')
const booking = require('./booking')
const database = require('./database')
const emails = require('./emails')
const roles = require('./roles')
const student = require('./student')

module.exports = {
  materias,
  user,
  booking,
  database,
  emails,
  roles,
  student
}