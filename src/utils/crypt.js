const simplecrypt = require('simplecrypt')({
  password: process.env.SECRET
})

function hashPassword(password) {
  return simplecrypt.encrypt(password)
  // return bcrypt.hash(password, 10)
}

module.exports = {
  hashPassword
}