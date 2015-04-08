require 'simplecov'
SimpleCov.start

require 'vcr'

VCR.configure do |c|
  c.cassette_library_dir = File.join("spec", "vcr")
  c.hook_into :webmock
  c.configure_rspec_metadata!
end

RSpec.configure do |c|
end
