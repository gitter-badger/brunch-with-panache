ItemView = require('views/base/item')

module.exports = class ProductCollectionItemView extends ItemView
  className: 'product-collection-item-view'
  template: require('./templates/product-collection-item')
