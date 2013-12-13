module.exports = (match) ->
  match '', 'collections#index'

  match 'collection/:id', 'collections#show', constraints: {id: /^\d+$/}