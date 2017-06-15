Deutsch Lernen
-----------------------

[![Build Status](https://travis-ci.org/mjacobus/deutsch.svg?branch=master)](https://travis-ci.org/mjacobus/deutsch)
[![Coverage Status](https://coveralls.io/repos/github/mjacobus/deutsch/badge.svg?branch=csv)](https://coveralls.io/github/mjacobus/deutsch?branch=csv)
[![Code Climate](https://codeclimate.com/github/mjacobus/deutsch/badges/gpa.svg)](https://codeclimate.com/github/mjacobus/deutsch)
[![Issue Count](https://codeclimate.com/github/mjacobus/deutsch/badges/issue_count.svg)](https://codeclimate.com/github/mjacobus/deutsch)
[![Scrutinizer Code Quality](https://scrutinizer-ci.com/g/mjacobus/deutsch/badges/quality-score.png?b=master)](https://scrutinizer-ci.com/g/mjacobus/deutsch/?branch=master)
[![Dependency Status](https://gemnasium.com/badges/github.com/mjacobus/deutsch.svg)](https://gemnasium.com/github.com/mjacobus/deutsch)



Setup:

```bash
bundle install
yarn install
bundle exec hanami db create
bundle exec hanami db migrate

# generates the appropriate javascripts
yarn run build

# to watch for changes
yarn run watch

bundle exec hanami serve
```

Testing:

```bash
# db setup
HANAMI_ENV=test bundle exec hanami db create
HANAMI_ENV=test bundle exec hanami db migrate

# test run
yarn run test
bundle exec rake spec
```

## Docs

- [webpack](https://webpack.github.io/docs/library-and-externals.html#examples)
- [Twitter Bootstrap](http://getbootstrap.com/css/)
