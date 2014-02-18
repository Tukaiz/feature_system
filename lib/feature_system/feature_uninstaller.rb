module FeatureSystem
  class FeatureUninstaller
    attr_accessor :feature_def

    def initialize(feature_def)
      @feature_def = feature_def
    end

    def uninstall
      feature = Feature.find_by(name: @feature_def.name)
      feature.destroy if feature
    end

  end
end
