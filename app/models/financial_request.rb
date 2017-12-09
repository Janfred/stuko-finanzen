class FinancialRequest < ApplicationRecord
  monetize :requested_sum_cents, as: :requested_sum
end
