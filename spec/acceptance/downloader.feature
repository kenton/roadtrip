Feature: RoadTrip::Downloader Feature

  Scenario: Downloading fuel economy data from fueleconomy.gov
    When I download the fuel economy data for 2012
    Then there should be a new file for that year's data
