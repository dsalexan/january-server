const simplecrypt = require('simplecrypt')({
  password: process.env.SECRET
})
const { query } = require('./pg')
const { hashPassword } = require('../utils/crypt')

async function authenticate(email, password) {
  const result = (await query('SELECT * FROM users WHERE email = $1', [
    email
  ]))[0]

  if (!result) return result
  
  if (password === simplecrypt.decrypt(result.password)) {
  // if (await bcrypt.compare(password, result.password)) {
    delete result.password
    return result
  } else {
    return undefined
  }
}
async function authenticateById(id, password) {
  const result = (await query('SELECT * FROM users WHERE _id = $1', [
    id
  ]))[0]

  if (!result) return result

  if (password === simplecrypt.decrypt(result.password)) {
  // if (await bcrypt.compare(password, result.password)) {
    delete result.password
    return result
  } else {
    return undefined
  }
}

async function byId(id) {
  const user = (await query('SELECT * FROM users WHERE _id = $1', [id]))[0]
  if (user) delete user.password
  return user
}

async function byEmail(email) {
  const user = (await query('SELECT * FROM users WHERE email = $1', [email]))[0]
  if (user) delete user.password
  return user
}

// INSERT

async function insert(id, email, student, turma) {
  return await query('INSERT INTO users (_id, email, student, turma) \
    VALUES ($1, $2, $3, $4)', [id, email, student, turma])
}


// UPDATE

async function update(id, {email, student, turma, finished}) {
  const data = {email, student, turma, finished} // too keep other data from being injected

  const fields = await Promise.all(Object.keys(data).filter(k => data[k] !== undefined && data[k] !== null).map(async (k) => {
    if (k === 'password') {
      return await hashPassword(data[k])
    } else {
      return data[k]
    }
  }))
  const setFields = Object.keys(data).filter(k => data[k]  !== undefined && data[k] !== null).map((k, i) => `${k} = $${i + 2}`).join(',')

  return await query(`UPDATE users SET ${setFields} WHERE _id = $1`, [id, ...fields])
}

module.exports = {
  authenticate,
  authenticateById,
  byId,
  byEmail,
  insert,
  update
}