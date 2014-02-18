require "feature_system/feature_validator"
require "feature_system/feature_installer"
require "feature_system/feature_uninstaller"
require "feature_system/feature"
module FeatureSystem
  class FeatureRegistry
    def self.install(feature_def)
      if FeatureValidator.new(feature_def).valid?
        FeatureInstaller.new(feature_def).install
      else
        raise 'Uncompliant Feature'
      end
    end

    def self.uninstall(feature_def)
      FeatureUninstaller.new(feature_def).uninstall
    end

    def self.enabled?(feature_name)
      feature = Feature.find_by(name: feature_name)
      feature.enabled if feature
    end

    def self.totally_enabled?(feature_name, current_site)
      feature = Feature.find_by(name: feature_name, enabled: true)
      site_feature = SiteFeature.find_by(
        feature: feature,
        site: current_site,
        enabled: true
      ) if feature
      feature && site_feature
    end

    def self.enable(feature_name)
      feature = Feature.find_by(name: feature_name)
      feature.update(enabled: true) if feature
    end

    def self.disable(feature_name)
      feature = Feature.find_by(name: feature_name)
      feature.update(enabled: false) if feature
    end
  end
end
