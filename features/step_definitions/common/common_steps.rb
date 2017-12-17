include Warden::Test::Helpers
Warden.test_mode!

Given("the user {string} exists, has the id {int} and is {string}") do |username, id, role|
  User.create({id: id, uid: username, role: role})
end

Given("the user {string} exists and is {string}") do |username, role|
  User.create({uid: username, role: role})
end

Given("the user {string} exists") do |username|
  User.create({uid: username})
end

Given("the user {string} is logged in") do |uid|
  u = User.where(uid: uid)
  return false if u.count != 1
  u = u.first
  login_as(u)
end

Given("the budget year {string} exists and has a budget of {float} and an additional budget of {float}") do |budget_year_name, budget, additional_budget|
  params = {name: budget_year_name, budget: budget, additional_budget: additional_budget}
  params[:id] = 1 if BudgetYear.where(id: 1).empty?
  BudgetYear.create!(params)
end

Given("the meeting {string} exists and belongs to budget year {string}") do |meeting_date, budget_year_name|
  b = BudgetYear.where(name: budget_year_name)
  return false if b.length !=1
  b = b.first

  params = {date: meeting_date, budget_year: b}
  params[:id] = 1 if Meeting.where(id: 1).empty?
  Meeting.create!(params)
end

Given("the financial request {string} of applicant {string} exists, has an amount of {float} and belongs to meeting {string}") do |financial_request_name, financial_request_applicant, financial_request_amount, meeting_date|
  m = Meeting.where(date: meeting_date)
  return false if m.length != 1
  m = m.first

  params = {name: financial_request_name, applicant: financial_request_applicant, requested_sum: financial_request_amount, meeting: m}
  params[:id] = 1 if FinancialRequest.where(id: 1).empty?
  FinancialRequest.create!(params)
end

Given("the booking {string} with amount {float} exists and belongs to financial request {string} of {string} at meeting {string} and budget year {string}") do |booking_name, booking_amount, financial_request_name, financial_request_applicant, meeting_date, budget_year_name|
  b = BudgetYear.where(name: budget_year_name)
  return false if b.length != 1
  b = b.first

  m = Meeting.where(date: meeting_date)
  return false if m.length != 1
  m = m.first

  f = FinancialRequest.where(name: financial_request_name, applicant: financial_request_applicant, meeting: m)
  return false if f.length != 1
  f = f.first

  params = {comment: booking_name, amount: booking_amount, budget_year: b, financial_request: f}
  params[:id] = 1 if Booking.where(id: 1).empty?
  Booking.create!(params)
end

When("I visit {string}") do |path|
  visit path
end

Then("I should not be redirected") do
  # TODO check for no redirection istead of response code
  assert page.status_code == 200
end

Then("I should be redirected") do
  # TODO check for redirect instead of path
  #puts local_variables.inspect
  assert page.current_path == "/"
end

Then("I should be at path {string}") do |path|
  assert_equal path, page.current_path
end
