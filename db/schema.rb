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

ActiveRecord::Schema.define(version: 2018_08_05_172031) do

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
    t.boolean "i_4_1"
    t.boolean "i_4_2"
    t.boolean "i_4_3"
    t.boolean "i_4_4"
    t.boolean "i_4_5"
    t.boolean "i_4_6"
    t.boolean "i_4_7"
    t.boolean "i_4_8"
    t.boolean "i_4_9"
    t.boolean "i_4_10"
    t.boolean "i_4_11"
    t.boolean "i_4_12"
    t.boolean "i_4_13"
    t.boolean "i_5_1"
    t.boolean "i_5_2"
    t.boolean "i_5_3"
    t.boolean "i_5_4"
    t.boolean "i_5_5"
    t.boolean "i_5_6"
    t.boolean "i_5_7"
    t.boolean "i_5_8"
    t.boolean "i_5_9"
    t.boolean "i_5_10"
    t.boolean "i_5_11"
    t.boolean "i_5_12"
    t.boolean "i_5_13"
    t.boolean "i_5_14"
    t.boolean "i_5_15"
    t.boolean "i_5_16"
    t.boolean "i_5_17"
    t.boolean "i_5_18"
    t.boolean "i_5_19"
    t.boolean "i_5_20"
    t.boolean "i_6_1"
    t.boolean "i_6_2"
    t.boolean "i_6_3"
    t.boolean "i_7_1"
    t.boolean "i_7_2"
    t.boolean "i_7_3"
    t.boolean "i_8_1"
    t.boolean "i_8_2"
    t.boolean "i_8_3"
    t.boolean "i_8_4"
    t.boolean "i_8_5"
    t.boolean "i_8_6"
    t.boolean "i_8_7"
    t.boolean "i_8_8"
    t.boolean "i_8_9"
    t.boolean "i_8_10"
    t.boolean "i_8_11"
    t.boolean "i_9_1"
    t.boolean "i_9_2"
    t.boolean "i_9_3"
    t.boolean "i_9_4"
    t.boolean "i_9_5"
    t.boolean "i_9_6"
    t.text "i_10_1"
    t.text "i_11_1"
    t.boolean "i_12_1"
    t.boolean "i_12_2"
    t.boolean "i_12_3"
    t.boolean "i_13_1"
    t.boolean "i_13_2"
    t.boolean "i_13_3"
    t.boolean "i_14_1"
    t.boolean "i_14_2"
    t.boolean "i_14_3"
    t.boolean "i_15_1"
    t.boolean "i_15_2"
    t.boolean "i_15_3"
    t.boolean "i_16_1"
    t.boolean "i_16_2"
    t.boolean "i_16_3"
    t.boolean "i_17_1"
    t.boolean "i_17_2"
    t.boolean "i_17_3"
    t.boolean "ii_1_1"
    t.boolean "ii_1_2"
    t.boolean "ii_1_3"
    t.boolean "ii_1_4"
    t.boolean "ii_1_5"
    t.boolean "ii_1_6"
    t.boolean "ii_1_7"
    t.boolean "ii_1_8"
    t.boolean "ii_1_9"
    t.boolean "ii_2_1"
    t.boolean "ii_2_2"
    t.boolean "ii_2_3"
    t.boolean "ii_2_4"
    t.boolean "ii_2_5"
    t.boolean "ii_2_6"
    t.boolean "ii_2_7"
    t.boolean "ii_2_8"
    t.boolean "ii_2_9"
    t.boolean "ii_2_10"
    t.boolean "ii_2_11"
    t.boolean "ii_2_12"
    t.boolean "ii_3_1"
    t.boolean "ii_3_2"
    t.boolean "ii_3_3"
    t.boolean "ii_4_1"
    t.boolean "ii_4_2"
    t.boolean "ii_4_3"
    t.boolean "ii_4_4"
    t.boolean "ii_4_5"
    t.boolean "ii_4_6"
    t.boolean "ii_4_7"
    t.boolean "ii_4_8"
    t.boolean "ii_4_9"
    t.boolean "ii_4_10"
    t.boolean "ii_4_11"
    t.boolean "ii_4_12"
    t.boolean "ii_5_1"
    t.boolean "ii_5_2"
    t.boolean "ii_5_3"
    t.boolean "ii_5_4"
    t.text "ii_5_5"
    t.boolean "ii_6_1"
    t.boolean "ii_6_2"
    t.boolean "ii_6_3"
    t.text "ii_6_4"
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
