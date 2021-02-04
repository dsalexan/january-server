const uuid = require('uuid/v4')
const moment = require('moment-timezone')

const {materias, booking} = require('../../database')
const {CustomError} = require('../../utils/error')

module.exports.listAll = async function listAll(_, u) {
  const result = await materias.all()

  // TODO: Add vacancy
  await Promise.all(result.map(async materia => {
    const bookings = await materias.bookingsById(materia._id)    
    materia.bookings = bookings
  }))

  if (!result) throw CustomError('Server Error', 'Não foi possível retornar a lista de matérias.', 500)

  return result
}

module.exports.insert = async function insert(params = {}) {
  const {core, name, weekday, starttime, endtime, maximum = null, minimum = null, credit = 1, tags = [], turmas = []} = params
  const id  = uuid()
  const done = await materias.insert(id, core, name, weekday, starttime, endtime, maximum, minimum, credit, tags, turmas)

  if (!done)throw CustomError('Server Error', 'Não foi possível inserir uma nova matéria.', 500, params)
  return id
}

module.exports.export = async function() {
  const materias = await materias.all()
  const bookings = await booking.all(1)

  if (!materias || !bookings) return {success: false}

  const data = [
    ['ID Estudante', 'Estudante', 'Núcleo', 'Atividade', 'Posição na Fila', 'Horário Inscrição'],
    ...bookings.map((b) => {
      b._dPosition = `${b.position} de ${b.maximum}`
      b._dSubscriptionTime = moment
        .utc(b.timestamp)
        .tz('America/Sao_Paulo')
        .format('HH:mm')

      b._dSubscriptionTimeCalendar = moment
        .utc(b.timestamp)
        .tz('America/Sao_Paulo')
        .fromNow()

      return [b.student, b.name_student, b.core, b.name_materia, b._dPosition, b._dSubscriptionTime]
    })
  ]

  let csv = ''
  data.forEach(function(infoArray, index){
    var dataString = infoArray.join(',')
    csv += index < data.length ? dataString+ '\n' : dataString
  }) 

  const name = moment.tz('America/Sao_Paulo').format('DDMMYYYY_hhmmss')

  return {
    status: 200,
    contentType: 'text/csv',
    contentDisposition: `attachment; filename=painel_export_${name}.csv`,
    end: csv
  }
}