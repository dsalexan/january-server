const jwt = require('jsonwebtoken')

module.exports.request = function request(controller) {
  return async (req, res, next) => {
    const data = {
      ...(req.query || {}),
      ...(req.body || {}),
      ...(req.params || {})
    }

    const user = req.user || null
    
    const response = await controller(data, user)
    
    if ((response || {}).status) {
      res.status(response.status).send(response.data)
    } else {
      res.status(200).send(response)
    }

    // next()
  }
}

module.exports.authMiddleware = function authMiddleware(req, res, next) {
  var token = req.headers['x-access-token']
  if (!token) return next()
  
  jwt.verify(token, process.env.SECRET, function(err, decoded) {
    if (err) {
      req.user = null
      return next()
    }
    
    req.user = decoded
    req.admin = req.user._id === 'admin'
    next()
  })
}

module.exports.restricted = function restricted(req, res, next) {
  if (req.user === undefined) return res.status(401).send({ success: false, message: 'No token provided.' })
  else if (req.user === null) return res.status(500).send({ success: false, message: 'Failed to authenticate token.' })
  else {
    next()
  }
}

module.exports.admin = function admin(req, res, next) {
  if (req.user === undefined) return res.status(401).send({ success: false, message: 'No token provided.' })
  else if (req.user === null) return res.status(500).send({ success: false, message: 'Failed to authenticate token.' })
  else if (req.admin === false) return res.status(401).send({ success: false, message: 'Unauthorized resource' })
  else {
    next()
  }
}