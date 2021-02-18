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


// UPDATE

async function update(id, {email, name, parent, parent2, turma, finished}) {
  const data = {name, turma, finished} // too keep other data from being injected

  const fields = await Promise.all(Object.keys(data).filter(k => data[k] !== undefined && data[k] !== null))
  const setFields = Object.keys(data).filter(k => data[k]  !== undefined && data[k] !== null).map((k, i) => `${k} = $${i + 2}`).join(',')

  return await query('UPDATE students SET finished = $2 WHERE _id = $1', [id, finished])
}

module.exports = {
  all,
  byId,
  byEmail,
  byParent,
  update
}