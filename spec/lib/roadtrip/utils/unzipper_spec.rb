require 'spec_helper'
require_relative '../../../../lib/roadtrip/utils/unzipper'

describe RoadTrip::Unzipper do
  describe "#open" do
    it "extracts the file(s) from the zip file" do
      u = RoadTrip::Unzipper.new
      u.open(2013)
      expect(File.exist?("spec/data/2013.xlsx")).to eq true
    end
  end
end
