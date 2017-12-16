Feature: Authorization
  The users should not be able to see things they're not supposed to see

  Background:
    Given the user "admin@uni-bremen.de" exists and is "admin"
    And the user "some@uni-bremen.de" exists and is "financial_administration"
    And the user "another@uni-bremen.de" exists

  Scenario Outline:
    Given the user "<logged_in_user>" is logged in
    When I visit "<path>"
    Then I should be at path "<final_path>"

    Examples:
    | logged_in_user        | path               | final_path         |
    | admin@uni-bremen.de   | /                  | /                  |
    | some@uni-bremen.de    | /                  | /                  |
    | another@uni-bremen.de | /                  | /                  |
    | admin@uni-bremen.de   | /bookings          | /bookings          |
    | some@uni-bremen.de    | /bookings          | /bookings          |
    | another@uni-bremen.de | /bookings          | /                  |
    | admin@uni-bremen.de   | /meetings          | /meetings          |
    | some@uni-bremen.de    | /meetings          | /meetings          |
    | another@uni-bremen.de | /meetings          | /meetings          |
    | admin@uni-bremen.de   | /meetings/new      | /meetings/new      |
    | some@uni-bremen.de    | /meetings/new      | /                  |
    | another@uni-bremen.de | /meetings/new      | /                  |
    | admin@uni-bremen.de   | /budget_years      | /budget_years      |
    | some@uni-bremen.de    | /budget_years      | /budget_years      |
    | another@uni-bremen.de | /budget_years      | /budget_years      |
    | admin@uni-bremen.de   | /budget_years/new  | /budget_years/new  |
    | some@uni-bremen.de    | /budget_years/new  | /                  |
    | another@uni-bremen.de | /budget_years/new  | /                  |

