require! {
  lodash: { assign, head, tail, omit, map, curry, times }
  'body-parser'
}

class rest
  (options) ->
    def = do
      root: '/api'
      permissions: {}
      log: false
      
    @options = assign def, options
    
    options.app.use(bodyParser.json())
  
  add: (resource) ->
    name = resource.name
    { root, app, log } = @options
    
    app.get "#{root}/#{name}", (req, res, next) ->
      log? "FINDALL #{JSON.stringify(req.query)}"
      resource.findAll(req.query)
        .then (results) -> res.status(200).send(results).end()
        .catch(next)

    app.get "#{root}/#{name}/:id", (req, res, next) ->
      log? "FIND #{JSON.stringify(req.params)}"
      resource.find(req.params.id)
        .then (results) -> res.status(200).send(results).end()
        .catch (next)
          
    app.post "#{root}/#{name}", (req, res, next) ->
      log? "CREATE #{JSON.stringify(req.query)}"
      resource.findAll(req.query)
        .then (results) -> res.status(200).send(results).end()
        .catch(next)

    app.put "#{root}/#{name}/:id", (req, res, next) ->
      log? "UPDATE #{JSON.stringify(req.query)}"
      resource.update(req.params.id, req.query)
        .then (results) -> res.status(200).send(results).end()
        .catch(next)

        

exports.rest = rest
