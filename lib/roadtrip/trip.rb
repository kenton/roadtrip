require 'httparty'
require_relative '../../spec/support/vcr'

module RoadTrip
	class Trip
		include HTTParty
		format :json

		attr_accessor :from, :to, :cost_per_gallon, :vehicle, :directions
    
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

		# other info available for a trip
		#   bounds - NE and SW latlng's
		#   distance
		#   duration
		#   starting point latlng
		#   ending point latlng
		#   waypoints

	end
end
