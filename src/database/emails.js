const _ = require('lodash')
const { query } = require('./pg')

function all(status) {
  return query('SELECT * FROM view_email')
}


async function byUser(id) {
  return query('SELECT * FROM view_email WHERE student = $1', [id])
}


// INSERT

async function insert(user, timestamp = new Date()) {
  return await query('INSERT INTO email (student, timestamp) \
    VALUES ($1, $2)', [user, timestamp])
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
  byUser,
  insert,
  update,
  remove
}