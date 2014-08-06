require('./controllers/home-controller')

module.exports = (match) ->
  match '', 'home#index'
