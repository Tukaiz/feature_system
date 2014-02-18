module FeatureSystem
  class FeatureConstraint
    def initialize(feature_name)
      @feature_name = feature_name.to_s.camelize
    end

    def matches?(request)
      site = Request.find_site(request, request.session)
      FeatureRegistry.totally_enabled?(@feature_name, site)
    end
  end
end
