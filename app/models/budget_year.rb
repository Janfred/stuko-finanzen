class BudgetYear < ApplicationRecord
  monetize :budget_cents, as: :budget
  monetize :additional_budget_cents, as: :additional_budget
end
