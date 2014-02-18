module FeatureSystem
  class FeaturePermission < ActiveRecord::Base
    belongs_to :feature
    belongs_to :permission, dependent: :destroy
  end
end
