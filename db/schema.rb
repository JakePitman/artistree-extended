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

ActiveRecord::Schema.define(version: 2018_05_09_074711) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "messages", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "request_id"
    t.text "message_text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["request_id"], name: "index_messages_on_request_id"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "portfolio_pictures", force: :cascade do |t|
    t.text "image_data"
    t.bigint "profile_id"
    t.bigint "style_id"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["profile_id"], name: "index_portfolio_pictures_on_profile_id"
    t.index ["style_id"], name: "index_portfolio_pictures_on_style_id"
  end

  create_table "prof_pictures", force: :cascade do |t|
    t.text "image_data"
    t.bigint "profile_id"
    t.bigint "style_id"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["profile_id"], name: "index_prof_pictures_on_profile_id"
    t.index ["style_id"], name: "index_prof_pictures_on_style_id"
  end

  create_table "profile_pictures", force: :cascade do |t|
    t.text "image_data"
    t.bigint "profile_id"
    t.bigint "style_id"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["profile_id"], name: "index_profile_pictures_on_profile_id"
    t.index ["style_id"], name: "index_profile_pictures_on_style_id"
    t.index ["user_id"], name: "index_profile_pictures_on_user_id"
  end

  create_table "profiles", force: :cascade do |t|
    t.string "username"
    t.string "street_address"
    t.string "city"
    t.string "state"
    t.string "country_code"
    t.string "postcode"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "about"
    t.index ["user_id"], name: "index_profiles_on_user_id"
  end

  create_table "profiles_styles", force: :cascade do |t|
    t.bigint "profile_id"
    t.bigint "style_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["profile_id"], name: "index_profiles_styles_on_profile_id"
    t.index ["style_id"], name: "index_profiles_styles_on_style_id"
  end

  create_table "requests", force: :cascade do |t|
    t.bigint "buyer_id"
    t.bigint "artist_id"
    t.text "image_data"
    t.bigint "style_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "confirmed"
    t.boolean "paid"
    t.integer "price"
    t.index ["artist_id"], name: "index_requests_on_artist_id"
    t.index ["buyer_id"], name: "index_requests_on_buyer_id"
    t.index ["style_id"], name: "index_requests_on_style_id"
  end

  create_table "styles", force: :cascade do |t|
    t.string "style_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

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
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "messages", "requests"
  add_foreign_key "messages", "users"
  add_foreign_key "portfolio_pictures", "profiles"
  add_foreign_key "portfolio_pictures", "styles"
  add_foreign_key "prof_pictures", "profiles"
  add_foreign_key "prof_pictures", "styles"
  add_foreign_key "profile_pictures", "profiles"
  add_foreign_key "profile_pictures", "styles"
  add_foreign_key "profile_pictures", "users"
  add_foreign_key "profiles", "users"
  add_foreign_key "profiles_styles", "profiles"
  add_foreign_key "profiles_styles", "styles"
  add_foreign_key "requests", "styles"
end
