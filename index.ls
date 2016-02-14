jjv = new require('jjv')()
require! lodash: { assign, head, tail, omit, map, curry, times }

class rest  
  (options) ->
    def = do
      root: '/api'
      permissions: {}
      log: false
      
    @options = assign def, options

  add: (resource) ->
    @options.app.get "#{root}/#{name}", (req, res, next) ->
      @log? "query #{JSON.stringify(req.query)}"
      model.findAll(req.query)
        .then (results) -> res.status(200).send(results).end()
        .catch(next)

    @options.app.post "#{root}/#{name}", (req, res, next) ->
      @log? "query #{JSON.stringify(req.query)}"
      model.findAll(req.query)
        .then (results) -> res.status(200).send(results).end()
        .catch(next)
    
exports = rest
    
