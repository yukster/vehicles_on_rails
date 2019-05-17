# frozen_string_literal: true

# == Schema Information
# Schema version: 20190517171904
#
# Table name: vehicles
#
#  id               :bigint           not null, primary key
#  vin              :citext           not null
#  year             :integer          not null
#  vehicle_make_id  :bigint           not null
#  vehicle_model_id :bigint           not null
#  vehicle_trim_id  :bigint           not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
# Indexes
#
#  index_vehicles_on_vehicle_make_id   (vehicle_make_id)
#  index_vehicles_on_vehicle_model_id  (vehicle_model_id)
#  index_vehicles_on_vehicle_trim_id   (vehicle_trim_id)
#  index_vehicles_on_vin               (vin) UNIQUE
#

require 'test_helper'

class VehicleTest < ActiveSupport::TestCase
  test 'required fields' do
    vehicle = Vehicle.new
    refute vehicle.valid?
    assert_equal "can't be blank", vehicle.errors[:vin].first
    assert_equal 'must exist', vehicle.errors[:vehicle_make].first
    assert_equal 'must exist', vehicle.errors[:vehicle_model].first
    assert_equal 'must exist', vehicle.errors[:vehicle_trim].first
  end

  test 'vin must be unique' do
    vehicle = FactoryBot.create(:vehicle)
    new_vehicle = FactoryBot.build(:vehicle, vin: vehicle.vin)
    refute new_vehicle.valid?
    assert_equal 'has already been taken', new_vehicle.errors[:vin].first
  end

  test 'year must be in range' do
    vehicle = FactoryBot.create(:vehicle)
    vehicle.year = nil
    refute vehicle.valid?
    assert_equal 'must be between 1990 and 2019', vehicle.errors[:year].first

    vehicle.year = 1989
    refute vehicle.valid?
    assert_equal 'must be between 1990 and 2019', vehicle.errors[:year].first
  end
end
