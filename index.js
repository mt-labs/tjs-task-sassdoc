'use strict';

module.exports = function (gelf, name) {

	// Module name
	name = name || 'sassdoc';

	// Task names
	var task = {
		build:  'build:' + name,
		watch:  'watch:' + name,
	};


	/**
	 * Default configuration.
	 */
	gelf.config(name, function (config, get) {

		return {
			docSrc: 'src/styles/**/*.scss',
			docSrcOpts: {},
			patternSrc: 'src/styles/components/**/patterns.scss',
			patternSrcOpts: {},
			dest: 'web/sassdoc',
			watch: get('watch'),
			sass: {
				outputStyle: 'expanded',
				sourceComments: true,
			},
			sassdoc: {
				dest: null,
				theme: require('./theme'),
				autofill: ['content'],
			},
		};

	});


	/**
	 * Task: Build documentation.
	 */
	gelf.task(task.build, function (done) {

		var config = gelf.config(name);
		if (config.sassdoc.dest == null) {
			config.sassdoc.dest = config.dest;
		}

		var autoprefixer = require('gulp-autoprefixer');
		var concat = require('gulp-concat');
		var replace = require('gulp-replace');
		var sass = require('gulp-sass');
		var sassdoc = require('sassdoc');

		var worker = sassdoc(config.sassdoc);

		gelf.src(config.docSrc, config.docSrcOpts)
			.pipe(replace(/^\.([0-9a-z-_]+)/gim, '%$1'))
			.pipe(worker)
		;

		worker.promise.then(function () {

			return gelf.src(config.patternSrc, config.patternSrcOpts)
				.pipe(concat('patterns.scss'))
				.pipe(sass(config.sass))
				.pipe(autoprefixer())
				.pipe(gelf.dest(config.dest + '/assets/css'))
				.on('end', done)
				.pipe(gelf.notify.done(task.build))
			;

		});

	});


	/**
	 * Task: Watch documentation.
	 */
	gelf.task(task.watch, function () {

		var config = gelf.config(name);

		gelf.watch(config.docSrc, config.watch, [task.build]);

	});


	return name;

};
