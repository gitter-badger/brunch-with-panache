CollectionView = require('views/base/collection')
ProductCollectionItemView = require('./product-collection-item-view')

module.exports = class ProductCollectionView extends CollectionView
  className: 'product-collection-collection-view'
  template: require('./templates/product-collection-collection')
  itemView: ProductCollectionItemView
