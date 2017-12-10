class FinancialRequest < ApplicationRecord
  belongs_to :meeting, required: false
  has_many :bookings
  monetize :requested_sum_cents, as: :requested_sum, :allow_nil => true

  def called_sum
    return bookings.map{|b| b.amount }.inject(0, :+)
  end

  def open_sum
    return 0 if done?
    return 0 if requested_sum.nil?
    return requested_sum - called_sum
  end

  def self.remaining_sum
    FinancialRequest.all.map{|f| f.open_sum }.inject(0, :+)
  end
end
