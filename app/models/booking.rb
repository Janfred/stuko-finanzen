class Booking < ApplicationRecord
  belongs_to :budget_year
  belongs_to :financial_request
end
