Hapi = require('hapi')
path = require('path')

exports.startServer = (port, publicPath, callback) ->

  # Start server on port specified in brunch-config
  server = new Hapi.Server port

  # Serve static files
  server.route
    method: 'GET'
    path: '/{path*}'
    handler:
      directory:
        path: publicPath

  # Start up server
  server.start ->
    console.log "Server running at #{server.info.uri}"
