const uuid = require('uuid/v4')

const {booking} = require('~/database')
const {materias} = require('~/database')
const userDB = require('~/database').user

module.exports.user = async function({user}, u) {
  const id = user === 'me' ? u._id : user

  const result = await booking.byUser(id)

  if (!result) return {success: false}

  return {
    success: true,
    data: result
  }
}

module.exports.add = async function({user, materia, status = 0, timestamp = null} = {}, _u) {
  const id = user === 'me' ? _u._id : user

  const m = await materias.byId(materia)
  const u = await userDB.byId(id)

  if (m.turmas !== null && !(m.turmas.includes(u.turma))) return {
    status: 401,
    data: {
      success: false,
      error: 'Você não pertence às turmas permitidas para essa atividade'
    }
  }

  const doExists = await booking.exists(id, materia)

  if (status === 1) timestamp = new Date()

  let done = false
  if (!doExists) {
    done = await booking.insert(id, materia, status, timestamp)
  } else {
    done = await booking.update(id, materia, {status, timestamp})
  }

  if (!done) return {success: false}
  return {
    success: true,
    data: {
      id, materia, status, timestamp
    }
  }
}

module.exports.remove = async function({user, materia} = {}, u) {
  const id = user === 'me' ? u._id : user

  const done = await booking.remove(id, materia)

  if (!done) return {success: false}
  return {
    success: true,
    data: {
      id, materia
    }
  }
}