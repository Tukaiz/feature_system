class Permission < ActiveRecord::Base
  has_one :feature, through: :feature_permission
  has_one :feature_permission
  has_and_belongs_to_many :claims
  belongs_to :permission_category
  validates_uniqueness_of :callback_name

end
