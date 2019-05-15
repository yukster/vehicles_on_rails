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


# Represents a Vehicle Make
class VehicleMake < ApplicationRecord
  has_many :vehicle_models
  validates :name, presence: true
end
