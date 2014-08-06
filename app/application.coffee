Chaplin = require('chaplin')

routes = require('routes')
utils = require('lib/utils')

defaultOptions = {routes, controllerSuffix: '-controller', controllerPath: './controllers/'}

module.exports = class Application extends Chaplin.Application
  title: 'Brunch with Panache'

  constructor: (options) ->
    super utils.extend({}, defaultOptions, options)
