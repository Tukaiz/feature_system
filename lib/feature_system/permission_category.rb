class PermissionCategory < ActiveRecord::Base
  validates_presence_of :name
  has_many :permissions
end
