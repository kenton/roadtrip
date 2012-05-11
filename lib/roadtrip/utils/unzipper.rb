require 'archive/zip'

module RoadTrip
  class Unzipper

    def initialize

    end

    def open(year)
      filename = "lib/roadtrip/utils/data/" + year.to_s + "-fuel-economy.zip"
      destination = "data"
      Archive::Zip.extract(filename, destination)
    end
  end

end
