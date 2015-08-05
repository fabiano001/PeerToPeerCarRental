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

ActiveRecord::Schema.define(version: 20150805172801) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree

  create_table "admin_users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true, using: :btree
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true, using: :btree

  create_table "caches", force: :cascade do |t|
    t.string   "search_results"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "user_id"
  end

  add_index "caches", ["user_id"], name: "index_caches_on_user_id", using: :btree

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
    t.integer  "price"
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.string   "driven_wheels"
    t.string   "vehichle_size"
    t.string   "fuel_type"
    t.boolean  "antilock_brake_system"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
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
    t.integer  "chat_id"
    t.integer  "from_id"
    t.integer  "to_id"
  end

  add_index "messages", ["chat_id"], name: "index_messages_on_chat_id", using: :btree

  create_table "pictures", force: :cascade do |t|
    t.string   "path"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "car_id"
  end

  add_index "pictures", ["car_id"], name: "index_pictures_on_car_id", using: :btree

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
    t.string   "role"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "caches", "users"
  add_foreign_key "cars", "users"
  add_foreign_key "messages", "chats"
  add_foreign_key "pictures", "cars"
  add_foreign_key "reviews", "rentals"
end
