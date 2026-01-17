require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "user with a valid email and password" do
    user = User.new(email: "test@test.org", password_digest: "password")
    assert user.valid?
  end

  test "user with an invalid email should be invalid" do
    user = User.new(email: "invalid_email", password_digest: "password")
    assert_not user.valid?
  end

  test "user with taken email should be invalid" do
    other_user = users(:one)
    user = User.new(email: other_user.email, password_digest: "password")
    assert_not user.valid?
  end
end
