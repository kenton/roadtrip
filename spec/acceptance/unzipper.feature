Feature: RoadTrip::Unzipper Feature

	Scenario: Unzipping a data file that's a .zip file
		When I unzip a zip file
		Then there should be a file extracted from the .zip file
