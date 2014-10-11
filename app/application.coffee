routes = require('routes')
utils = require('lib/utils')

defaultOptions = {routes, controllerSuffix: '-controller'}

# @see http://docs.chaplinjs.org/chaplin.application.html for docs
module.exports = class Application extends Chaplin.Application
  title: 'Brunch with Panache'

  constructor: (options) ->
    super utils.extend({}, defaultOptions, options)

  # Create additional mediator properties
  initMediator: ->
    # Add additional application-specific properties and methods
    # e.g. Chaplin.mediator.prop = null
    Chaplin.mediator.user = null
    # Seal the mediator
    super
