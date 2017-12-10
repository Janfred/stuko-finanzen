class BudgetYear < ApplicationRecord
  has_many :bookings
  monetize :budget_cents, as: :budget
  monetize :additional_budget_cents, as: :additional_budget

  def called_budget
    bookings.map{ |b| b.amount }.inject(0, :+)
  end

  def remaining_budget
    budget + additional_budget - (called_budget + FinancialRequest.remaining_sum)
  end
end
