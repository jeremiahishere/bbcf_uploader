require "bundler/capistrano"
set :application, "bbcf_uploader"
set :repository,  "git@github.com:jeremiahishere/bbcf_uploader.git"

set :scm, :git
set :branch, "master"
set :rails_env, "production"

role :web, "uploader.jeremiahhemphill.com"                          # Your HTTP server, Apache/etc
role :app, "uploader.jeremiahhemphill.com"                          # This may be the same as your `Web` server
role :db,  "uploader.jeremiahhemphill.com", :primary => true # This is where Rails migrations will run

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
    run "cd /srv/#{application}/current && rake db:drop && rake db:create && rake db:migrate && rake db:seed"
  end  

  task :migrate_db do
    run "cd /srv/#{application}/current && rake db:create RAILS_ENV=production && rake db:migrate RAILS_ENV=production"
  end
end
after "deploy", "db:migrate_db"
