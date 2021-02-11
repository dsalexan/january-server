const uuid = require('uuid/v4')
const moment = require('moment-timezone')


const {booking} = require('../../database')
const {materias} = require('../../database')

const userDB = require('../../database').user

module.exports.listAll = async function(_, u) {
  const result = await booking.all(1)

  if (!result) return {status: 500}

  return result
}

module.exports.user = async function({user}, u) {
  const id = user === 'me' ? u._id : user

  const result = await booking.byUser(id)

  if (!result) return {status: 500}

  return result
}

module.exports.export = async function() {
  const result = await booking.all(1)

  if (!result) return {success: false}

  const data = [
    ['ID Atividade', 'ID Estudante', 'Estudante', 'Núcleo', 'Atividade', 'Posição na Fila', 'Horário Inscrição'],
    ...result.map((b) => {
      b._dPosition = `${b.position} de ${b.maximum}`
      b._dSubscriptionTime = moment
        .utc(b.timestamp)
        .tz('America/Sao_Paulo')
        .format('HH:mm')

      b._dSubscriptionTimeCalendar = moment
        .utc(b.timestamp)
        .tz('America/Sao_Paulo')
        .fromNow()

      return [b.id_materia, b.student, b.name_student, b.core, b.name_materia, b._dPosition, b._dSubscriptionTime]
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

module.exports.add = async function({user, materia, status = 0, timestamp = null} = {}, _u) {
  const id = user === 'me' ? _u._id : user

  const m = await materias.byId(materia)
  const u = await userDB.byId(id)

  if (m.turmas !== null && !(m.turmas.includes(u.turma))) return {
    status: 401,
    data: {
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

  if (!done) return {status: 500}
  return {
    status: 200,
    data: {student: id, materia, status, timestamp    
    }
  }
}

module.exports.remove = async function({user, materia} = {}, u) {
  const id = user === 'me' ? u._id : user

  const done = await booking.remove(id, materia)

  if (!done) return {status: 500}
  return {
    id, materia    
  }
}