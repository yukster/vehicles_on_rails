# frozen_string_literal: true

class CreateVehicleTrims < ActiveRecord::Migration[6.0]
  def change
    enable_extension 'citext'

    create_table :vehicle_trims do |t|
      t.citext :name, null: false
      t.bigint :vehicle_model_id, null: false

      t.timestamps
    end

    add_index :vehicle_trims, :vehicle_model_id
    add_foreign_key :vehicle_trims, :vehicle_models, on_delete: :cascade
  end
end
