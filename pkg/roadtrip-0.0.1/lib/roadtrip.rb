$:.unshift(File.dirname(__FILE__)) unless
  $:.include?(File.dirname(__FILE__)) || $:.include?(File.expand_path(File.dirname(__FILE__)))

require 'rubygems'
require 'httparty'
require 'pp'
require 'ap'

module Roadtrip
  VERSION = '0.0.3'
  
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
    
    def distance
      trip = Trip.get('http://maps.google.com/maps/api/directions/json?',
      :query => {
        :origin  => self.start,
        :destination   => self.destination,
        :sensor => "false"
      })
      
      trip["routes"][0]["legs"][0]["distance"]["text"]
    end
    
    def duration
      trip = Trip.get('http://maps.google.com/maps/api/directions/json?',
      :query => {
        :origin  => self.start,
        :destination   => self.destination,
        :sensor => "false"
      })
      
      trip["routes"][0]["legs"][0]["duration"]["text"]
    end
    
    def cost
      trip = Trip.get('http://maps.google.com/maps/api/directions/json?',
      :query => {
        :origin  => self.start,
        :destination   => self.destination,
        :sensor => "false"
      })
      
      distance = trip["routes"][0]["legs"][0]["distance"]["value"]
      miles = distance * 0.000621371192
      cost = (self.cost_per_gallon / mpg) * miles
      return cost
    end
    
    def round_trip_cost
      self.cost * 2
    end
   
  end

end