require_relative '../../lib/roadtrip/utils/unzipper'

steps_for :unzipper do

  step "a file should be extracted when I unzip a zip file" do
    xls_file = "spec/data/2013.xlsx"
    File.delete(xls_file) if File.exist?(xls_file)

    VCR::use_cassette('unzip a file') do
      if File.exist? "lib/roadtrip/utils/data/2013-fuel-economy.zip"
        u = RoadTrip::Unzipper.new
        u.open(2013)
      else
        raise "Can't find specified file"
      end
    end
    File.exist?("spec/data/2013.xlsx").should be_true
  end

end
