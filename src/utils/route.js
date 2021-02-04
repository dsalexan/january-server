const jwt = require('jsonwebtoken')
const { get } = require('lodash')

module.exports.request = function request(controller) {
  return async (req, res, next) => {
    const data = {
      ...(req.query || {}),
      ...(req.body || {}),
      ...(req.params || {})
    }

    const user = req.user || null
    
    const response = await controller(data, user)
    
    if ((response || {}).contentType) {
      res.writeHead(response.status || 200, {
        'Content-Type': response.contentType,
        'Content-Disposition': response.contentDisposition || ''
      })

      if ((response || {}).end) {
        res.end(response.end, 'binary')
      } else {
        res.send(response.data)
      }
    } else if ((response || {}).status) {
      res.status(response.status).send(response.data)
    } else {
      res.status(200).send(response)
    }

    // next()
  }
}

module.exports.authMiddleware = function authMiddleware(req, res, next) {
  var token = req.headers['x-access-token'] || req.query['x-access-token']

  // TODO: remove bypass
  req.user = {
    _id: 'uuid1',
    name: 'Monkey D. Garp',
    email: 'monkey.garp@responsavel.colegioplanck.com.br',
    roles: ['responsavel', 'administracao'],
    students: [
      {
        _id: 'uuid2',
        name: 'Monkey D. Luffy',
        email: 'monkey.luffy@aluno.colegioplanck.com.br',
        turma: 7,
        finished: false,
      },
      {
        _id: 'uuid3',
        name: 'Portgas D. Ace',
        email: 'portgas.ace@aluno.colegioplanck.com.br',
        turma: 10,
        finished: false,
      },
    ],
  }
  req.admin = get(req.user, 'roles', []).includes('administrador')
  return next()

  if (!token) return next()
  
  jwt.verify(token, process.env.SECRET, function(err, decoded) {
    if (err) {
      req.user = null
      return next()
    }
    
    req.user = decoded
    req.admin = get(decoded, 'roles', []).includes('administrador')
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

  // TODO: remove bypass
  req.user = {
    _id: 'uuid1',
    name: 'Monkey D. Garp',
    email: 'monkey.garp@responsavel.colegioplanck.com.br',
    roles: ['responsavel', 'administracao'],
    students: [
      {
        _id: 'uuid2',
        name: 'Monkey D. Luffy',
        email: 'monkey.luffy@aluno.colegioplanck.com.br',
        turma: 7,
        finished: false,
      },
      {
        _id: 'uuid3',
        name: 'Portgas D. Ace',
        email: 'portgas.ace@aluno.colegioplanck.com.br',
        turma: 10,
        finished: false,
      },
    ],
  }
  req.admin = get(req.user, 'roles', []).includes('administrador')
  return next()
  
  if (req.user === undefined) return res.status(401).send({ success: false, message: 'No token provided.' })
  else if (req.user === null) return res.status(500).send({ success: false, message: 'Failed to authenticate token.' })
  else if (!req.admin) return res.status(401).send({ success: false, message: 'Unauthorized resource' })
  else {
    next()
  }
}