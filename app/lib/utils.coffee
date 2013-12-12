# Application-specific utilities
# ------------------------------

# Delegate to Chaplin’s utils module
utils = Chaplin.utils.beget Chaplin.utils

# Add extend so no need to worry if using Backbone or Exoskeleton
utils.extend = if _? then _.extend else Backbone.utils.extend

# Configure Ring proxy
integration: do ->
  hostname = window.location.hostname
  if /\.trunkclub.dev/.test hostname
    api_url: 'http://ring.trunkclub.dev/collections'
    router:
      auth_url: 'http://staging-auth.trunkclub.com/oauth2/auth'
      environment: 'development'
  else if /staging-.*\.trunkclub.com/.test hostname
    api_url: 'https://staging-ring.trunkclub.com/collections'
    router:
      auth_url: 'http://staging-auth.trunkclub.com/oauth2/auth'
      environment: 'staging'
  else if /.trunkclub.com/.test hostname
    api_url: 'https://ring.trunkclub.com/collections'
    router:
      auth_url: 'http://auth.trunkclub.com/oauth2/auth'
      environment: 'production'
  else console.error 'Cannot determine hostname.'

# Prevent creating new properties and stuff
Object.seal? utils

module.exports = utils
