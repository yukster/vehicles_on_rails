# frozen_string_literal: true

class CreateVehicles < ActiveRecord::Migration[6.0]
  def change
    create_table :vehicles do |t|
      t.citext :vin, null: false
      t.integer :year, null: false
      t.bigint :vehicle_make_id, null: false
      t.bigint :vehicle_model_id, null: false
      t.bigint :vehicle_trim_id, null: false

      t.timestamps
    end

    add_index :vehicles, :vin, unique: true

    add_index :vehicles, :vehicle_make_id
    add_foreign_key :vehicles, :vehicle_makes, on_delete: :cascade

    add_index :vehicles, :vehicle_model_id
    add_foreign_key :vehicles, :vehicle_models, on_delete: :cascade

    add_index :vehicles, :vehicle_trim_id
    add_foreign_key :vehicles, :vehicle_trims, on_delete: :cascade
  end
end
