require_relative '../../lib/roadtrip/trip.rb'

steps_for :trip do
  use_steps :vehicle
  step "I create a new Trip from :start_location to :destination" do |start_location, destination|
    VCR::use_cassette('create a new trip step definition') do
      @trip = RoadTrip::Trip.new(
                                 :from            => start_location,
                                 :to              => destination,
                                 :cost_per_gallon => 3.95,
                                 :vehicle         => @vehicle
                                )

    end
  end

  step "the Trip should be for a :car_make :car_model" do |car_make, car_model|
    @trip.vehicle_make.should == "Honda"
    @trip.vehicle_model.should == "Accord"
  end

  step "the Trip's distance should be 650.0 miles" do
    @trip.distance_in_miles.should == 650.0
  end

  step "the Trip's duration should be 11 hours 11 mins" do
    @trip.duration.should == "11 hours 11 mins"
  end
end
