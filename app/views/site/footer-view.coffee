View = require('views/base/view')

module.exports = class FooterView extends View
  template: require('./templates/footer')
  className: 'footer-view'

  attach: ->
    super
    @$('.js-year').html "#{new Date().getFullYear()}"
