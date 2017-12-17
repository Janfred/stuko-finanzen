require 'test_helper'

class BudgetYearTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "should not save budget year without name" do
    budget_year = BudgetYear.new
    assert_not budget_year.save, "Saved budget year without a name"
  end

  test "should save valid budget year" do
    budget_year = BudgetYear.new
    budget_year.name = "BudgetYear 2016"
    budget_year.budget = 2000
    budget_year.additional_budget = 0
    assert budget_year.save, "Could not save valid budget year."
  end

  # TODO:
  # * check blocked sum
  # * check called sum
  # * check available sum
end
