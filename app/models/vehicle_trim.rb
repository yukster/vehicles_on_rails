# frozen_string_literal: true

# == Schema Information
# Schema version: 20190517171904
#
# Table name: vehicle_trims
#
#  id               :bigint           not null, primary key
#  name             :citext           not null
#  vehicle_model_id :bigint           not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
# Indexes
#
#  index_vehicle_trims_on_vehicle_model_id  (vehicle_model_id)
#

# Represents a Vehicle Trim
class VehicleTrim < ApplicationRecord
  belongs_to :vehicle_model

  validates :name, presence: true
  validates :name, uniqueness: { scope: :vehicle_model_id }
  validates :vehicle_model, presence: true
end
