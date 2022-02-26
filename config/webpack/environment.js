const { environment } = require('@rails/webpacker')
const resolveUrl = require('./loaders/resolve-url');

const webpack = require('webpack');
environment.plugins.append('Provide', new webpack.ProvidePlugin({
  $: 'jquery',
  jQuery: 'jquery',
  Popper: ['popper.js', 'default']
}));

environment.loaders.get('sass').use.splice(-1, 0, resolveUrl);

module.exports = environment
