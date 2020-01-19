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

module.exports.add = async function insert({user, materia, status = 0, timestamp = null} = {}) {
  const done = await booking.insert(user, materia, status, timestamp)

  if (!done) return {success: false}
  return {
    success: true,
    data: {
      user, materia, status, timestamp
    }
  }
}