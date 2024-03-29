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

ActiveRecord::Schema.define(version: 2022_02_20_183041) do

  create_table "Rooms", force: :cascade do |t|
    t.string "token"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "owner_id", null: false
    t.boolean "visitors_joined"
    t.index ["owner_id"], name: "index_rooms_on_owner_id"
  end

  create_table "owners", force: :cascade do |t|
    t.string "username"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "token"
    t.string "status"
  end

  create_table "right_swipes", force: :cascade do |t|
    t.string "user_token"
    t.integer "anime_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "room_id", null: false
    t.string "anime_title"
    t.string "score"
    t.string "image"
    t.index ["room_id"], name: "index_right_swipes_on_room_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "right_swipe"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "visitor_id", null: false
    t.integer "owner_id", null: false
    t.index ["owner_id"], name: "index_users_on_owner_id"
    t.index ["visitor_id"], name: "index_users_on_visitor_id"
  end

  create_table "visitors", force: :cascade do |t|
    t.string "username"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "room_id", null: false
    t.string "token"
    t.string "status"
    t.index ["room_id"], name: "index_visitors_on_room_id"
  end

  add_foreign_key "Rooms", "owners"
  add_foreign_key "right_swipes", "rooms"
  add_foreign_key "users", "owners"
  add_foreign_key "users", "visitors"
  add_foreign_key "visitors", "rooms"
end
