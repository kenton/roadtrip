require_relative '../../lib/roadtrip/vehicle.rb'

steps_for :vehicle do
  step 'my vehicle is a :car_make :car_model' do |car_make, car_model|
    @vehicle = Vehicle.new(:make => car_make, :model => car_model)
  end
end
