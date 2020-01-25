const factory = require('./factory')

const {auth} = require('~/controllers')
const {booking} = require('~/controllers')

module.exports = factory([
  {
    method: 'get',
    route: '/',
    controller: () => {},
    restricted: true
  },
  {
    method: 'post',
    route: '/',
    controller: () => {},
    admin: true
  },
  {
    method: 'get',
    route: '/booking',
    controller: booking.listAll,
    admin: true
  },
  {
    method: 'get',
    route: '/:id',
    controller: auth.me,
    restricted: true
  },
  {
    method: 'put',
    route: '/:id',
    controller: auth.change
  },
  {
    method: 'put',
    route: '/:id/password',
    controller: auth.changePassword
  },
  {
    method: 'get',
    route: '/:user/booking',
    controller: booking.user
  },
  {
    method: 'post',
    route: '/:user/booking',
    controller: booking.add
  },
  {
    method: 'delete',
    route: '/:user/booking/:materia',
    controller: booking.remove
  },
  {
    method: 'get',
    route: '/:user/pages',
    controller: booking.pages
  },
])