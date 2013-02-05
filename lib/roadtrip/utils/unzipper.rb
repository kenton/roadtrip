require 'archive/zip'

module RoadTrip
  class Unzipper

    def open(year)
      filename = "lib/roadtrip/utils/data/" + year.to_s + "-fuel-economy.zip"
      destination = "spec/data"
      Archive::Zip.extract(filename, destination)

      old_filename = Dir.glob("spec/data/*#{year}*").first
      new_filename = "spec/data/#{year}.xlsx"
      File.rename(old_filename, new_filename)
    end

  end
end
