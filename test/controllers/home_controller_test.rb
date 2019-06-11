# frozen_string_literal: true

require 'test_helper'

class HomeControllerTest < ActionDispatch::IntegrationTest
  test 'index should have sign-in/up links' do
    get home_index_url
    assert_response :success
    assert_select 'a', text: 'Vehicles on Rails!'
    assert_select 'a', text: 'Register'
  end

  test 'logged in index should have logout link' do
    user = FactoryBot.create(:user, confirmed_at: Date.yesterday)
    get new_user_session_url
    post '/users/sign_in', params: { user: { email: user.email, password: user.password } }
    assert_response :redirect
    get home_index_url
    assert_response :success
    assert_select 'a', text: 'Sign Out'
  end
end
