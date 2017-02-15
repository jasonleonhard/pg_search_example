# lib/tasks/do_it_all.rake
desc 'drop create migrate seed db then run rails server'
task :run do
  `bin/rails db:drop db:create db:migrate db:seed:seed_file_name;
   rails s;`
end

# rake db:seed:seed_file_name
