Feature: create trip 
As a road tripper
I want to create a new trip 
So that I can find out how much it will cost to get there 

Scenario: create trip
	Given I haven't created a trip yet 
	When I create a new trip
	Then I should see "..." 
	And I should see "..."