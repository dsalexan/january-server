const uuid = require('uuid/v4')

const {booking} = require('~/database')

module.exports.user = async function({user}, u) {
  const id = user === 'me' ? u._id : user

  const result = await booking.byUser(id)

  if (!result) return {success: false}

  return {
    success: true,
    data: result
  }
}

module.exports.add = async function({user, materia, status = 0, timestamp = null} = {}, u) {
  const id = user === 'me' ? u._id : user

  const doExists = await booking.exists(id, materia)

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