require_relative '../../../../lib/roadtrip/utils/unzipper'

describe RoadTrip::Unzipper do
  describe "#open" do
    it "extracts the file(s) from the zip file" do
      u = RoadTrip::Unzipper.new
      u.open(2013)
      File.exist?("spec/data/2013.xlsx").should be_true
    end
  end
end
