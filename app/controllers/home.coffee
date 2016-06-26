express  = require 'express'
router = express.Router()
mongoose = require 'mongoose'
Article  = mongoose.model 'Article'

foo = require '../middlewares/foo.coffee'
foobar = require '../helpers/foobar.coffee'

module.exports = (app) ->
  app.use foo.bar
  app.use '/', router

router.get '/', (req, res, next) ->
  Article.find (err, articles) ->
    return next(err) if err
    res.render 'index',
      title: 'Generator-Express MVC' + '   ' + foobar.baz()
      articles: articles
