const { environment } = require('@rails/webpacker')

module.exports = environment

const webpack = require('webpack')
environment.plugins.prepend(
  'Provide',
  new webpack.ProvidePlugin({
    $:'jquery/syc/jquery',
    jQuery:'jquery/syc/jquery',
    Popper:'popper.js'
  })
)