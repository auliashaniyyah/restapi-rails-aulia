server '149.129.213.216', port: 22, user: 'pelatihan', roles: [:web, :app, :db], primary: true
set :rails_env, 'production'
set :branch, 'development'
set :deploy_to, '/home/pelatihan/apps/restapi-rails'
set :migration_role, :db
set :migration_servers, -> { primary(fetch(:migration_role)) }
set :conditionally_migrate, true
set :stage, :production
set :puma_threads, [1, 1]
set :puma_workers, 1
set :pty, true
set :use_sudo, false
set :deploy_via, :remote_cache
set :puma_bind, "unix://#{shared_path}/tmp/sockets/#{fetch(:application)}-puma.sock"
set :puma_state, "#{shared_path}/tmp/pids/puma.state"
set :puma_pid, "#{shared_path}/tmp/pids/puma.pid"
set :puma_access_log, "#{release_path}/log/puma.error.log"
set :puma_error_log, "#{release_path}/log/puma.access.log"
set :puma_preload_app, true
set :puma_worker_timeout, nil
set :puma_init_active_record, true # Change to false when not using ActiveRecord