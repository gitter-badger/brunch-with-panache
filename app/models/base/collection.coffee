Model = require('./model')

module.exports = class Collection extends Chaplin.Collection
  # Use the project base model by default
  model: Model

  # Fetch data in chunks
  fetchChunks: (options = {}) ->
    defaultOptions =
      chunkSize: 100
      ids: []
      success: -> return # @return no-op unless passed as option
      error: -> return # @return no-op unless passed as option

    defaultFetchOptions =
      reset: no
      remove: no

    options = _.extend defaultOptions, options

    deferreds = []

    batches = @_getBatches(options.ids, options.chunkSize)
    for batch in batches
      fetchOptions = _.extend defaultFetchOptions, { data: { ids: batch } }
      deferreds.push(@fetch fetchOptions)

    $.when.apply(@, deferreds)
      .then(options.success.call(@))
      .fail(options.error.call(@))

  _getBatches: (ids, chunkSize) ->
    [].concat.apply [],
      ids.map (el, index) ->
        (if index % chunkSize then [] else [ids.slice(index, index + chunkSize)])
