require_relative '../../lib/roadtrip/utils/unzipper'

steps_for :unzipper do

  step "I unzip a zip file" do
    VCR::use_cassette('unzip a file') do
      u = RoadTrip::Unzipper.new
      u.open(2013)
    end
  end

end
