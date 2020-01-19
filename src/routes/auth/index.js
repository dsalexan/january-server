const factory = require('../factory')

const {auth} = require('~/controllers')

module.exports = factory([
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
])