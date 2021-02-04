const uuid = require('uuid/v4')
const jwt = require('jsonwebtoken')

const {pick, get, isNil} = require('lodash')

const {roles, student} = require('../../database')

const {OAuth2Client} = require('google-auth-library')

// eslint-disable-next-line no-unused-vars
module.exports.me = async function me(params, u) {
  let result

  if (params.user === 'me') {
    const children = await student.byParent(u.email)
    
    result = {
      email: get(children, '0.parent'),
      students: children
    }
  } else {
    const student = await student.byId(params.user)

    result = {
      name: get(student, 'name'),
      email: get(student, 'email'),
      students: [student]
    }
  }

  if (!result) return {success: false}

  if (params.user === 'me' && u.google) {
    const client = new OAuth2Client(process.env.GOOGLE_CLIENT_ID)
    const ticket = await client.verifyIdToken({
      idToken: u.google,
      audience: process.env.GOOGLE_CLIENT_ID,
    })

    const payload = ticket.getPayload()

    result.name = get(payload, 'name', 'Convidado')
  }

  if (isNil(result.name)) result.name = 'Tarcisio Rodrigues'

  const role = get(await roles.byEmail(result.email), 'roles', '').split(',')
  const isAdmin = false && role.includes('admin') // TODO: remover o false para o prod, isso é pra teste de 28/01
  result.finished = false // TODO: tb remover depois do teste

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
  ]//.filter(page => !!page.admin === !!isAdmin).filter(page => page.finished === undefined || page.finished === result.finished)
  result.home = isAdmin ? '/painel' : '/'

  return {
    success: true,
    data: result
  }
}

module.exports.signin = async function({email, password, token: googleToken}) {
  if (googleToken) {
    const client = new OAuth2Client(process.env.GOOGLE_CLIENT_ID)
    const ticket = await client.verifyIdToken({
      idToken: googleToken,
      audience: process.env.GOOGLE_CLIENT_ID,
    })
    const payload = ticket.getPayload()

    let authed = await user.byEmail(payload.email)


    if (!authed) {
      // criar usuário no banco se não existe
      const id = uuid()
      await user.insert(id, payload.email, null, null)
      authed = {
        _id: id
      }
    }

    // TODO: procurar no banco por esse usuário, e o estudante vinculado à ele
    
    const token = jwt.sign({...pick(authed, '_id'), google: googleToken}, process.env.SECRET, {
      expiresIn: 4 * 60 * 60 // expires in 4 hours
    })
  

    return {
      success: true,
      data: {
        token,
      }
    }
  }
  else {
    const authed = (await student.byParent(email))[0]

    if (!authed) return {
      status: 401,
      data: {
        error: 'Credenciais Incorretas'
      }
    }

    const token = jwt.sign({email}, process.env.SECRET, {
      expiresIn: 86400 // expires in 24 hours
    })
  

    return {
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