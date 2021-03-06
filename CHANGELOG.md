# Changelog

### NEXT
- README updates courtesy of @ppiekarczyk
- Fix a DOM attachment bug in the scaffold generator's controller

### 0.9.0 (October 13, 2014)
- Resolve #23, improving collection view generator naming consistency
- Add autoprefixer while we wait for #21
- Fix bug where Sass partials were ignored by the watcher on save
- Resolve #35 by running server with npm start script
- Fix #34 by revving deps
- Resolve #25 by reworking the Scaffold generator
- Updated LICENSE
- Prepared package for NPM release, resolves #17
- Use strict mode for Jake task definitions
- Fix broken server:dev and server:prod tasks

### 0.8.6 (September 2, 2014)
- Removed unnecessary lesshat bower component
- Added jake tasks for easily adding and removing Swag
- Bumped Chaplin down to ~1.0.0 for proper Exoskeleton support
- Added karma-cli as test dependency and removed karma fix jake task
- Swap out Express for Hapi for happier development (and no cookies)
- Fix a bug where mocha assets piped to app.css when test stuff installed

### 0.8.5 (August 21, 2014)
- Bump Chaplin dep to 1.0.1
- Fix bug in the scaffold generator

### 0.8.4 (July 14, 2014)
- Bump to fix a small mistake in the README

### 0.8.3 (July 14, 2014)
- Updated from BTC-Chaplin tags/0.8.2; resolves #6
- Borrowed some additional work from BTC-Chaplin master
- Fixed issues causing code tests to fail; resolves #13
- Added Swag for Handlebars by default
- Reworked JSEnv plugin to work with Coffee and whitelist
- Ported the Karma config over to coffee
- Added NPM clean task; resolves #18
- Added asset fingerprinting for production builds
- Removed the page view generator
- Reworked site template and default views; resolves #12, #10, #9, #7, #5
- Bumped a bunch of packages; resolves #4
- Added default application title; resolves #8
- Removed unused NPM scaffolding tool

### 0.7.9 (May 1, 2014)
- Added new generators for designer scaffolding and page views
- Removed npm-shrinkwrap from the repo
- Added ability to look for Scaffolt generators that are imported as npm modules
- Added jsenv-brunch to allow for environment-specific variables in production code
- Updated dev dependencies

### 0.7.8 (December 12, 2013)
- Bump for formal deployment and tagging process

### 0.7.7 (December 12, 2013)
- Adding postfix "-test" to generaters which produce code tests
- Updated collection generator
- Revised contribution instructions

### 0.7.6 (December 3, 2013)
- Now using the main element
- Removing superfluous and invalid markup around header/footer
- Fixing issue where page view was not attached in the right location

### 0.7.5 (December 3, 2013)
- Fixed broken dependency reporting following repo org switch -> trunkclub

### 0.7.4 (December 2, 2013)
- Fix for CI build error in "npm test" script Re: Sass dependency

### 0.7.3 (December 2, 2013)
- Added workaround to allow "npm test" script to function properly
- Added robots.txt file with example

### 0.7.2 (November 24, 2013)
- Added passing tests to make skeleton easier to use

### 0.7.1 (November 19, 2013)
- Removed unneeded tests merged in from upstream
- Adding opinion to naming standards for page-level views (use "-page-view" suffix)
- Update from CB
- Update README to start differentiating from CB
- Bring the "-controller" suffix back to controller filenames

### 0.7.0 (November 10, 2013)
- Update from CB
- Giving an opinion to test file names via generators

### 0.6.5 (November 10, 2013)
- Merged in Brunch Toolchain 0.5.3, giving us Karma and autorun tests
- Fix issue with stylesheet generation
- Fix issue with exoskeleton generation task

### 0.6.4 (November 10, 2013)
- Revamped generators to give more opinion to views orginization
- Pages now composed using regions
- Created header and footer regions
- Added URL view helper from BWC
- Reorganized styling files

### 0.6.3 (November 8, 2013)
- Switch test generators from JS to Coffee

### 0.6.2 (November 8, 2013)
- Updating README

### 0.6.1 (November 8, 2013)
- Forked from Chapless Brunch (CB)
- Added CoffeeLint and disabled max line length
- Removed Bootstrap
- Added Shrinkwrap build task, e.g. `jake npm:shrinkwrap`
- Replaced Eco with Handlebars
- Replaced Less with Sass
- Stop using view-specific styles
- Updated README to reflect above changes

### 0.6.0 (November 5, 2013)
- Update from BTC
- Update Bootstrap to 3.0.1
- Update Rivets
- Ensure Bootstrap default theme is included
- Added Exoskeleton, Lo-Dash, and Davy as modules
- Added some code to handle either Backbone or Exoskeleton
- Remove CoffeeLint (check out EditorConfig)
- Remove Underscore.String by default
- Remove `redirectTo` function in views (use `Chaplin.helpers`)

#### 0.5.1 (September 27, 2013)
- Make Rivets and Underscore.string optional
- General cleanup
- Bugfixes

### 0.5.0 (September 26, 2013)
- Update from BTC
- Update Bootstrap to v3
- Remove Clearless in favor of Bootstrap's mixins
- Add Rivets for binding

### 0.4.0 (August 19, 2013)
- Update from BTC
- Refactor to reflect Brunch and BWC
- Remove Stickit and Transit (use Bower)

### 0.3.0 (June 6, 2013)
- Integrate BTC Bootstrap
- Update from BWC
- Underscore -> Lo-Dash
- Add Transit
- Update jQuery

#### 0.2.3 (May 20, 2013)
- Bugfix in base collection view.

#### 0.2.2 (May 19, 2013)
- Update Brunch Toolchain.
- Update Chaplin, jQuery, and Font Awesome.

#### 0.2.1 (April 15, 2013)
- Update Brunch Toolchain.
- Update Chaplin.

### 0.2.0 (March 31, 2013)
- Update Backbone and Chaplin.
- Add test generator.
- Have test modules be automatically included again.
- Skeleton cleanup.

### 0.1.0 (March 28, 2013)
- Initial release.
