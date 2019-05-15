# frozen_string_literal: true

# == Schema Information
# Schema version: 20190515050329
#
# Table name: vehicle_makes
#
#  id         :bigint           not null, primary key
#  name       :citext           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_vehicle_makes_on_name  (name) UNIQUE
#

require 'test_helper'

class VehicleMakeTest < ActiveSupport::TestCase
  test 'name is required' do
    make = VehicleMake.new
    refute make.valid?
    assert_equal "can't be blank", make.errors[:name].first
  end
end
