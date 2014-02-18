module FeatureSystem
  class FeatureInstaller
    attr_accessor :feature_def
    def initialize(feature_def)
      @feature_def = feature_def
    end

    def install
      begin_feature
      create_permissions
      create_widgets
      commit_feature
    end

    def begin_feature
      @feature = Feature.new(name: @feature_def.name)
    end

    def create_permissions
      @feature_def.permissions.each do |p|
        permission = Permission.create!(p)
        @feature.permissions << permission if permission
      end
    end

    def create_widgets
      @feature_def.widgets.each do |w|
        @feature.widgets.build(w)
      end
    end

    def commit_feature
      @feature.save!
    end
  end
end
