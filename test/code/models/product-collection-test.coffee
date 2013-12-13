ProductCollection = require('models/product-collection')

describe 'ProductCollection', ->

  beforeEach ->
    @productCollection = new ProductCollection

  afterEach ->
    @productCollection.dispose()
