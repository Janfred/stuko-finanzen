include Warden::Test::Helpers
Warden.test_mode!

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
