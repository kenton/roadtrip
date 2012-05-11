require_relative '../../lib/roadtrip/utils/downloader'

steps_for :downloader do

  step "I download the fuel economy data for 2012" do
    VCR::use_cassette('download fuel economy data for 2012') do
      d = RoadTrip::Downloader.new
      d.get(2013)
    end
  end

end
