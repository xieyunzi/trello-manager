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

ActiveRecord::Schema.define(version: 20150317141221) do

  create_table "boards", force: :cascade do |t|
    t.string   "shortLink"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "boards", ["id"], name: "index_boards_on_id"

  create_table "cards", force: :cascade do |t|
    t.string   "shortLink"
    t.string   "idShort"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "cards", ["id"], name: "index_cards_on_id"

  create_table "members", force: :cascade do |t|
    t.string   "username"
    t.string   "email"
    t.string   "full_name"
    t.string   "initials"
    t.string   "avatar_id"
    t.string   "bio"
    t.string   "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "members", ["id"], name: "index_members_on_id"

  create_table "notifications", force: :cascade do |t|
    t.string   "unread"
    t.string   "type"
    t.date     "date"
    t.text     "data"
    t.string   "member_creator_id"
    t.string   "board_id"
    t.string   "card_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "notifications", ["id"], name: "index_notifications_on_id"

end
