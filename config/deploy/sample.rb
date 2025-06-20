
role :app, %w{35.153.198.159}
role :web, %w{35.153.198.159}
role :db,  %w{35.153.198.159}


set :stage, :production
set :branch, "master"

# used in case we're deploying multiple versions of the same
# app side by side. Also provides quick sanity checks when looking
# at filepaths
set :full_app_name, "#{fetch(:application)}_#{fetch(:stage)}"
set :server_name, "simplycollection.sample.net"

server '35.153.198.159', user: 'centos', roles: %w{web app db}, primary: true

set :deploy_to, "/home/#{fetch(:deploy_user)}/apps/#{fetch(:full_app_name)}"
set :deploy_port, 8080
# dont try and infer something as important as environment from
# stage name.
set :rails_env, :production

# number of unicorn workers, this will be reflected in
# the unicorn.rb and the monit configs
set :unicorn_worker_count, 2

# whether we're using ssl or not, used for building nginx
# config file
set :enable_ssl, false
