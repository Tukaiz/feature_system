class Feature < ActiveRecord::Base
  before_save { add_dependents }
  has_many :widgets, dependent: :destroy
  has_many :permissions, through: :feature_permissions
  has_many :feature_permissions, dependent: :destroy
  has_many :sites, through: :site_features
  has_many :site_features, dependent: :destroy

  private
  def add_dependents
    unless persisted?
      sites = Site.all
      self.sites << sites
    end
  end
end
