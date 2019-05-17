# frozen_string_literal: true

require 'test_helper'
require 'vpic_api_gateway'

class VpicApiGatewayTest < ActiveSupport::TestCase
  test 'valid vin returns vehicle data hash' do
    result = VpicApiGateway.decode_vin_values('1FBHE31H5SHB27779')
    assert_equal 'FORD', result['Make']
    assert_equal 'E-350', result['Model']
    assert_equal 'Super Duty Wagon', result['Trim']
  end
end
