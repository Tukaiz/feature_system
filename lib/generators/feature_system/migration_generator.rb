module FeatureSystem
  module Generators
    class MigrationGenerator < Rails::Generators::NamedBase
      source_root File.expand_path("../templates", __FILE__)

      desc "This generator creates a new feature migration"
      def copy_migration_file
        template "feature_migration.rb", "feature/migrations/#{migration_name}.rb"
      end

      def migration_name
        "#{class_name.underscore}_#{Time.now.utc.strftime("%Y%m%d%H%M%S")}"
      end

      def class_name
        file_name.camelize
      end
    end
  end
end