lock '~> 3.17'

set :application, 'restapi-rails-aulia'
set :repo_url, 'git@github.com:auliashaniyyah/restapi-rails-aulia.git'
set :deploy_to, '/home/pelatiahan/apps/restapi-rails-aulia'
append :linked_files, 'config/master.key', '.env'
append :linked_dirs, 'public/uploads'
set :keep_releases, 2
set :rbenv_type, :user # or :system, or :fullstaq (for Fullstaq Ruby), depends on your rbenv setup
set :rbenv_ruby, '3.0.2'

namespace :puma do
  desc 'Create Directories for Puma Pids and Socket'
  task :make_dirs do
    on roles(:app) do
      execute "mkdir #{shared_path}/tmp/sockets -p"
      execute "mkdir #{shared_path}/tmp/pids -p"
    end
  end

  before :start, :make_dirs
end

namespace :deploy do
  desc 'Initial Deploy'
  task :initial do
    on roles(:app) do
      before 'deploy:restart', 'puma:start'
      invoke 'deploy'
    end
  end

  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      invoke 'puma:restart'
    end
  end
end

namespace :db do
  desc 'Do DB migrate'
  task :migrate do
    on roles(:app) do
      within release_path do
        with rails_env: fetch(:rails_env) do
          execute :rake, 'db:migrate'
        end
      end
    end
  end
  task :setup do
    on roles(:app) do
      within release_path do
        with rails_env: fetch(:rails_env) do
          execute :rake, 'db:setup'
        end
      end
    end
  end
end