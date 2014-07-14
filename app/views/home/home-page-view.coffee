View = require('views/base/view')

module.exports = class HomeView extends View
  template: require('./templates/home-page')
  className: 'home-page-view'
