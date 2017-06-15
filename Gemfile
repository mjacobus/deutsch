source 'https://rubygems.org'

gem 'rake'
gem 'hanami',       '~> 1.0'
gem 'hanami-model', '~> 1.0'
gem 'koine-csv', '~> 0.2.2'
gem 'koine-attributes', '~> 0.1.1'
gem 'nurse-rb', '~> 2.0'
gem 'hanami-bootstrap'

gem 'mysql2'

group :development do
  # Code reloading
  # See: http://hanamirb.org/guides/projects/code-reloading
  gem 'shotgun'
  gem 'capistrano', require: false
  gem 'capistrano-bundler', require: false
  gem 'capistrano-chruby', require: false
  gem 'capistrano-hanami', require: false
end

gem 'dotenv', '~> 2.0'

group :test do
  gem 'rspec'
  gem 'capybara'
end

group :test, :development do
  gem 'pry'
  gem 'rubocop'
  gem 'reek'
  gem 'coveralls', require: false
  gem 'simplecov'
end

group :production do
  # gem 'puma'
end
