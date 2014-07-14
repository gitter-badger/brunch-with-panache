routes = require('routes')
utils = require('lib/utils')

defaultOptions = {routes, controllerSuffix: '-controller'}

module.exports = class Application extends Chaplin.Application
  title: 'Brunch with Panache'

  constructor: (options) ->
    super utils.extend({}, defaultOptions, options)
