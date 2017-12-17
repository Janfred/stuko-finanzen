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

  def to_select_string
    name+" ("+applicant+")"
  end

  def self.remaining_sum
    FinancialRequest.all.map{|f| f.open_sum }.inject(0, :+)
  end

  def self.option_group_for_select
    option_group_helper(FinancialRequest.all)
  end

  def self.option_group_for_select_only_undone
    option_group_helper(FinancialRequest.where(done: false))
  end

  private

  def self.option_group_helper(list)
    @data = Hash.new
    list.each do |f|
      meeting = "Ohne StuKo"
      meeting = f.meeting.date unless f.meeting.nil?
      @data[meeting] ||= Array.new
      @data[meeting] << [f.to_select_string, f.id]
    end
    @data
  end
end
