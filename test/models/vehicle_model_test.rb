# frozen_string_literal: true

# == Schema Information
# Schema version: 20190515050329
#
# Table name: vehicle_models
#
#  id              :bigint           not null, primary key
#  name            :citext           not null
#  vehicle_make_id :integer          not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_vehicle_models_on_vehicle_make_id  (vehicle_make_id)
#

require 'test_helper'

class VehicleModelTest < ActiveSupport::TestCase
  test 'required fields' do
    model = VehicleModel.new
    refute model.valid?
    assert_equal "can't be blank", model.errors[:name].first
    assert_equal 'must exist', model.errors[:vehicle_make].first
  end

  test 'name is unique' do
    model = FactoryBot.create(:vehicle_model)
    new_model = VehicleModel.new(name: model.name, vehicle_make: model.vehicle_make)
    refute new_model.valid?
    assert_equal 'has already been taken', new_model.errors[:name].first
  end
end
