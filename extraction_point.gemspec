$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "extraction_point/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "extraction_point"
  s.version     = ExtractionPoint::VERSION
  s.authors     = ["Adam Carlile"]
  s.email       = ["adam@musicglue.com"]
  s.homepage    = "http://musicglue.com"
  s.summary     = "A handy gem to dump out your Rails routes as ruby"
  s.description = "Extracts rails routes into an external helper module, to be used by any other ruby application not tied to the Rails framework"

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "~> 3.1.1"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "rspec-rails"
  s.add_development_dependency "rake"
end
