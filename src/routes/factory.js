const {request, restricted, admin} = require('~/utils/route')

module.exports = function factory(routes) {
  const router = require('express').Router()

  routes.forEach(route => {
    if (route.admin) router[route.method](route.route, admin, request(route.controller))
    else if (!route.restricted) router[route.method](route.route, request(route.controller))
    else router[route.method](route.route, restricted, request(route.controller))
  })

  return router
}