# -*- encoding: utf-8 -*-
require File.expand_path('../lib/roadtrip/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Kenton Newby"]
  gem.email         = ["kentonnewby@gmail.com"]
  gem.description   = %q{Calculates cost of a road trip between two locations in the United States}
  gem.summary       = %q{Calculates cost of a road trip between two locations in the United States}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "roadtrip"
  gem.require_paths = ["lib"]
  gem.version       = Roadtrip::VERSION

  gem.add_dependency "archive-zip", "~> 0.7.0"
  gem.add_dependency "httparty",    "~> 0.13.0"
	gem.add_dependency "rubyXL",      "~> 1.2.7"
	gem.add_dependency "rubyzip",     "~> 0.9.8"
  gem.add_dependency "nokogiri",    "~> 1.6.0"

  gem.add_development_dependency "rspec",         "~> 3.2.0"
  gem.add_development_dependency "simplecov",     "~> 0.9.0"
  gem.add_development_dependency "turnip",        "~> 1.2.0"
  gem.add_development_dependency "vcr",           "~> 2.9.0"
  gem.add_development_dependency "webmock",       "~> 1.21.0"
  gem.add_development_dependency "awesome_print", "~> 1.6.0"
  gem.add_development_dependency "rake",          "~> 10.4.0"

end
