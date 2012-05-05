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

  gem.add_development_dependency "rspec",         "~> 2.10.0"
  gem.add_development_dependency "turnip",        "~> 0.3.1"
  gem.add_development_dependency "httparty",      "~> 0.8.3"
  gem.add_development_dependency "vcr",           "~> 2.1.1"
  gem.add_development_dependency "fakeweb",       "~> 1.3.0"
  gem.add_development_dependency "awesome_print", "~> 1.0.2"

end
