const factory = require('../factory')

const {auth} = require('~/controllers')

module.exports = factory([
  {
    method: 'get',
    route: '/me',
    controller: auth.me,
    restricted: true
  },
  {
    method: 'post',
    route: '/signin',
    controller: auth.signin
  },
  {
    method: 'post',
    route: '/register',
    controller: auth.register
  },
  {
    method: 'put',
    route: '/me',
    controller: auth.change
  },
  {
    method: 'put',
    route: '/me/password',
    controller: auth.changePassword
  }
])