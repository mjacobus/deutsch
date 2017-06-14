Deutsch Lernen
-----------------------

[![Build Status](https://travis-ci.org/mjacobus/deutsch.svg?branch=master)](https://travis-ci.org/mjacobus/deutsch)

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
