ProductCollectionCollectionView = require('views/product-collection/product-collection-collection-view')
ProductCollectionItemView = require('views/product-collection/product-collection-item-view')

describe 'ProductCollectionCollectionView', ->

  beforeEach ->
    @productCollectionView = new ProductCollectionCollectionView
    @productCollectionItemView = new ProductCollectionItemView

  afterEach ->
    @productCollectionCollectionView.dispose()
    @productCollectionItemView.dispose()
