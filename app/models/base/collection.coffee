Model = require('./model')

module.exports = class Collection extends Chaplin.Collection
  # Mixin a synchronization state machine
  # _.extend @prototype Chaplin.SyncMachine
  #
  # Use the project base model by default
  model: Model
