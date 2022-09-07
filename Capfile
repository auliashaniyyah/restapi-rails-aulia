# Load DSL and set up stages
require 'capistrano/setup'
require 'capistrano/deploy'
require 'capistrano/rails/migrations'
require 'capistrano/scm/git'
install_plugin Capistrano::SCM::Git
require 'capistrano/bundler'
require 'capistrano/rbenv'
require 'capistrano/puma'
install_plugin Capistrano::Puma

Dir.glob('lib/capistrano/tasks/*.rake').each { |r| import r }