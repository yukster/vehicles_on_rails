# frozen_string_literal: true

class CreateVehicleMakes < ActiveRecord::Migration[6.0]
  def change
    enable_extension 'citext'

    create_table :vehicle_makes do |t|
      t.citext :name, null: false

      t.timestamps
    end

    add_index :vehicle_makes, :name, unique: true
  end
end
