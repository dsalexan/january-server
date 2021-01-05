require('./utils/string')

// importing the dependencies
const express = require('express')
const bodyParser = require('body-parser')
const cors = require('cors')
const helmet = require('helmet')
const morgan = require('morgan')

const { authMiddleware } = require('./utils/route')
const routes = require('./routes')
const database = require('./database/pg')

const debug = require('./utils/debug')

// defining the Express app
const app = express()

// adding Helmet to enhance your API's security
app.use(helmet())

// using bodyParser to parse JSON bodies into JS objects
app.use(bodyParser.urlencoded({ extended: true }))
app.use(bodyParser.json())

// enabling CORS for all requests
app.use(cors())

// adding morgan to log HTTP requests
app.use(morgan('combined'))

app.get('/', (req, res) => {
  res.send('OK')
})

// ROUTES
app.use(authMiddleware)

app.use('/assets', express.static('src/assets'))

app.use('/auth', routes.auth)
app.use('/materias', routes.materias)
app.use('/', routes.user)

database.start()

// starting the server
app.listen(process.env.PORT, '0.0.0.0', () => {
  debug(`Listening at http://localhost:${process.env.PORT}`)
})   