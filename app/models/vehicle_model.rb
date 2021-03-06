# frozen_string_literal: true

# == Schema Information
# Schema version: 20190517171904
#
# Table name: vehicle_models
#
#  id              :bigint           not null, primary key
#  name            :citext           not null
#  vehicle_make_id :bigint           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_vehicle_models_on_vehicle_make_id           (vehicle_make_id)
#  index_vehicle_models_on_vehicle_make_id_and_name  (vehicle_make_id,name) UNIQUE
#

# Represents a Vehicle Model
class VehicleModel < ApplicationRecord
  belongs_to :vehicle_make
  has_many :vehicle_trims

  validates :name, presence: true
  validates :name, uniqueness: { scope: :vehicle_make_id }
  validates :vehicle_make, presence: true
end
