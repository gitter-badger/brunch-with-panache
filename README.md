# Brunch with Panache 0.8.5
[![Dependency Status](https://david-dm.org/trunkclub/brunch-with-panache.png)](https://david-dm.org/trunkclub/brunch-with-panache)
[![devDependency Status](https://david-dm.org/trunkclub/brunch-with-panache/dev-status.png)](https://david-dm.org/trunkclub/brunch-with-panache#info=devDependencies)

## Introduction
Brunch with Panache is a skeleton for building web applications, specifically single-page applications. It is a modification of [Chapless Brunch](https://github.com/jupl/chapless-brunch). This skeleton leverages [node](http://nodejs.org), [Brunch](http://brunch.io), [Scaffolt](https://github.com/paulmillr/scaffolt), [Bower](http://bower.io/), [Jake](https://github.com/mde/jake), and [PhantomJS](http://phantomjs.org/) to provide cross-platform tasks in a simple package. [EditorConfig](http://editorconfig.org/) is also provided to help with consistency.

It contains the following differences from BTC-Chaplin:

- Sass instead of Less, with expected integration with framework
- Handlebars instead of Embedded CoffeeScript templates
- Swag helpers available for more powerful Handlebars templates
- Asset fingerprinting for cache busting (production builds only)
- More opionated generators for easier file searching
- Working Karma test runner
- NPM shrinkwrap task
- Uses Hapi instead of Express

For a mobile/Cordova friendly variant, check out [this skeleton](https://github.com/trunkclub/brunch-with-panache/tree/cordova).

## File Structure

    ├── app                       # App is built here. Look at Brunch for more info.
    │   ├── assets                # Static files that are just copied
    │   ├── controllers           # Chaplin controllers
    │   ├── lib                   # Chaplin utilities and helpers
    │   ├── models                # Chaplin models and collections
    │   ├── styles                # Application style rule declarations
    │   │   ├── base.scss         # Sass variables and mixins for the application
    │   │   └── application.scss  # Application/page styling definition
    │   ├── views                 # Chaplin views and collection views
    │   ├── application.coffee    # Chaplin application definition
    │   ├── initialize.coffee     # Chaplin views and collection views
    |   ├── config.coffeeenv      # Environment-specific variables
    │   └── routes.coffee         # Route definitions for Chaplin
    ├── bower_components          # Packages installed by Bower
    ├── generators                # Generators used by Scaffolt
    ├── jakelib                   # Unified set of tasks for development
    ├── public                    # Generated final product
    ├── server                    # Server configuration
    ├── test                      # Test-related files
    │   ├── assets                # Static assets to run code tests manually
    │   ├── code                  # Code-based tests for Karma/manual
    │   ├── site                  # Site-based tests for Mocha and WebDriverJS
    │   ├── karma.conf.coffee     # Karma configuration for code tests
    │   ├── mocha.opts            # Default options for site tests
    │   └── setup.js              # Configuration for site tests
    ├── vendor                    # 3rd party JS/CSS libraries
    ├── .editorconfig             # EditorConfig definition file for coding styles
    ├── bower.json                # Listing for Bower dependencies to download
    ├── brunch-config.js          # Brunch app build configuration
    └── package.json              # Project dependencies and configuration


## Setup

1. Install [node.js](http://nodejs.org/), preferably using [nvm](https://github.com/creationix/nvm).
2. If using Windows and leveraging Bower, install [Git](http://git-scm.com/download/win).
3. Open a terminal window and navigate to the project directory.
4. Execute the command `npm install` to install all package dependencies.
5. Run `jake` for a listing of available application options.


## Notes
If you want to just run Brunch without using Jake tasks, just use either `web:dev` or `web:prod` for the environment. (ex: `brunch watch --server --env web:prod`)

One-line commands are provided for convenience as well for those that want to start running things as quickly as possible by installing depedencies automatically. Use `npm start` to download non-development packages and run the `server:prod` task. Use `npm test` to download all packages and run the `test:all` task.

## Contribution

When making a pull request, make sure to edit the base fork to which you want to contribute (by default it will try and merge with the parent repository from which this one is forked, which we don't want to do).

![Example: Pull Request](http://cl.ly/image/3Y0E00370S0e/Screen%20Shot%202013-12-13%20at%203.12.27%20PM.png)

## Task List
While Brunch/Scaffolt/etc. can be used, Jake commands are provided for a simple and consistent interface. These tasks can be executed using `jake`. (`jake [task]`) These are the following available tasks provided out of the box:

### Bower

#### `bower:install`
Download and preinstall any Bower dependencies in advance. You can run this if you want to download Bower dependencies in advance.

#### `bower:clean`
Remove downloaded Bower dependencies. This is useful if you want to reinstall dependencies. (e.g. updated package)


### NPM

#### `npm:shrinkwrap`
Locks down Node package versions.

#### `npm:clean`
Remove downloaded Node dependencies. This is useful if you want to reinstall dependencies. (e.g. updated package)

### Extras
These commands add additional features/items to the project that are not included by default.

#### `add:jquery` / `rem:jquery`
Add/remove [jQuery](http://jquery.com/) to/from the project.

#### `add:lodash` / `rem:lodash`
Add/remove [Lo-Dash](http://lodash.com/) to/from the project.

#### `add:rivets` / `rem:rivets`
Add/remove [Rivets.js](http://rivetsjs.com/) to/from the project for binding models and views. No additional configuration is needed if added. To reference a model from a view with rivets use the `model` object. To access model properties from Rivets by default use `:`. (ex: `model:name` equates to `model.get('name')`)

#### `add:exoskeleton` / `rem:exoskeleton`
Add/remove [Exoskeleton](http://exosjs.com/) to/from the project for a more lightweight Backbone. Note that this removes/restores [classic Backbone](http://backbonejs.org/), jQuery, and Lo-Dash. You can use other tasks to add/remove jQuery and Lo-Dash again.

#### `add:davy` / `rem:davy`
Add/remove [Davy](https://github.com/lvivski/davy) to/from the project for simple and lightweight Promise support. Add this if you are using Exoskeleton and want support for promises.


### Scaffolding
Scaffolding commands are available in the form of `gen` and `del`. (syntax ex: `jake gen codetest=user`) Multiple scaffolds can be specified in a single command, as well as separating names with commas. (ex: `jake gen codetest=test1,test2 sitetest=test3`) Unit test files are automatically generated for Chaplin items. For Chaplin views, a template and stylesheet is also provided in addition to the code file.

#### `gen` / `del`
List available scaffolds.

#### `gen model=[name]` / `del model=[name]`
Generate/destroy a Chaplin model.

#### `gen collection=[name]` / `del collection=[name]`
Generate/destroy a Chaplin collection. Generating a Chaplin collection will also generate its corresponding model. Specify the name in singular form, as collection will automatically be pluralized.

#### `gen view=[name]` / `del view=[name]`
Generate/destroy a Chaplin view.

#### `gen collection-view=[name]` / `del collection-view=[name]`
Generate/destroy a Chaplin collection view. Generating a Chaplin collection view will also generate the individual item view.

#### `gen controller=[name]` / `del controller=[name]`
Generate/destroy a [Chaplin controller](http://docs.chaplinjs.org/chaplin.controller.html).

#### `gen code-test=[name]` / `del code-test=[name]`
Generate/destroy a test file with the given test name for testing code. (ex: unit testing)

#### `gen site-test=[name]` / `del site-test=[name]`
Generate/destroy a test file with the given test name for testing the site. (ex: functional testing)


### Testing
Tests leverage [PhantomJS](http://phantomjs.org/), [Mocha](http://visionmedia.github.io/mocha/), [Mocha as Promised](https://github.com/domenic/mocha-as-promised), and [Chai](http://chaijs.com/). Code and site testing is provided. Code testing adds [Sinon](http://sinonjs.org/) and [Sinon-Chai](https://github.com/domenic/sinon-chai).

#### `test:all [codereporter=progress] [sitereporter=spec]`
Run all tests listed below once. For more information on reporters see below.

#### `test:code [reporter=progress] [watch=false]`
Run code-based tests (ex. unit tests) using Karma. Karma is preconfigured out of the box to run with PhantomJS. A Karma reporter can be specified with the `reporter` option. If you run this task with `watch=true` Karma will auto-run on file changes. Otherwise by default Karma runs once. In addition, if you run a build (see below) with the `dev` environment the tests are included with a reporter under `test` to run in browsers. (ex. visit `http://locahost:[port]/test`)

#### `test:site [reporter=spec] [watch=false]`
Run site-based tests (ex. system tests) using Mocha and WebDriverJS. A Brunch server is started up temporarily to interact with the site. A Mocha reporter can be specified with the `reporter` option. If you run this task with `watch=true` Mocha will auto-run on file changes with [nodemon](http://remy.github.io/nodemon/). Otherwise by default Mocha runs once. The global method `getDriver` is provided to get a setup and built driver. WebDriverJS' use of Promises can be combined with Mocha as Promised to handle asynchronous behavior easily. ex:

```coffeescript
describe 'Sample', ->

  before ->
    @driver = getDriver()

  it 'Has a proper title', ->
    @driver.get('http://localhost:3333').then =>
      @driver.getTitle()
    .then (title) ->
      expect(title).to.equal('Chapless Brunch')

  after ->
    @driver.quit()
```


### Building
These commands are used to assemble the application, generating the necessary JS/CSS and adding assets. Use `dev` mode to keep readable JS/CSS, plus include source maps as well as tests under the `test` folder. Use `prod` mode to minify/uglify JS/CSS as well as omit source maps and tests. If any Bower dependencies have not been downloaded yet, Bower will first download them.

#### `build:[mode]`
Assemble the application once.

#### `watch:[mode]`
Assemble the application and continue to watch for changes. Rebuild every time a change is detected.

#### `server:[mode]`
Assemble the application and continue to watch for changes. Rebuild every time a change is detected. Also, the application is served locally to open with a browser. This build uses the `web` environment.


## Coffeeenv
A `config.coffeeenv` file is provided in the `app/lib` directory. It allows you to set environment variables for the purposes of local development or deployment.

``` coffee
(env) ->

  # Environment options
  # https://github.com/rcs/jsenv-brunch/
  environmentOpts =
    API_HOST: 'http://api.apihost.com'

  # Set allowed environment options
  for key, value of env
    switch key
      when 'API_HOST' then environmentOpts.API_HOST = value

  environmentOpts
```

This allows you to run a command with the environment variable:

`API_HOST="http://api.untappd.com" jake watch:dev`

And access passed variables as a CommonJS module at runtime:

``` coffee
config = require('lib/config')
console.log config.API_URL # => http://api.untappd.com
```

## Libraries

### Core
- [Brunch Toolchain](https://github.com/jupl/brunch-toolchain) 0.6.1

### Languages
- [CoffeeScript](http://coffeescript.org/)
- [Handlebars](handlebarsjs.com)
- [Sass](sass-lang.com)

### Framework
- [Chaplin](http://chaplinjs.org)
- [Backbone](http://backbonejs.org)
- [Exoskeleton](http://exosjs.com/)

### Utilities
- [jQuery](http://jquery.com/)
- [Lo-Dash](http://lodash.com/)
- [Rivets.js](http://rivetsjs.com/)
- [Davy](https://github.com/lvivski/davy)
