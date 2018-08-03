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

ActiveRecord::Schema.define(version: 2018_08_03_174145) do

  create_table "questionnaires", force: :cascade do |t|
    t.string "fio"
    t.integer "code"
    t.string "sex"
    t.integer "age_years"
    t.integer "age_months"
    t.string "place"
    t.integer "graduate"
    t.integer "weight"
    t.integer "height"
    t.integer "bmi"
    t.boolean "abdominal_pain"
    t.boolean "headache"
    t.boolean "concentration"
    t.boolean "fatigability"
    t.string "average_score"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "user"
    t.boolean "i_1_1"
    t.boolean "i_1_2"
    t.boolean "i_1_3"
    t.boolean "i_1_4"
    t.boolean "i_1_5"
    t.boolean "i_1_6"
    t.boolean "i_1_7"
    t.boolean "i_1_8"
    t.boolean "i_1_9"
    t.boolean "i_1_10"
    t.boolean "i_1_11"
    t.boolean "i_2_1"
    t.boolean "i_2_2"
    t.boolean "i_2_3"
    t.boolean "i_2_4"
    t.boolean "i_2_5"
    t.boolean "i_2_6"
    t.boolean "i_2_7"
    t.boolean "i_2_8"
    t.boolean "i_2_9"
    t.boolean "i_2_10"
    t.boolean "i_2_11"
    t.boolean "i_2_12"
    t.boolean "i_2_13"
    t.boolean "i_3_1"
    t.boolean "i_3_2"
    t.boolean "i_3_3"
    t.boolean "i_3_4"
    t.boolean "i_3_5"
    t.boolean "i_3_6"
    t.boolean "i_3_7"
    t.boolean "i_3_8"
    t.boolean "i_3_9"
    t.boolean "i_3_10"
    t.boolean "i_3_11"
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
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
