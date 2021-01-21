const debug = require('../utils/debug')

const log = debug.extend('pg')

const { Pool } = require('pg')

function start() {
  const pool = new Pool({
    host: process.env.POSTGRES_HOST,
    port: process.env.POSTGRES_PORT,
    user: process.env.POSTGRES_USER,
    password: process.env.POSTGRES_PASSWORD,
    database: process.env.POSTGRES_DB,
  })

  global.pool = pool

  log('Opening connection pool to Postgres database')
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
