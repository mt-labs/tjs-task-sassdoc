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

	config.docSrc = 'test/src/**/*.scss';

	config.patternSrc = [
		'test/src/patterns.scss',
		'test/src/**/patterns.scss',
	];

	config.dest = 'test/compiled';

});
