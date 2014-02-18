class <%= class_name %> < FeatureSystem::Migration::Base
  def change
    <%= direction %> <%= ":#{feature}" %>
  end
end
