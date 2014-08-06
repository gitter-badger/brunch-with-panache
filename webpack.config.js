var path = require('path'),
    webpack = require('webpack');

module.exports = {
  entry: './initialize.coffee',
  context: path.join(__dirname, 'app'),
  target: 'web',
  output: {
    path: path.join(__dirname, 'public', 'javascripts'),
    publicPath: '/public/javascripts',
    filename: 'app.js',
    chunkFilename: '[chunkhash].js'
  },
  resolve: {
    root: [
      path.join(__dirname, 'app'),
      path.join(__dirname, 'bower_components'),
      path.join(__dirname, 'node_modules')
    ],
    extensions: ['', '.webpack.js', '.web.js', '.coffee', '.hbs', '.js'],
    alias: {
      _: 'lodash',
      underscore: 'lodash'
    }
  },
  resolveLoader: {
    root: path.join(__dirname, 'node_modules')
  },
  module: {
    loaders: [
      { test: /\.coffee$/, loader: "coffee-loader" },
      { test: /\.hbs$/, loader: "handlebars-loader?helperDirs=lib/helpers" }
    ],
    noParse: /\.min\.js/
  },
  plugins: [
    new webpack.ProvidePlugin({
      // Automatically detect jQuery and $ as free var in modules
      // and inject the jquery library
      // This is required by many jquery plugins
      jQuery: 'jquery',
      $: 'jquery',
      Chaplin: 'chaplin',
      _: 'lodash',
      Backbone: 'backbone'
    }),
    new webpack.ResolverPlugin(
      new webpack.ResolverPlugin.DirectoryDescriptionFilePlugin("bower.json", ["main"])
    ),
    new webpack.ContextReplacementPlugin(
      /chaplin$/, // for the dynamic require in the chaplin lib
      path.join(__dirname, 'app'), // look for stuff in the controllers dir
      true,
      /.*-controller/ // filter: only allow request matching this RegExp
    ),
    new webpack.ContextReplacementPlugin(
      /swag$/,
      path.join(__dirname, 'app'),
      true,
      /.*-partial.html/
    )
  ]
}
