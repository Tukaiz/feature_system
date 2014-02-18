require "feature_system/feature"
require "feature_system/permission"
module FeatureSystem
  class FeatureValidator
    attr_accessor :feature_def

    def initialize(feature_def)
      @feature = feature_def
    end

    def valid?
      valid_name? && valid_permissions?
    end

    def valid_name?
      @feature.respond_to?(:name) &&
        !@feature.name.blank? && unique_name?
    end

    def unique_name?
      !Feature.exists?(name: @feature.name)
    end

    def valid_permissions?
      @feature.respond_to?(:permissions) &&
        @feature.permissions.is_a?(Array) &&
        valid_permission_defs? &&
        unique_permissions?
    end

    def valid_permission_defs?
      @feature.permissions.all? do |p|
        p.is_a?(Hash) &&
          p.has_key?(:can) &&
          p.has_key?(:callback_name) &&
          p.has_key?(:name)
      end
    end

    def unique_permissions?
      @feature.permissions.all? do |p|
        true unless Permission.find_by(callback_name: p[:callback_name])
      end
    end

    def valid_widgets?
      @feature.respond_to?(:widgets) &&
        @feature.respond_to?(:permissions) &&
        valid_widget_defs? &&
        unique_widgets?
    end

    def valid_widget_defs?
      @feature.widgets.all? do |w|
        p.is_a?(Hash) && p.has_key?(:name)
      end
    end

    def unique_widgets?
      @feature.widgets.all? do |w|
        true unless Widget.find_by(w)
      end
    end
  end
end
