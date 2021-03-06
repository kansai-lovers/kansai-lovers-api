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

ActiveRecord::Schema.define(version: 2021_11_06_203554) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "members", force: :cascade do |t|
    t.string "name", null: false
    t.string "role"
    t.string "join_date"
    t.string "avatar_url"
    t.string "url"
    t.integer "total_good_count", default: 0, null: false
    t.integer "total_bad_count", default: 0, null: false
    t.integer "total_laugh_count", default: 0, null: false
    t.integer "total_hooray_count", default: 0, null: false
    t.integer "total_confuse_count", default: 0, null: false
    t.integer "total_heart_count", default: 0, null: false
    t.integer "total_rocket_count", default: 0, null: false
    t.integer "total_eyes_count", default: 0, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "github_name"
  end

  create_table "messages", force: :cascade do |t|
    t.bigint "members_id", null: false
    t.bigint "repositories_id", null: false
    t.text "text", null: false
    t.text "url", null: false
    t.integer "good_count", default: 0, null: false
    t.integer "bad_count", default: 0, null: false
    t.integer "laugh_count", default: 0, null: false
    t.integer "hooray_count", default: 0, null: false
    t.integer "confuse_count", default: 0, null: false
    t.integer "heart_count", default: 0, null: false
    t.integer "rocket_count", default: 0, null: false
    t.integer "eyes_count", default: 0, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["members_id"], name: "index_messages_on_members_id"
    t.index ["repositories_id"], name: "index_messages_on_repositories_id"
  end

  create_table "repositories", force: :cascade do |t|
    t.string "name", null: false
    t.string "owner_name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "messages", "members", column: "members_id"
  add_foreign_key "messages", "repositories", column: "repositories_id"
end
