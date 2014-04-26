// These are tasks that are undocumented, as they tend to be used by other tasks.
require('sugar');
var fs = require('fs');
var path = require('path');
var config = require('../brunch-config').config;
var execute = require('./lib').execute;
var localBinCommand = require('./lib').localBinCommand;
var platforms = require('../setup/platform').platforms;

// Set default task to list available tasks
task('default', function() {
  jake.run('-T');
});

// Tasks that are used to clean build directories from Brunch
namespace('clean', function() {
  platforms.forEach(function(platform) {
    var publicPath = config.overrides[platform + ':dev'].paths.public;
    task(platform, function() {
      jake.rmRf(publicPath, {silent: true});
    });
  });
});

// General task to run Scaffolt. gen/del require a name, while add/rem
// uses placeholder text since it is not used. (in fact, the text
// 'placeholder' is used)
namespace('scaffold', function() {
  task('gen', function(type) {
    var name = process.env.name;
    var generatorPath = (fs.existsSync(path.resolve('node_modules', 'scaffolt-' + type, 'generators', type)) ? ' --generators ' + path.resolve('node_modules', 'scaffolt-' + type, 'generators') : '');
    validateName(name);
    return execute(localBinCommand('scaffolt', type + ' ' + name + generatorPath));
  });

  task('del', function(type) {
    var name = process.env.name;
    var generatorPath = (fs.existsSync(path.resolve('node_modules', 'scaffolt-' + type, 'generators', type)) ? ' --generators ' + path.resolve('node_modules', 'scaffolt-' + type, 'generators') : '');
    validateName(name);
    return execute(localBinCommand('scaffolt', type + ' ' + name + ' -r ' + generatorPath));
  });

  task('add', function(type) {
    return execute(localBinCommand('scaffolt', type + ' placeholder'));
  });

  task('rem', function(type) {
    return execute(localBinCommand('scaffolt', type + ' placeholder -r'));
  });

  task('add', function(type) {
    return new Promise(function(resolve) {
      jake.exec(util.format('./node_modules/.bin/scaffolt %s placeholder', type), {interactive: true}, resolve);
    });
  });

  task('rem', function(type) {
    return new Promise(function(resolve) {
      jake.exec(util.format('./node_modules/.bin/scaffolt %s placeholder -r', type), {interactive: true}, resolve);
    });
  });
});

function validateName(name) {
  if(!name) {
    fail('name parameter is required. ex: jake ... name=[name]');
  }
}

function isNPMGenerator(type) {
  fs.readdirSync('node_modules').filter(function(generator) {
    console.log(generator, path.resolve('node_modules', type));
    return fs.existsSync(path.resolve('node_modules', type));
  });
}
