# frozen_string_literal: true

# == Schema Information
# Schema version: 20190515050329
#
# Table name: vehicle_trims
#
#  id               :bigint           not null, primary key
#  citext           :string           not null
#  vehicle_model_id :integer          not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
# Indexes
#
#  index_vehicle_trims_on_vehicle_model_id  (vehicle_model_id)
#

require 'test_helper'

class VehicleTrimTest < ActiveSupport::TestCase
  test 'required fields' do
    trim = VehicleTrim.new
    refute trim.valid?
    assert_equal "can't be blank", trim.errors[:name].first
    assert_equal 'must exist', trim.errors[:vehicle_model].first
  end

  test 'name is unique' do
    trim = FactoryBot.create(:vehicle_trim)
    new_trim = VehicleTrim.new(name: trim.name, vehicle_model: trim.vehicle_model)
    refute new_trim.valid?
    assert_equal 'has already been taken', new_trim.errors[:name].first
  end
end
