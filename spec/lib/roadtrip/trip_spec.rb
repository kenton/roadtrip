require_relative '../../../lib/roadtrip/trip'
require 'spec_helper'
require 'awesome_print'

describe RoadTrip::Trip do
  let(:trip) { RoadTrip::Trip.new(from: "20910", to: "30032", cost_per_gallon: 3.95, vehicle: double) }

  describe "initialize", :vcr do

    it "sets a starting point" do
      expect(trip.from).to eq "20910"
    end

    it "sets an ending point" do
      expect(trip.to).to eq "30032"
    end

    it "sets a cost per gallon" do
      expect(trip.cost_per_gallon).to eq 3.95
    end

    it "sets a vehicle" do
      expect(trip.vehicle).to be
    end

    it "gets the directions from the starting point to the ending point" do
      # for debugging so I can see response as part of test run
      #ap trip.directions["routes"][0]
      expect(trip.directions["routes"][0]["legs"][0]["start_address"]).to eq "Silver Spring, MD 20910, USA"
      expect(trip.directions["routes"][0]["legs"][0]["end_address"]).to eq "Decatur, GA 30032, USA"
    end
  end

  describe "#distance_in_miles", :vcr do
    it "returns the one-way distance from starting point to destination" do
      expect(trip.distance_in_miles).to eq 650.0
    end
  end

  describe "#duration", :vcr do
    it "returns the duration of the trip from starting point to destination" do
      expect(trip.duration).to eq "9 hours 37 mins"
    end
  end

  #   it "calculates the round trip cost for a trip" do
  #     trip.round_trip.should == 100.0
  #   end
  # end
  #it "calculates the one-way cost for a trip"
  #it "finds the distance from the start_location to the end_location"
  #it "finds the duration of a trip"
  #it "returns the round trip distance"
  #it "returns the round trip cost"
  #it "returns the round trip time
  #it "returns the one-way distance", cost and time
  #
  # TODO:
  #   should consider separating out the connection to Google Maps API
  #     something like this, but not quite since we're doing this as a class method
  #     @directions = RoadTrip::GoogleMapsResponse.new(:origin => from, :destination => to)
end




# Time to add your specs!
# http://rspec.info/
# describe "Place your specs here" do
#
#   it "should find the round trip cost for the roadtrip"
#
#   it "should find the distance between the starting point and the end point" do
#     # violated "Be sure to write your specs"
#   end
#
#   it "should calculate the cost of the roadtrip"
#
#   it "should find the duration of the roadtrip"
#
#   it "should show a map of the roadtrip route"
#
# end
