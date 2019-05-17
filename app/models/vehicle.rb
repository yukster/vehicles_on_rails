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

# Represents a vehicle
class Vehicle < ApplicationRecord
  belongs_to :vehicle_make
  belongs_to :vehicle_model
  belongs_to :vehicle_trim

  validates :vin, presence: true, uniqueness: true
  validates :year, inclusion: { in: (1990..2019), message: 'must be between 1990 and 2019' }
end
