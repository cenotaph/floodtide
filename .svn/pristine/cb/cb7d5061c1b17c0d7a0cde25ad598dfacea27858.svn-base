require "bundler/capistrano"
require 'thinking_sphinx/deploy/capistrano'
load 'deploy/assets'

set :default_environment, { 
  'PATH' => "/home/informal/webapps/floodtide/bin:/usr/local/bin:/bin:/usr/bin:/usr/local/sbin:/usr/sbin:/sbin:/home/informal/bin",
  'RUBYLIB' => '/home/informal/webapps/floodtide/lib',
  'GEM_HOME' =>  "/home/informal/webapps/floodtide/gems"
}


set :application, "floodtide"
set :repository,  "http://code.icewhistle.com/floodtide/trunk"
set :deploy_to, "/home/informal/webapps/floodtide/dist"
set :scm, :subversion
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

role :web, "95.211.171.86"                          # Your HTTP server, Apache/etc
role :app, "95.211.171.86"                          # This may be the same as your `Web` server
role :db,  "95.211.171.86", :primary => true # This is where Rails migrations will run
set :user, "informal"
set :scm_username, "fail"
set :scm_password, Proc.new { Capistrano::CLI.password_prompt('SVN Password: ') }
set :use_sudo, false
default_run_options[:pty] = true
set :keep_releases, 3

after "deploy:update_code", "deploy:migrate"

desc "symlink to static"
task :after_finalize_update, :roles => [:web, :app] do
  run <<-CMD
  ln -sf #{shared_path}/static/uploads #{latest_release}/public/uploads &&
  ln -sf #{shared_path}/static/ckeditor_assets #{latest_release}/public/ckeditor_assets &&
  cp #{shared_path}/config/database-template.yml #{latest_release}/config/database.yml 
  # chown informal:informal #{latest_release}/log/*
  CMD
end

namespace :deploy do
  desc "Restart nginx"
  task :restart do
    run "#{deploy_to}/../bin/restart"
  end
end