utils = require('./utils')

# Application-specific view helpers (Swag, Lo-Dash mixins, Rivets formatters, etc.)
# ---------------------------------------------------------------------------

# Register Swag helpers
# http://elving.github.io/swag/
Swag.registerHelpers()

# Register custom Handlebars helpers
register = (name, fn) ->
  Handlebars.registerHelper name, fn

# Map helpers
# -----------

# Get Chaplin-declared named routes, e.g. {{url "likes#show" "105"}}
register 'url', (routeName, params..., options) ->
  utils.reverse routeName, params
