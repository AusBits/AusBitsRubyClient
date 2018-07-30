$:.push File.expand_path("../lib", __FILE__)

require "ausbits_api/client/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "ausbits_client"
  s.version     = ausbitsAPI::Client::VERSION
  s.authors     = ["ausbits Opensource"]
  s.email       = ["community@ausbits.com.au"]
  s.homepage    = "https://github.com/ausbits/ausbits-client-ruby"
  s.summary     = "A ruby client to access ausbits's API."
  s.description = "A ruby client which can access all ausbits's API."
  s.license     = 'MIT'

  s.require_paths = ["lib"]
  s.files       = Dir["{bin,lib}/**/*"] + ["README.markdown"]

  s.add_runtime_dependency('activesupport')
  s.add_runtime_dependency('faye-websocket')
end
