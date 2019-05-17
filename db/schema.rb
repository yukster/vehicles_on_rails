# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_05_17_171904) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "citext"
  enable_extension "plpgsql"

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true
  end

  create_table "vehicle_makes", force: :cascade do |t|
    t.citext "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_vehicle_makes_on_name", unique: true
  end

  create_table "vehicle_models", force: :cascade do |t|
    t.citext "name", null: false
    t.bigint "vehicle_make_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["vehicle_make_id", "name"], name: "index_vehicle_models_on_vehicle_make_id_and_name", unique: true
    t.index ["vehicle_make_id"], name: "index_vehicle_models_on_vehicle_make_id"
  end

  create_table "vehicle_trims", force: :cascade do |t|
    t.citext "name", null: false
    t.bigint "vehicle_model_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["vehicle_model_id"], name: "index_vehicle_trims_on_vehicle_model_id"
  end

  create_table "vehicles", force: :cascade do |t|
    t.citext "vin", null: false
    t.integer "year", null: false
    t.bigint "vehicle_make_id", null: false
    t.bigint "vehicle_model_id", null: false
    t.bigint "vehicle_trim_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["vehicle_make_id"], name: "index_vehicles_on_vehicle_make_id"
    t.index ["vehicle_model_id"], name: "index_vehicles_on_vehicle_model_id"
    t.index ["vehicle_trim_id"], name: "index_vehicles_on_vehicle_trim_id"
    t.index ["vin"], name: "index_vehicles_on_vin", unique: true
  end

  add_foreign_key "vehicle_models", "vehicle_makes", on_delete: :cascade
  add_foreign_key "vehicle_trims", "vehicle_models", on_delete: :cascade
  add_foreign_key "vehicles", "vehicle_makes", on_delete: :cascade
  add_foreign_key "vehicles", "vehicle_models", on_delete: :cascade
  add_foreign_key "vehicles", "vehicle_trims", on_delete: :cascade
end
