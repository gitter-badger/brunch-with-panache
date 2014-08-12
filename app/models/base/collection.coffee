Model = require('./model')

module.exports = class Collection extends Chaplin.Collection
  # Use the project base model by default
  model: Model

  fetchChunks: (options={}) ->
    defaultOptions =
      chunkSize: 100
      ids: []
      success: () ->
      error: () ->

    defaultFetchOptions =
      reset: false
      remove: false

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
      ids.map (elem, index) ->
        (if index % chunkSize then [] else [ids.slice(index, index + chunkSize)])
