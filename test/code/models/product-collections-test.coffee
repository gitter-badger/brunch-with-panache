ProductCollection = require('models/product-collection')
ProductCollections = require('models/product-collections')

describe 'ProductCollections', ->

  beforeEach ->
    @productCollection = new ProductCollection
    @productCollections = new ProductCollections



  afterEach ->
    @productCollection.dispose()
    @productCollections.dispose()
