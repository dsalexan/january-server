const nodemailer = require('nodemailer')

const Database = require('~/database')
const _ = require('lodash')
const format = require('string-format')
const fs = require('fs')
const path = require('path')

const mailService = require('~/services/mail')

async function mailOne({user}, u) {
  const [target, bookings] = await Promise.all([Database.user.byId(user), Database.booking.byUser(user)])

  const modelHeader = fs.readFileSync(path.join(__dirname, './header.html')).toString()
  const modelBooking = fs.readFileSync(path.join(__dirname, './booking.html')).toString()
  const modelFooter = fs.readFileSync(path.join(__dirname, './footer.html')).toString()

  let text = format(modelHeader, {
    user: target
  })
  text += bookings.map(booking => {
    booking._dWeekday = booking.weekday.toString().toWeekday()
    booking._dStartTime = booking.starttime.map((time) => this.$moment('2019-01-19 ' + time).format('HH:mm'))
    booking._dEndTime = booking.endtime.map((time) => this.$moment('2019-01-19 ' + time).format('HH:mm'))
    booking._dFullTime = booking.weekday.map((_, i) => `${booking._dWeekday[i]}, ${booking._dStartTime[i]} as ${booking._dEndTime[i]}`).join(' e ')

    format(modelBooking, { user: target, booking })
  }).join('\n')
  text += format(modelFooter, { user: target })

  try {
    const info = await mailService.send({
      from: process.env.MAIL_ADDRESS,
      to: `${target.email}, ${process.env.MAIL_ADDRESS}`,
      subject: 'Confirmação de Rematrícula - Colégio Planck',
      html: text
    })
    
    if (info.accepted.length < 2) {
      const missingTarget = info.accepted.includes(target.mail) ? [] : [target.mail]
      const missingPlanck = info.accepted.includes(process.env.MAIL_ADDRESS) ? [] : [process.env.MAIL_ADDRESS]

      throw new Error(`Erro ao enviar email para <${[missingPlanck, missingTarget].flat(1).join(', ')}>`)
    }

    await Database.emails.insert(user, new Date())

    return {
      success: true,
      data: info.response
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


async function mail({users}, u) {
  const _users = _.isArray(users) ? users : [users]

  const results = await Promise.all(_users.map(async user => await mailOne({user}, u)))

  const overallSuccess = results.filter(result => (result.data || result).success === false).length === 0

  return {
    success: overallSuccess,
    data: results
  }
}

async function listMails(_, u) {
  try {
    const results = await Database.emails.all()

    return {
      success: true,
      data: results
    }
  }catch(err) {
    return {
      status: 500,
      data: {
        success: false,
        error: err
      }
    }
  }
}

module.exports = {
  mailOne,
  mail,
  listMails
}