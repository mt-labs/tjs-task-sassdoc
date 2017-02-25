'use strict';

var gelf = require('tjs-gelf');


/**
 * Task: Default.
 */
gelf.task('default', ['dump:tasks']);


/**
 * Task module: Simple test.
 */
gelf.load(require('./index'), function(config) {

	config.docSrc = 'src/**/*.scss';

	config.patternSrc = [
		'src/patterns.scss',
		'src/**/patterns.scss',
	];

	config.dest = 'dist/sassdoc';

});
