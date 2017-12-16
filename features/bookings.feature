Feature: Bookings
  The users should be able to create and edit bookings.
  Also users should not be able to see any bookings if they have not enough
  rights.

  Background:
    Given the user "admin@uni-bremen.de" exists and is "admin"
    And the user "some@uni-bremen.de" exists and is "financial_administration"
    And the user "another@uni-bremen.de" exists

  Scenario: Index with authorized user
    Given the user "admin@uni-bremen.de" is logged in
    When I visit "/bookings"
    Then I should be at path "/bookings"

  Scenario: Index with authorized user of financial administration
    Given the user "some@uni-bremen.de" is logged in
    When I visit "/bookings"
    Then I should be at path "/bookings"

  Scenario: Index of unauthorized user
    Given the user "another@uni-bremen.de" is logged in
    When I visit "/bookings"
    Then I should be at path "/"
