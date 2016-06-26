path     = require 'path'
rootPath = path.normalize __dirname + '/..'
env      = process.env.NODE_ENV || 'development'

config =
  development:
    root: rootPath
    app:
      name: 'express-coffee-skel'
    port: 3000
    db: 'mongodb://localhost/express-coffee-skel-development'

  test:
    root: rootPath
    app:
      name: 'express-coffee-skel'
    port: 3000
    db: 'mongodb://localhost/express-coffee-skel-test'

  production:
    root: rootPath
    app:
      name: 'express-coffee-skel'
    port: 3000
    db: 'mongodb://localhost/express-coffee-skel-production'

module.exports = config[env]
