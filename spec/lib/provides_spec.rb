require 'spec_helper'
describe FeatureSystem::Provides do
  it 'default permissions array' do
    o = Object.new
    o.extend(FeatureSystem::Provides)
    o.permissions.should eq([])
  end
end
