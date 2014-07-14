// These are tasks that are undocumented, as they tend to be used by other tasks.
var config = require('../brunch-config').config;
var fs = require('fs');

// Tasks that are used to clean build directories from Brunch
namespace('clean', function() {
  task('web', function() {
    jake.rmRf(config.paths.public, {silent: true});
  });
});

// Taks that are used as workarounds to known build problems
namespace('fix', function() {
  // Create Karma binary symlink so we can run jake test:code
  // https://github.com/jupl/btc-chaplin/issues/14
  // https://github.com/karma-runner/karma/pull/1131
  task('karma', function() {
    try {
      console.log('Creating Karma symlink as a workaround to karma/issues/1131.');
      fs.symlinkSync('../karma/bin/karma', './node_modules/.bin/karma');
    }
    catch (e) {
      console.warn('Symlink already exists.');
    }
  });
});
