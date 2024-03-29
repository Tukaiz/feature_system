$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "feature_system/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "feature_system"
  s.version     = FeatureSystem::VERSION
  s.authors     = ["Brett Lischalk"]
  s.email       = ["brett@brettlischalk.com"]
  s.homepage    = ""
  s.summary     = "Define core Feature functionality"
  s.description = "Define core Feature functionality"

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["spec/**/*"]

  s.add_dependency "rails", "~> 4.0"
  # s.add_dependency "jquery-rails"
  s.add_development_dependency 'rspec-rails'
  s.add_development_dependency 'capybara'
  s.add_development_dependency 'fatory_girl_rails'

  s.add_development_dependency "sqlite3"
end
