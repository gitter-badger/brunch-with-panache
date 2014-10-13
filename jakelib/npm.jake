(function() {
  'use strict';

  // NPM related tasks
  var npm = require('./lib').bin('npm');
  var Promise = require('bluebird');

  namespace('npm', function() {
    desc('Clear Node packages');
    task('clean', function() {
      jake.rmRf('node_modules');
      return npm.execute('cache', 'clean');
    });

    desc('Shrinkwrap Node packages');
    task('shrinkwrap', function() {
      return new Promise(function(resolve) {
        jake.exec('npm shrinkwrap', {interactive: true}, resolve);
      });
    });
  });
}());
