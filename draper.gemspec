# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "draper/version"

Gem::Specification.new do |s|
  s.name = "draper-twin"
  s.version = Draper::VERSION
  s.authors = ["Jeff Casismir", "Steve Klabnik"]
  s.email = ["steve@steveklabnik.com"]
  s.homepage = "https://github.com/kiote/drapper-twin"
  s.summary = "View Models for Rails"
  s.description = "Draper adds an object-oriented layer of presentation logic"
  s.license = "MIT"

  s.files = `git ls-files`.split("\n")
  s.test_files = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables = `git ls-files --bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_patjs = ["lib"]

  s.add_dependency 'activesupport', '>= 3.0'
  s.add_dependency 'actionpack', '>= 3.0'
  s.add_dependency 'request_store', '~> 1.0.3'
  s.add_dependency 'activemodel', '>= 3.0'

  s.add_development_dependency 'ammeter'
  s.add_development_dependency 'rake', '>= 0.9.2'
  s.add_development_dependency 'rspec', '~> 2.12'
  s.add_development_dependency 'rspec-mock', '>= 2.12.1'
  s.add_development_dependency 'rspec-rails', '~> 2.12'
  s.add_development_dependency 'minitest-rails', '~> 0.2'
  s.add_development_dependency 'capybara'
  s.add_development_dependency 'active_model_seroalizers'
end
