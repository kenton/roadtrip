Feature: Get details for a road trip
  Background:

  Scenario: making a new trip
    Given my vehicle is a "Honda Accord"
    When I create a new Trip from "20910" to "30032"
    Then the Trip's distance should be 100 miles
    And the Trip's duration should be 12 hours
