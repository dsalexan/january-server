const _ = require('lodash')
const { query } = require('./pg')

function all(status) {
  let q = `
    SELECT U.name AS name_student, B.student, M.core, M.name AS name_materia, B.materia, B.position, M.maximum, B.timestamp
    FROM view_booking B
    LEFT JOIN users U ON B.student = U._id
    LEFT JOIN materias M ON B.materia = M._id
  `

  if (status !== undefined) {
    q += ' WHERE B.status = $1'
  }

  return query(q, [status])
}

async function exists(user, materia) {
  return (await query('SELECT * FROM view_booking WHERE student = $1 AND materia = $2', [user, materia]))[0] !== undefined
}


async function byUser(id) {
  let q = `
    SELECT U.name AS name_student, M.core, M.name AS name_materia, B.*
    FROM view_booking B
    LEFT JOIN users U ON B.student = U._id
    LEFT JOIN materias M ON B.materia = M._id
    WHERE student = $1
  `
  return await query(q, [id])
}

async function byMateria(id) {
  return await query('SELECT * FROM view_booking WHERE materia = $1', [id])
}

async function byStatus(status) {
  return await query('SELECT * FROM view_booking WHERE status = $1', [status])
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