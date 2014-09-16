/**
 * Brunch configuration
 * http://brunch.io/#documentation for docs
 */
exports.config = {
  paths: {
    public: 'public'
  },

  server: {
    path: 'server',
    port: 3333
  },

  files: {
    javascripts: {
      joinTo: {
        'scripts/app.js': /^app/,
        'scripts/vendor.js': /^(vendor|bower_components)/
      }
    },
    stylesheets: {
      joinTo: {
        'styles/app.css': /^(app|vendor|bower_components\/(?!mocha))/
      }
    },
    templates: {
      joinTo: 'scripts/app.js'
    }
  },

  conventions: {
    ignored: /^_.*\.scss$/
  },

  plugins: {
    autoreload: {
      enabled: process.env.browsersync !== 'true'
    },
    coffeelint: {
      pattern: /^app\/.*\.coffee$/,
      options: {
        max_line_length: {
          level: "ignore"
        }
      }
    },
    digest: {
      environments: ['production']
    }
  }
};
