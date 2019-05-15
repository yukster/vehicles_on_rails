# frozen_string_literal: true

require 'test_helper'

class HomeControllerTest < ActionDispatch::IntegrationTest
  test 'index should have sign-in/up links' do
    get home_index_url
    assert_response :success
    assert_select 'a', text: 'Vehicles on Rails!'
    assert_select 'a', text: 'Register'
  end
end
