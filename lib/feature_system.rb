require "feature_system/engine"
require "feature_system/provides"

module FeatureSystem
  autoload :FeatureValidator, "feature_system/feature_validator"
  autoload :FeatureConstraint, "feature_system/feature_constraint"
  autoload :FeatureInstaller, "feature_system/feature_installer"
  autoload :FeatureUninstaller, "feature_system/feature_uninstaller"
  autoload :FeatureRegistry, "feature_system/feature_registry"

  module Migration
    class Base
      def install name
        process(name) { |klass| FeatureRegistry.install(klass) }
      end

      def uninstall name
        process(name) { |klass| FeatureRegistry.uninstall(klass) }
      end

      private
      def process name
        input_feature = name.to_s.classify
        if Object.const_defined?(input_feature)
          feature_def_klass = "#{input_feature}FeatureDefinition"
          if input_feature.constantize.const_defined?(feature_def_klass)
            yield "#{input_feature}::#{feature_def_klass}".constantize.new if block_given?
          end
        else
          puts "No feature found by that name...  Did you input the name of the
          feature as the name of your features containing module?"
        end
      end
    end
  end
end
