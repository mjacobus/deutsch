# config valid only for current version of Capistrano
lock "3.8.1"

require 'dotenv'
Dotenv.load

set :application, 'salat.netapps.website'
set :repo_url, "git@github.com:mjacobus/deutsch.git"
ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp
set :deploy_to, "/var/www/apps/#{fetch(:application)}"
set :chruby_ruby, 'ruby-2.4.0'
set :pty, true
set :keep_releases, 10
set :bundle_flags, '--deployment'

append :linked_files,
  ".env"

append :linked_dirs,
  "log",
  "tmp/pids",
  "tmp/cache",
  "tmp/sockets",
  "public/system"

namespace :deploy do
  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      # Your restart mechanism here, for example:
      execute :touch, release_path.join('tmp/restart.txt')
    end
  end

  desc 'Yarn build'
  task :yarn_build do
    on roles(:app), in: :sequence, wait: 5 do
      within(release_path) do
        execute :yarn, :install, '--no-progress'
        execute :yarn, :build
      end
    end
  end

  before 'deploy:compile_assets', :yarn_build
  after :publishing, :restart
end
