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

ActiveRecord::Schema.define(version: 20171215022037) do

  create_table "bookings", force: :cascade do |t|
    t.integer "amount_cents"
    t.string "comment"
    t.date "date"
    t.integer "budget_year_id"
    t.integer "financial_request_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["budget_year_id"], name: "index_bookings_on_budget_year_id"
    t.index ["financial_request_id"], name: "index_bookings_on_financial_request_id"
  end

  create_table "budget_years", force: :cascade do |t|
    t.string "name"
    t.integer "budget_cents"
    t.integer "additional_budget_cents"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "financial_requests", force: :cascade do |t|
    t.string "name"
    t.string "applicant"
    t.integer "requested_sum_cents"
    t.date "date"
    t.boolean "done"
    t.string "agenda_item"
    t.integer "meeting_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["meeting_id"], name: "index_financial_requests_on_meeting_id"
  end

  create_table "meetings", force: :cascade do |t|
    t.date "date"
    t.integer "budget_year_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["budget_year_id"], name: "index_meetings_on_budget_year_id"
  end

  create_table "users", force: :cascade do |t|
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "provider"
    t.string "uid"
    t.string "role"
  end

end
