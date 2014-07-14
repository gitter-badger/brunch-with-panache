View = require('views/base/view')

# Site view is a top-level view which is bound to body
# Regions are used to define logical page containers
module.exports = class SiteView extends View
  template: require('./templates/site')
  container: 'body'
  class: 'site-view'
  regions:
    header: '#region-site-header'
    main: '#region-site-main'
    footer: '#region-site-footer'
