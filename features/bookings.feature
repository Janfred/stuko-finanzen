Feature: Bookings
  The users should be able to create and edit bookings.
  Also users should not be able to see any bookings if they have not enough
  rights.

  Background:
    Given the user "admin@uni-bremen.de" and is "admin"
    And the user "some@uni-bremen.de" and is "financial_administration"
    And the user "another@uni-bremen.de"

  Scenario: Index with authorized user
    Given the user "admin@uni-bremen.de" is logged in
    When I visit "/bookings"
    Then I should not be redirected

  Scenario: Index of unauthorized user
    Given the user "another@uni-bremen.de" is logged in
    When I visit "/bookings"
    Then I should be redirected
