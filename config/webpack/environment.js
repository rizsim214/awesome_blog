const { environment } = require('@rails/webpacker')
var webpack = require('webpack');

environment.plugins.prepend('Provide',
	new webpack.ProvidePlugin({
		$: 'jquery/src/jquery.js',
		jQuery: 'jquery/src/jquery.js',
		Popper: ['popper.js', 'default']
	})
);

module.exports = environment