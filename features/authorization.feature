Feature: Authorization
  The users should not be able to see things they're not supposed to see

  Background:
    Given the user "admin@uni-bremen.de" exists and is "admin"
    And the user "some@uni-bremen.de" exists, has the id 1 and is "financial_administration"
    And the user "another@uni-bremen.de" exists
    And the budget year "HHJ 17/18" exists and has a budget of 100.00 and an additional budget of 50.00
    And the meeting "2017-11-08" exists and belongs to budget year "HHJ 17/18"
    And the financial request "Something" of applicant "Someone" exists, has an amount of 50.00 and belongs to meeting "2017-11-08"
    And the booking "Something" with amount 50.00 exists and belongs to financial request "Something" of "Someone" at meeting "2017-11-08" and budget year "HHJ 17/18"

  Scenario Outline:
    Given the user "<logged_in_user>" is logged in
    When I visit "<path>"
    Then I should be at path "<final_path>"

    Examples:
    | logged_in_user        | path                       | final_path                 |
    | admin@uni-bremen.de   | /                          | /budget_years              |
    | some@uni-bremen.de    | /                          | /budget_years              |
    | another@uni-bremen.de | /                          | /budget_years              |
    | admin@uni-bremen.de   | /users                     | /users                     |
    | some@uni-bremen.de    | /users                     | /budget_years              |
    | another@uni-bremen.de | /users                     | /budget_years              |
    | admin@uni-bremen.de   | /users/1                   | /users/1                   |
    | some@uni-bremen.de    | /users/1                   | /budget_years              |
    | another@uni-bremen.de | /users/1                   | /budget_years              |
    | admin@uni-bremen.de   | /users/1/edit              | /users/1/edit              |
    | some@uni-bremen.de    | /users/1/edit              | /budget_years              |
    | another@uni-bremen.de | /users/1/edit              | /budget_years              |
    | admin@uni-bremen.de   | /bookings                  | /bookings                  |
    | some@uni-bremen.de    | /bookings                  | /bookings                  |
    | another@uni-bremen.de | /bookings                  | /budget_years              |
    | admin@uni-bremen.de   | /bookings/new              | /bookings/new              |
    | some@uni-bremen.de    | /bookings/new              | /bookings/new              |
    | another@uni-bremen.de | /bookings/new              | /budget_years              |
    | admin@uni-bremen.de   | /meetings                  | /meetings                  |
    | some@uni-bremen.de    | /meetings                  | /meetings                  |
    | another@uni-bremen.de | /meetings                  | /meetings                  |
    | admin@uni-bremen.de   | /meetings/new              | /meetings/new              |
    | some@uni-bremen.de    | /meetings/new              | /meetings                  |
    | another@uni-bremen.de | /meetings/new              | /meetings                  |
    | admin@uni-bremen.de   | /budget_years              | /budget_years              |
    | some@uni-bremen.de    | /budget_years              | /budget_years              |
    | another@uni-bremen.de | /budget_years              | /budget_years              |
    | admin@uni-bremen.de   | /budget_years/new          | /budget_years/new          |
    | some@uni-bremen.de    | /budget_years/new          | /budget_years              |
    | another@uni-bremen.de | /budget_years/new          | /budget_years              |
    | admin@uni-bremen.de   | /budget_years/1            | /budget_years/1            |
    | some@uni-bremen.de    | /budget_years/1            | /budget_years/1            |
    | another@uni-bremen.de | /budget_years/1            | /budget_years/1            |
    | admin@uni-bremen.de   | /budget_years/1/edit       | /budget_years/1/edit       |
    | some@uni-bremen.de    | /budget_years/1/edit       | /budget_years/1            |
    | another@uni-bremen.de | /budget_years/1/edit       | /budget_years/1            |
    | admin@uni-bremen.de   | /financial_requests        | /financial_requests        |
    | some@uni-bremen.de    | /financial_requests        | /financial_requests        |
    | another@uni-bremen.de | /financial_requests        | /financial_requests        |
    | admin@uni-bremen.de   | /financial_requests/new    | /financial_requests/new    |
    | some@uni-bremen.de    | /financial_requests/new    | /financial_requests        |
    | another@uni-bremen.de | /financial_requests/new    | /financial_requests        |
    | admin@uni-bremen.de   | /financial_requests/1      | /financial_requests/1      |
    | some@uni-bremen.de    | /financial_requests/1      | /financial_requests/1      |
    | another@uni-bremen.de | /financial_requests/1      | /financial_requests/1      |
    | admin@uni-bremen.de   | /financial_requests/1/edit | /financial_requests/1/edit |
    | some@uni-bremen.de    | /financial_requests/1/edit | /financial_requests/1      |
    | another@uni-bremen.de | /financial_requests/1/edit | /financial_requests/1      |


