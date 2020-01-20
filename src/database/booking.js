const _ = require('lodash')
const { query } = require('./pg')

function all() {
  return query('SELECT * FROM booking')  
}

async function exists(user, materia) {
  return (await query('SELECT * FROM booking WHERE student = $1 AND materia = $2', [user, materia]))[0] !== undefined
}


async function byUser(id) {
  return await query('SELECT * FROM booking WHERE student = $1', [id])
}

async function byMateria(id) {
  return await query('SELECT * FROM booking WHERE materia = $1', [id])
}

async function byStatus(status) {
  return await query('SELECT * FROM booking WHERE status = $1', [status])
}

// INSERT

async function insert(user, materia, status = 0, timestamp = null) {
  return await query('INSERT INTO booking (student, materia, status, timestamp) \
    VALUES ($1, $2, $3, $4)', [user, materia, status, timestamp])
}


// UPDATE

async function update(user, materia, {status = 0, timestamp = null}) {
  const data = {status, timestamp} // too keep other data from being injected

  const fields = Object.keys(data).filter(k => data[k] !== undefined).map(k => data[k])
  const setFields = Object.keys(data).filter(k => data[k]  !== undefined).map((k, i) => `${k} = $${i + 3}`).join(',')

  return await query(`UPDATE booking SET ${setFields} WHERE student = $1 AND materia = $2`, [user, materia, ...fields])
}

// REMOVE

async function remove(user, materia) {
  return await query('DELETE FROM booking WHERE student = $1 AND materia = $2', [user, materia])
}

module.exports = {
  all,
  exists,
  byUser,
  byMateria,
  byStatus,
  insert,
  update,
  remove
}