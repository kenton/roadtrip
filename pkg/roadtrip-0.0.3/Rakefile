require 'rubygems'
require 'fileutils'
require './lib/roadtrip'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gemspec|
    gemspec.name = "roadtrip"
    gemspec.summary = "Use Google Maps to find the cost, duration and distance for road trips"
    gemspec.description = "This is a quick little gem that uses Google Maps to determine the distance, duration and fuel costs for driving between two user defined points. Just like Google Maps, the starting and destination points can be full addresses, city/state combinations, or just ZIP codes."
    gemspec.email = "kentonnewby@gmail.com"
    gemspec.homepage = "http://github.com/kenton/roadtrip"
    gemspec.authors = ["Kenton Newby"]
  end
  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler not available. Install it with: gem install jeweler"
end
