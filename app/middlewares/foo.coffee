module.exports = 
  bar: (req, res, next) ->
    console.log 'I am just a middleware doing nothing!'
    next()
