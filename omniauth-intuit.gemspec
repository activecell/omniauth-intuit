# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "omniauth-intuit/version"

Gem::Specification.new do |s|
  s.name        = "omniauth-intuit"
  s.version     = Omniauth::Intuit::VERSION
  s.authors     = ["Jaigouk Kim"]
  s.email       = ["jaigouk@gmail.com"]
  s.homepage    = "https://github.com/jaigouk/omniauth-intuit"
  s.summary     = %q{Intuit strategy for OmniAuth.}
  s.description = %q{Intuit strategy for OmniAuth.}

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_runtime_dependency 'omniauth-oauth', '~> 1.0.0'

  s.add_development_dependency 'rspec', '~> 2.7.0'
  s.add_development_dependency 'rake'
  s.add_development_dependency 'webmock'
  s.add_development_dependency 'rack-test'
end
