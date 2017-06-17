# Configure your routes here
# See: http://hanamirb.org/guides/routing/overview/
#
# Example:
# get '/hello', to: ->(env) { [200, {}, ['Hello from Hanami!']] }
get '/', to: 'index#index'
get '/articles', to: 'articles#index'
get '/articles/test', to: 'articles#test'
