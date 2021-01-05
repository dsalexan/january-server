const debug = require('../utils/debug')

const log = debug.extend('pg')

const Pool = require('pg').Pool

function start() {
  log('Opening connection pool to Postgres database')
  const pool = new Pool({
    user: process.env.POSTGRES_USER,
    host: process.env.POSTGRES_HOST,
    database: process.env.POSTGRES_DB,
    password: process.env.POSTGRES_PASSWORD,
    port: process.env.POSTGRES_PORT,
  })

  global.pool = pool

  return global.pool
}

function pg() {
  return global.pool === null ? start() : global.pool
}

function query(statement, data) {
  return new Promise((resolve, reject) => {
    
    pg().query(statement, data, (error, results) => {
      if (error) return reject(error)
      resolve(results.rows)
    })
  })
}

module.exports = {
  start, pg, query
}
