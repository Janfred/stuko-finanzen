require 'test_helper'

class AbilityTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "admin should be able to see all users" do
    user = User.create!({uid: "admin@uni-bremen.de", role: "admin"})
    ability = Ability.new(user)
    assert ability.can?(:manage, User)
  end

  test "admin should be able to edit users" do
    user = User.create!({uid: "admin@uni-bremen.de", role: "admin"})
    ability = Ability.new(user)
    assert ability.can?(:edit, user)
  end

  test "admin should be able to delete users" do
    user = User.create!({uid: "admin@uni-bremen.de", role: "admin"})
    user2 = User.create!({uid: "other@uni-bremen.de"})
    ability = Ability.new(user)
    assert ability.can?(:delete, user2)
  end

  test "admin should not be able to delete himself" do
    user = User.create!({uid: "admin@uni-bremen.de", role: "admin"})
    ability = Ability.new(user)
    assert ability.cannot?(:delete, user)
  end

  test "admin should be able to view bookings" do
    user = User.create!({uid: "admin@uni-bremen.de", role: "admin"})
    ability = Ability.new(user)
    assert ability.can?(:manage, Booking)
  end

  test "financial administration should be able to view bookings" do
    user = User.create!({uid: "some@uni-bremen.de", role: "financial_administration"})
    ability = Ability.new(user)
    assert ability.can?(:view, Booking)
  end
end
