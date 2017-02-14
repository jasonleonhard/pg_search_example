# touch lib/tasks/custom_seeds.rake
# mkdir db/seeds
# touch db/seeds/seed_file_name.rb

# lib/tasks/custom_seed.rake
namespace :db do
  namespace :seed do
    Dir[Rails.root.join('db', 'seeds', '*.rb')].each do |filename|
      task_name = File.basename(filename, '.rb').intern
      task task_name => :environment do
        load(filename) if File.exist?(filename)
      end
    end
  end
end
# rake db:seed:seed_file_name
