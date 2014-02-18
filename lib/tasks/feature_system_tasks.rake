# desc "Explaining what the task does"
namespace :feature_system do
  desc "Run pending migrations"
  task :migrate => :environment do |t, args|
    Dir["#{Rails.root}/feature/migrations/**/*.rb"].each do |f|
      load f
      file_name     = f.split('/').pop
      pieces        = file_name.split('_')
      timestamp     = pieces.pop
      klass_name    = pieces.join('_').classify
      klass_name.constantize.new.change
    end
  end

  desc "Rollback a migration"
  task :rollback => :environment do |t, args|
  end
end
