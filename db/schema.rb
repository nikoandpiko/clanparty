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

ActiveRecord::Schema.define(version: 2021_03_25_054552) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "events", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.time "start_time"
    t.time "end_time"
    t.integer "day"
    t.bigint "team_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["team_id"], name: "index_events_on_team_id"
  end

  create_table "games", force: :cascade do |t|
    t.string "title"
    t.string "content"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "invites", force: :cascade do |t|
    t.integer "status"
    t.string "requester"
    t.bigint "team_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["team_id"], name: "index_invites_on_team_id"
    t.index ["user_id"], name: "index_invites_on_user_id"
  end

  create_table "teams", force: :cascade do |t|
    t.string "name"
    t.string "avatar", default: "https://robohash.org/sitsedat.png?size=300x300&set=set1"
    t.text "bio"
    t.string "discord"
    t.integer "status"
    t.bigint "user_id", null: false
    t.bigint "game_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "monday_start"
    t.string "tuesday_start"
    t.string "wednesday_start"
    t.string "thursday_start"
    t.string "friday_start"
    t.string "saturday_start"
    t.string "sunday_start"
    t.string "monday_end"
    t.string "tuesday_end"
    t.string "wednesday_end"
    t.string "thursday_end"
    t.string "friday_end"
    t.string "saturday_end"
    t.string "sunday_end"
    t.boolean "monday", default: false
    t.boolean "tuesday", default: false
    t.boolean "wednesday", default: false
    t.boolean "thursday", default: false
    t.boolean "friday", default: false
    t.boolean "saturday", default: false
    t.boolean "sunday", default: false
    t.index ["game_id"], name: "index_teams_on_game_id"
    t.index ["user_id"], name: "index_teams_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "username"
    t.string "nickname"
    t.string "avatar", default: "https://robohash.org/quasiteneturomnis.png?size=300x300&set=set1"
    t.text "bio"
    t.string "discord"
    t.string "role"
    t.time "sunday_start"
    t.time "sunday_end"
    t.time "monday_start"
    t.time "monday_end"
    t.time "tuesday_start"
    t.time "tuesday_end"
    t.time "wednesday_start"
    t.time "wednesday_end"
    t.time "thursday_start"
    t.time "thursday_end"
    t.time "friday_start"
    t.time "friday_end"
    t.time "saturday_start"
    t.time "saturday_end"
    t.bigint "team_id"
    t.string "server"
    t.integer "stats"
    t.boolean "monday", default: false
    t.boolean "tuesday", default: false
    t.boolean "wednesday", default: false
    t.boolean "thursday", default: false
    t.boolean "friday", default: false
    t.boolean "saturday", default: false
    t.boolean "sunday", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["team_id"], name: "index_users_on_team_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "events", "teams"
  add_foreign_key "invites", "teams"
  add_foreign_key "invites", "users"
  add_foreign_key "teams", "games"
  add_foreign_key "teams", "users", on_delete: :cascade
  add_foreign_key "users", "teams"
end
