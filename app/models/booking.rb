class Booking < ApplicationRecord
  belongs_to :budget_year
  belongs_to :financial_request

  monetize :amount_cents, as: :amount
end
