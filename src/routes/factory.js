const {request, restricted} = require('~/utils/route')

module.exports = function factory(routes) {
  const router = require('express').Router()

  routes.forEach(route => {
    if (!route.restricted) router[route.method](route.route, request(route.controller))
    else router[route.method](route.route, restricted, request(route.controller))
  })

  return router
}