const { isError, isEmpty, set } = require('lodash/fp')

const parseError = ({ name, message, code, data, originalError }) => {
  const error = {
    name,
    message,
    code,
    data,
  }

  if (originalError) set('data.originalError', parseError(originalError))

  return error
}

class CustomError extends Error {
  // eslint-disable-next-line max-params
  constructor() {
    const hasOriginalError = isError(arguments[0])
    const [name, message, statusCode, data] = hasOriginalError ? Array.from(arguments).splice(1) : arguments

    super(message)

    if (Error.captureStackTrace) {
      Error.captureStackTrace(this, CustomError)
    }

    this.name = name
    this.statusCode = statusCode
    this.datetime = new Date()
    if (data !== undefined) this.data = data
    if (hasOriginalError) this.originalError = arguments[0]
  }

  static from(originalError, { name, message, statusCode, data }) {
    if (isEmpty(name) && isEmpty(message) && isEmpty(statusCode) && isEmpty(data)) return originalError

    set('data.originalError', parseError(originalError))

    if (!isEmpty(name)) originalError.name = name
    if (!isEmpty(message)) originalError.message = message
    if (!isEmpty(statusCode)) originalError.statusCode = statusCode
    if (!isEmpty(data)) originalError.data = data

    return originalError
  }
}

module.exports = {
  parseError, CustomError
}
