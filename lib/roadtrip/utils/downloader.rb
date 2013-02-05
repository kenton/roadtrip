require 'open-uri'
require_relative './unzipper'

module RoadTrip
  class Downloader

  attr_accessor :url, :unzipper

    def initialize(params={})
      @url = params[:url] || 'http://www.fueleconomy.gov/feg/epadata/'
      @unzipper = RoadTrip::Unzipper.new
    end

    def get(year)
      prefix = year.to_s.split("")[2..3].join
      remote_url = url + prefix + 'data.zip'
      filename = "#{year}-fuel-economy.zip"
      filepath = File.join("lib/roadtrip/utils/data", filename)

      File.open(filepath, 'wb') do |local_file|
        open(remote_url) do |remote_file|
          local_file.write(remote_file.read)
        end
      end
    end
  end
end
