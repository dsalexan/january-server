const { query } = require('./pg')

function all() {
  return query('SELECT * FROM materias')  
}

async function byId(id) {
  return (await query('SELECT * FROM materias WHERE _id = $1', [id]))[0]
}

async function byCore(core) {
  return (await query('SELECT * FROM users WHERE core = $1', [core]))
}

async function bookingsById(id) {
  return await query('SELECT * FROM booking WHERE materia = $1', [id])
}

// INSERT

async function insert(id, core, name, weekday, starttime, endtime, maximum = null, tags = [], turmas = []) {
  return await query('INSERT INTO materias (_id, core, name, weekday, starttime, endtime, maximum, tags, turmas) \
    VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9)', [id, core, name, weekday, starttime, endtime, maximum, tags, turmas])
}


// UPDATE

async function update(id, {core, name, weekday, starttime, endtime, maximum, tags = [], turmas = []}) {
  const data = {core, name, weekday, starttime, endtime, maximum, tags, turmas} // too keep other data from being injected

  const fields = await Promise.all(Object.keys(data).filter(k => data[k] !== undefined && data[k] !== null))
  const setFields = Object.keys(data).filter(k => data[k]  !== undefined && data[k] !== null).map((k, i) => `${k} = $${i + 2}`).join(',')

  return await query(`UPDATE materias SET ${setFields} WHERE _id = $1`, [id, ...fields])
}

// REMOVE

async function remove(id) {
  return await query('DELETE FROM materias WHERE _id = $1', [id])
}

module.exports = {
  all,
  byId,
  byCore,
  bookingsById,
  insert,
  update,
  remove
}