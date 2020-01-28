const nodemailer = require('nodemailer')

module.exports.send = function(mailOptions = {}) {
  return new Promise((resolve, reject) => {
    const transporter = nodemailer.createTransport({
      service: 'gmail', //tipo de serviço do email
      auth: {
        user: process.env.MAIL_ADDRESS, //endereço do email
        pass: process.env.MAIL_PASSWORD //senha do email 
      }
    })
  
    transporter.sendMail(mailOptions, function(error, info){
      if (error) return reject(error)
  
      return resolve(info)
    })
  })
}