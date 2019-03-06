# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_03_05_174012) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "appointments", force: :cascade do |t|
    t.bigint "author_id"
    t.bigint "receiver_id"
    t.bigint "services_id"
    t.string "location_address"
    t.float "location_latitude"
    t.float "location_longitude"
    t.datetime "datetime"
    t.string "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_id"], name: "index_appointments_on_author_id"
    t.index ["receiver_id"], name: "index_appointments_on_receiver_id"
    t.index ["services_id"], name: "index_appointments_on_services_id"
  end

  create_table "messages", force: :cascade do |t|
    t.string "content"
    t.bigint "author_id"
    t.bigint "receiver_id"
    t.bigint "appointment_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["appointment_id"], name: "index_messages_on_appointment_id"
    t.index ["author_id"], name: "index_messages_on_author_id"
    t.index ["receiver_id"], name: "index_messages_on_receiver_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.bigint "author_id"
    t.bigint "receiver_id"
    t.string "content"
    t.integer "rating"
    t.boolean "barber_review"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_id"], name: "index_reviews_on_author_id"
    t.index ["receiver_id"], name: "index_reviews_on_receiver_id"
  end

  create_table "services", force: :cascade do |t|
    t.bigint "barber_id"
    t.string "title"
    t.string "description"
    t.float "duration"
    t.float "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["barber_id"], name: "index_services_on_barber_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.float "commute_are_radius"
    t.integer "commute_price"
    t.string "host_service_address"
    t.float "host_service_latitude"
    t.float "host_service_longitude"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "commute_area_address"
    t.float "commute_area_latitude"
    t.float "commute_area_longitude"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "appointments", "services", column: "services_id"
  add_foreign_key "appointments", "users", column: "author_id"
  add_foreign_key "appointments", "users", column: "receiver_id"
  add_foreign_key "messages", "appointments"
  add_foreign_key "messages", "users", column: "author_id"
  add_foreign_key "messages", "users", column: "receiver_id"
  add_foreign_key "reviews", "users", column: "author_id"
  add_foreign_key "reviews", "users", column: "receiver_id"
  add_foreign_key "services", "users", column: "barber_id"
end
