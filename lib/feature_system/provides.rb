# This module provides the boilerplate definition
# of what a feature should be.
#
# Features should mixin the provides module within
# their feature definition classes.
#
# Ex.
#
#   module BookOfBusiness
#     class BookOfBusinessFeatureDefinition
#       include FeatureSystem::Provides
#     end
#   end
module FeatureSystem
  # This module provides default implementations
  # of methods that should be present within a "Feature"
  # They may be overridden if the feature needs to register
  # elements of the feature with Backstage.
  module Provides
    # default name implementation
    def name
      self.class.parent.to_s
    end
    # permissions should provide an array of hashes.
    # each hash should have the keys: can, action, and resource.
    #
    # The "can" key should contain a boolean value of true or false e.g
    # can or cannot perform some action.
    #
    # The "action" key should contain a symbol representing the action
    # that should or should not be performed on the resource.
    #
    # The "resource" should be a string representation of the resource
    # that this permission is being created to protect.
    #
    # These keys map to the syntax of the cancan authorization gem.
    # 
    # An example return value of permissions may be:
    #
    #   [{can: true, action: :read, resource: 'Post'}, {can: false, action: :manage, resource: 'Address'}]
    def permissions
      []
    end
    # Still to come...
    def widgets
      []
    end
  end
end
