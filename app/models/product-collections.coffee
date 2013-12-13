Collection = require('models/base/collection')
ProductCollection = require('./product-collection')

module.exports = class ProductCollections extends Collection
  model: ProductCollection
