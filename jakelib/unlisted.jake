// These are tasks that are undocumented, as they tend to be used by other tasks.
require('sugar');
var Promise = require('bluebird');
var util = require('util');
var config = require('../brunch-config').config;

// Set default task to list available tasks
task('default', function() {
  jake.run('-T');
});

// Tasks that are used to clean build directories from Brunch
namespace('clean', function() {
  task('web', function() {
    jake.rmRf(config.overrides['web:dev'].paths.public, {silent: true});
  });
});

namespace('npm:install', function() {
  desc('goobs')
  task('dev', function() {
    return new Promise(function(resolve) {
      jake.exec('npm install');
    });
  })

  task('prod', function() {
    return new Promise(function(resolve) {
      jake.exec('npm install --production');
    });
  })
});

// General task to run Scaffolt
namespace('scaffold', function() {
  task('gen', function(type) {
    if(!process.env.name) {
      fail('name parameter is required. ex: jake gen:[type] name=[name]');
    }
    return new Promise(function(resolve) {
      jake.exec(util.format('./node_modules/.bin/scaffolt %s %s', type, process.env.name.dasherize()), {interactive: true}, resolve);
    });
  });

  task('del', function(type) {
    if(!process.env.name) {
      fail('name parameter is required. ex: jake del:[type] name=[name]');
    }
    return new Promise(function(resolve) {
      jake.exec(util.format('./node_modules/.bin/scaffolt %s %s -r', type, process.env.name.dasherize()), {interactive: true}, resolve);
    });
  });
});