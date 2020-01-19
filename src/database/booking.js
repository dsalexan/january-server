const { query } = require('./pg')

function all() {
  return query('SELECT * FROM booking')  
}

async function byUser(id) {
  return (await query('SELECT * FROM booking WHERE user = $1', [id]))[0]
}

async function byMateria(id) {
  return (await query('SELECT * FROM booking WHERE materia = $1', [id]))
}

async function byStatus(status) {
  return (await query('SELECT * FROM booking WHERE status = $1', [status]))
}

// INSERT

async function insert(user, materia, status = 0, timestamp = null) {
  return await query('INSERT INTO booking (user, materia, status, timestamp) \
    VALUES ($2, $3, $4, $5)', [user, materia, status, timestamp])
}


// UPDATE

async function update(id, {user, materia, status = 0, timestamp = null}) {
  const data = {user, materia, status, timestamp} // too keep other data from being injected

  const fields = await Promise.all(Object.keys(data).filter(k => data[k] !== undefined && data[k] !== null))
  const setFields = Object.keys(data).filter(k => data[k]  !== undefined && data[k] !== null).map((k, i) => `${k} = $${i + 2}`).join(',')

  return await query(`UPDATE booking SET ${setFields} WHERE _id = $1`, [id, ...fields])
}

// REMOVE

async function remove(id) {
  return await query('DELETE FROM booking WHERE _id = $1', [id])
}

module.exports = {
  all,
  byUser,
  byMateria,
  byStatus,
  insert,
  update,
  remove
}