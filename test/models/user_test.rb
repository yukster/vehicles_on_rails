# frozen_string_literal: true

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'username and password are required' do
    # NOTE: this is really testing Devise, but it's good enough for now
    user = User.new
    refute user.valid?
    assert_equal "can't be blank", user.errors[:email].first
    assert_equal "can't be blank", user.errors[:password].first
  end
end
