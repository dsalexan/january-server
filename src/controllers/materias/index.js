const uuid = require('uuid/v4')

const {materias} = require('~/database')

module.exports.listAll = async function listAll(_, u) {
  const result = await materias.all()

  // TODO: Add vacancy
  await Promise.all(result.map(async materia => {
    const bookings = await materias.bookingsById(materia._id)    
    materia.bookings = bookings
  }))

  if (!result) return {success: false}

  return {
    success: true,
    data: result
  }
}

module.exports.insert = async function insert({core, name, weekday, starttime, endtime, tags = [], turmas = []} = {}) {
  const id  = uuid()
  const done = await materias.insert(id, core, name, weekday, starttime, endtime, tags, turmas)

  if (!done) return {success: false}
  return {
    success: true,
    data: id
  }
}