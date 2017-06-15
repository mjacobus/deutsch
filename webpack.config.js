
module.exports = {
  entry: './frontend/src/app.js',
  output: {
    path: __dirname + '/apps/web/assets/javascripts/',
    library: 'App',
    filename: 'app.bundle.js',
  },
  module: {
    loaders: [{
      test: /\.js$/,
      exclude: /node_modules/,
      loader: 'babel-loader'
    }]
  }
}
