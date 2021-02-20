const factory = require('./factory')

const {materias} = require('../controllers')

module.exports = factory([
  {
    method: 'get',
    route: '/',
    controller: materias.listAll,
    restricted: true
  },
  {
    method: 'post',
    route: '/',
    controller: materias.insert,
    admin: true
  },
  {
    method: 'get',
    route: '/export',
    controller: materias.export,
    admin: true
  },
])