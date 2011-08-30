require "bundler/capistrano"

set :application, "bbcf_uploader"
set :stages, %w{bbcf personal demo}
set :default_stage, :bbcf
require "capistrano/ext/multistage"

set :repository,  "git@github.com:jeremiahishere/bbcf_uploader.git"

set :scm, :git
set :branch, "master"
set :deploy_via, :remote_cache


role :web, "jeremiahhemphill.com"                          # Your HTTP server, Apache/etc
role :app, "jeremiahhemphill.com"                          # This may be the same as your `Web` server
role :db,  "jeremiahhemphill.com", :primary => true # This is where Rails migrations will run

namespace :deploy do
  task :start do
    puts "not used"
  end

  task :stop do
    puts "not used"
  end

  task :restart do
    #run "service apache2 restart"
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end

end

task :fix_permissions do
  run "chown www-data.www-data /srv/#{application} -R"
  run "chmod -R 777 /srv/#{application}/shared/log"
end
after "deploy", :fix_permissions

namespace :db do
  task :reset_db do
    run "cd /srv/#{application}/current && rake db:drop RAILS_ENV=#{rails_env} && rake db:create RAILS_ENV=#{rails_env} && rake db:migrate RAILS_ENV=#{rails_env} && rake db:seed RAILS_ENV=#{rails_env}"
  end  

  task :migrate_db do
    run "cd /srv/#{application}/current && rake db:create RAILS_ENV=#{rails_env} && rake db:migrate RAILS_ENV=#{rails_env}"
  end
end
after "deploy", "db:migrate_db"
