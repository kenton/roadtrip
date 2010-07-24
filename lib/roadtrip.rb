$:.unshift(File.dirname(__FILE__)) unless
  $:.include?(File.dirname(__FILE__)) || $:.include?(File.expand_path(File.dirname(__FILE__)))

require 'rubygems'
require 'httparty'
require 'pp'
require 'ap'

module Roadtrip
  VERSION = '0.0.3'
  MILES_PER_METER = 0.000621371192

  dir = File.expand_path(File.join(File.dirname(__FILE__), '..', 'lib'))

  class Trip
    include HTTParty
    format :json
    
    attr_accessor :start, :destination, :cost_per_gallon, :mpg
    
    def initialize(start, destination, cost_per_gallon, mpg)
      @start = start
      @destination = destination
      @cost_per_gallon = cost_per_gallon
      @mpg = mpg
    end

    def trip
      Trip.get('http://maps.google.com/maps/api/directions/json?',
               :query => {
                 :origin  => self.start,
                 :destination   => self.destination,
                 :sensor => "false"
               })
    end

    def distance
      trip["routes"][0]["legs"][0]["distance"]["text"]
    end

    def duration
      trip["routes"][0]["legs"][0]["duration"]["text"]
    end

    def distance_in_miles
      MILES_PER_METER * trip["routes"][0]["legs"][0]["distance"]["value"]
    end

    def cost
      distance_in_miles * self.cost_per_gallon / mpg
    end
    
    def round_trip_cost
      self.cost * 2
    end
   
  end

end
