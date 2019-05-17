# frozen_string_literal: true

class CreateVehicleModels < ActiveRecord::Migration[6.0]
  def change
    enable_extension 'citext'

    create_table :vehicle_models do |t|
      t.citext :name, null: false
      t.bigint :vehicle_make_id, null: false

      t.timestamps
    end

    add_index :vehicle_models, :vehicle_make_id
    add_index :vehicle_models, %i[vehicle_make_id name], unique: true
    add_foreign_key :vehicle_models, :vehicle_makes, on_delete: :cascade
  end
end
