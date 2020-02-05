const uuid = require('uuid/v4')
const jwt = require('jsonwebtoken')

const {user} = require('~/database')

// eslint-disable-next-line no-unused-vars
module.exports.me = async function me(_, u) {
  const id = _.user === 'me' ? u._id : _.user
  const result = await user.byId(id)

  if (!result) return {success: false}

  const isAdmin = id === 'admin'

  result.pages = [
    {
      route: 'home',
      finished: false
    },
    {
      route: 'reservas',
    },
    {
      route: 'painel',
      icon: 'view-dashboard',
      name: 'Painel',
      label: 'Painel Administrativo',
      admin: true
    }
  ].filter(page => !!page.admin === !!isAdmin).filter(page => page.finished === undefined || page.finished === result.finished)
  result.home = isAdmin ? '/painel' : '/'

  return {
    success: true,
    data: result
  }
}

module.exports.signin = async function({email, password}) {
  const authed = await user.authenticate(email, password)

  if (!authed) return {
    status: 401,
    data: {
      success: false,
      error: 'Credenciais Incorretas'
    }
  }

  const token = jwt.sign({_id: authed._id}, process.env.SECRET, {
    expiresIn: 86400 // expires in 24 hours
  })
  

  return {
    success: true,
    data: {
      token,
    }
  }
}

module.exports.register = async function({email, password, name, turma}) {
  const id  = uuid()
  const done = await user.insert(id, email, password, name, turma)

  if (!done) return {success: false}
  return {
    success: true,
    data: id
  }
}

module.exports.change = async function({email, name, turma, user}, u) {
  const _id = user === 'me' ? u._id : user
  try {
    const done = await user.update(_id, {email, name, turma})

    if (!done) return {success: false, error: 'Unknown Error'}

    return {
      success: true
    }
  } catch(err) {
    return {
      status: 500,
      data: {
        success: false,
        error: err
      }
    }
  }
}

module.exports.changePassword = async function({user, current_password, new_password}, u) {
  const _id = user === 'me' ? u._id : user
  try {
    const matchCurrentPassword = !!(await user.authenticateById(_id, current_password))

    if (!matchCurrentPassword) return {success: false, error: 'Senha atual está incorreta'}

    const done = await user.update(_id, {password: new_password})

    if (!done) return {success: false, error: 'Unknown Error'}

    return {
      success: true
    }
  } catch(err) {
    return {
      status: 500,
      data: {
        success: false,
        error: err
      }
    }
  }
}


module.exports.setFinished = async function(_, u){
  const id = _.user === 'me' ? u._id : _.user
  const result = await user.byId(id)

  const newValue = _.value

  if (!result) return {success: false, error: new Error('Unknown user')}

  await user.update(id, {finished: newValue})

  return {
    success: true,
    data: {
      result,
      finished: newValue
    }
  }
}

module.exports.finished = async function(_, u){
  const id = _.id === 'me' ? u._id : _.id
  const result = await user.byId(id)

  if (!result) return {success: false}  

  return {
    success: true,
    data: result.finished
  }
}