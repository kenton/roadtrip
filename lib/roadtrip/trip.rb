require 'forwardable'
require 'httparty'

module RoadTrip
  class Trip
    extend Forwardable
    include HTTParty
    format :json

    attr_accessor :from, :to, :cost_per_gallon, :vehicle, :directions
    def_delegator :@vehicle, :make, :vehicle_make
    def_delegator :@vehicle, :name, :vehicle_model

    def initialize(params)
      @from            = params[:from]
      @to              = params[:to]
      @cost_per_gallon = params[:cost_per_gallon]
      @vehicle         = params[:vehicle]
      @directions      = get_directions
    end

    def directions
      @directions ||= get_directions
    end

    def get_directions
      Trip.get('http://maps.google.com/maps/api/directions/json?',
               :query => {
                 :origin      => self.from,
                 :destination => self.to,
                 :sensor      => "false"
              })
    end

    def distance_in_miles
      @directions["routes"][0]["legs"][0]["distance"]["text"].split(" ").first.to_f
    end

    def duration
      @directions["routes"][0]["legs"][0]["duration"]["text"]
    end

    # other info available for a trip
    #   bounds - NE and SW latlng's
    #   distance
    #   duration
    #   starting point latlng
    #   ending point latlng
    #   waypoints

  end
end
