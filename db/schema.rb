# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20150730053816) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "car_pictures", force: :cascade do |t|
    t.string   "path"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "car_id"
  end

  add_index "car_pictures", ["car_id"], name: "index_car_pictures_on_car_id", using: :btree

  create_table "cars", force: :cascade do |t|
    t.string   "make"
    t.string   "model"
    t.integer  "year"
    t.string   "type"
    t.string   "color"
    t.string   "body_type"
    t.string   "engine_type"
    t.string   "transmission"
    t.boolean  "audio_input"
    t.boolean  "bluetooth"
    t.boolean  "heated_seats"
    t.boolean  "sun_roof"
    t.boolean  "four_wheel_drive"
    t.boolean  "rearview_camera"
    t.boolean  "gps"
    t.boolean  "air_conditioner"
    t.boolean  "electric_doors"
    t.boolean  "electric_seats"
    t.string   "condition"
    t.string   "video"
    t.string   "description"
    t.integer  "latitude"
    t.integer  "longitude"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "user_id"
  end

  add_index "cars", ["user_id"], name: "index_cars_on_user_id", using: :btree

  create_table "chats", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "renter_id"
    t.integer  "owner_id"
  end

  create_table "messages", force: :cascade do |t|
    t.string   "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "from_id"
    t.integer  "to_id"
    t.integer  "chat_id"
  end

  add_index "messages", ["chat_id"], name: "index_messages_on_chat_id", using: :btree

  create_table "rentals", force: :cascade do |t|
    t.datetime "start_date"
    t.integer  "duration"
    t.integer  "daily_price"
    t.integer  "total_price"
    t.boolean  "payment_processed"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.integer  "renter_id"
    t.integer  "owner_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.integer  "rating"
    t.string   "comment"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.integer  "reviewer_id"
    t.integer  "review_subject_id"
    t.integer  "rental_id"
  end

  add_index "reviews", ["rental_id"], name: "index_reviews_on_rental_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                   default: "", null: false
    t.string   "encrypted_password",      default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",           default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.string   "name"
    t.string   "billing_address"
    t.string   "billing_city"
    t.string   "billing_state"
    t.string   "billing_country"
    t.string   "drivers_license"
    t.string   "drivers_license_state"
    t.string   "drivers_licence_country"
    t.string   "photo"
    t.string   "bio"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "car_pictures", "cars"
  add_foreign_key "cars", "users"
  add_foreign_key "messages", "chats"
  add_foreign_key "reviews", "rentals"
end
