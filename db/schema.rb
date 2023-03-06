# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_03_01_130341) do
  create_table "mountains", force: :cascade do |t|
    t.string "name"
    t.string "kana"
    t.integer "height"
    t.string "pre1"
    t.string "pre2"
    t.string "pre3"
    t.string "pre4"
    t.string "area"
    t.string "mont_area"
    t.string "alias1"
    t.string "alias2"
    t.string "alias3"
    t.string "alias4"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reviews", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "mountain_id", null: false
    t.datetime "start_time"
    t.datetime "end_time"
    t.string "number_of_nights"
    t.integer "rest_time"
    t.integer "score"
    t.integer "level"
    t.string "start_point"
    t.string "route"
    t.string "title"
    t.text "content"
    t.integer "image1"
    t.integer "image2"
    t.integer "image3"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["mountain_id"], name: "index_reviews_on_mountain_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "reviews", "mountains"
  add_foreign_key "reviews", "users"
end
