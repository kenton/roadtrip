Feature: RoadTrip::Trip Feature
  Background:

  Scenario: making a new trip
    Given my vehicle is a Honda Accord
    When I create a new Trip from "20910" to "30032"
    Then the Trip should be for a Honda Accord
    Then the Trip's distance should be 650.0 miles
    And the Trip's duration should be 11 hours 11 mins
