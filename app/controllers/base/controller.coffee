SiteView = require('views/site/site-view')
HeaderView = require('views/site/header-view')
FooterView = require('views/site/footer-view')

module.exports = class Controller extends Chaplin.Controller
  # Compositions persist stuff between controllers.
  # You may also persist models etc.
  beforeAction: ->
    @reuse 'site', SiteView
    @reuse 'header', HeaderView, {region: 'header'}
    @reuse 'footer', FooterView, {region: 'footer'}
