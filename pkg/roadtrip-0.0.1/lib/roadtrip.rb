$:.unshift(File.dirname(__FILE__)) unless
  $:.include?(File.dirname(__FILE__)) || $:.include?(File.expand_path(File.dirname(__FILE__)))

require 'rubygems'
require 'httparty'
require 'pp'
require 'ap'

module Roadtrip
  VERSION = '0.0.1'
  
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


  # puts "Enter Starting Address or Location"
  # start_location = gets
  # puts "Enter Destination"
  # end_location = gets
  # puts "Enter MPG for your vehicle"
  # mpg = gets.to_f
  # puts "Enter gas cost per gallon"
  # gas_price_per_gallon = gets.to_f

    # trip = Trip.get('http://maps.google.com/maps/api/directions/json?',
    # :query => {
    #   :origin  => start_location,
    #   :destination   => end_location,
    #   :sensor => "false"
    # })

    # ap trip["routes"][0]["legs"][0]

    # distance = trip["routes"][0]["legs"][0]["distance"]["value"]
    # miles = distance * 0.000621371192
    # cost = (gas_price_per_gallon / mpg) * miles

    # puts "\n"
    # puts "----------------------------------------------------------------------"
    # puts "Start Address:      #{trip["routes"][0]["legs"][0]["start_address"]}"
    # puts "End Address:        #{trip["routes"][0]["legs"][0]["end_address"]}"
    # puts "Distance:           #{trip["routes"][0]["legs"][0]["distance"]["text"]}"
    # puts "Duration:           #{trip["routes"][0]["legs"][0]["duration"]["text"]}"
    # puts "Cost (one-way):     $#{cost.to_f.round}"
    # puts "Cost (round trip):  $#{cost.to_f.round * 2}"
    # puts "----------------------------------------------------------------------"
    # puts "\n"
    
    
    
    # ap distance["routes"][0]["legs"][0]
    # puts "#{distance["routes"][0]["legs"]["starting_address"]}"
    # puts "#{distance["routes"][0]["start_address"]}"


# * origin (required) — The address or textual latitude/longitude value from which you wish to calculate directions. *
# * destination (required) — The address or textual latitude/longitude value from which you wish to calculate directions.*
# * mode (optional, defaults to driving) — specifies what mode of transport to use when calculating directions. Valid values are specified in Travel Modes.
# * waypoints (optional) specifies an array of waypoints. Waypoints alter a route by routing it through the specified location(s). A waypoint is specified as either a latitude/longitude coordinate or as an address which will be geocoded. (For more information on waypoints, see Using Waypoints in Routes below.)
# * alternatives (optional), if set to true, specifies that the Directions service may provide more than one route alternative in the response. Note that providing route alternatives may increase the response time from the server.
# * avoid (optional) indicates that the calculated route(s) should avoid the indicated features. Currently, this parameter supports the following two arguments:
#       o tolls indicates that the calculated route should avoid toll roads/bridges.
#       o highways indicates that the calculated route should avoid highways.
#   (For more information see Route Restrictions below.)
# * language (optional) — The language in which to return results. See the supported list of domain languages. Note that we often update supported languages so this list may not be exhaustive. If language is not supplied, the Directions service will attempt to use the native language of the browser wherever possible. You may also explicitly bias the results by using localized domains of http://map.google.com. See Region Biasing for more information.
# * sensor (required) — Indicates whether or not the directions request comes from a device with a location sensor. This value must be either true or false.
