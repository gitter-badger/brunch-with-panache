Hapi = require('hapi')

exports.startServer = (port, publicPath, callback) ->

  # Start server on port specified in brunch-config
  server = new Hapi.Server port

  # Serve scripts
  server.route
    method: 'GET'
    path: '/scripts/{file*1}'
    handler:
      directory: {path: "#{publicPath}/scripts"}

  # Serve styles
  server.route
    method: 'GET'
    path: '/styles/{file*1}'
    handler:
      directory: {path: "#{publicPath}/styles"}

  # Catch-all route
  server.route
    method: 'GET'
    path: '/{path*}'
    handler:
      file: "#{publicPath}/index.html"

  # Start up server
  server.start ->
    console.log "Server running at #{server.info.uri}"
