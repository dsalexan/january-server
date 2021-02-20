const uuid = require('uuid/v4')
const moment = require('moment-timezone')

const {materias, booking} = require('../../database')
const {CustomError} = require('../../utils/error')

const _ = require('lodash')
const { get } = require('lodash')

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
  const allMaterias = await materias.all()
  const bookings = await booking.all([1, 2])

  if (!allMaterias || !bookings) return {success: false}

  const bookingsByMaterias = _(bookings || [])
    .groupBy('id_materia')
    .value()

  const data = [
    ['ID Atividade', 'Atividade', 'Núcleo', 'Mínimo', 'Máximo', 'Inscritos', 'Dia da Semana', 'Inicio', 'Termino'],
    ...allMaterias.map((materia) => {
      const bookings = get(bookingsByMaterias, get(materia, '_id'), [])

      return [get(materia, 'id'), 
        get(materia, 'name'), 
        get(materia, 'core'), 
        get(materia, 'minimum'), 
        get(materia, 'maximum'), 
        parseInt(get(materia, 'inscritos')) + bookings.length, 
        get(materia, 'weekday', []).map(weekday => ['Domingo', 'Segunda', 'Terça', 'Quarta', 'Quinta', 'Sexta', 'Sábado'][weekday]).join('/'),
        get(materia, 'starttime', []).join('/'),
        get(materia, 'endtime', []).join('/')
      ]
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
    contentDisposition: `attachment; filename=painel_materias_export_${name}.csv`,
    end: csv
  }
}