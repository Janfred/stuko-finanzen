class Meeting < ApplicationRecord
  has_many :financial_requests
  belongs_to :budget_year
end
