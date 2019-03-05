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

ActiveRecord::Schema.define(version: 2019_03_05_145011) do

  create_table "painters", force: :cascade do |t|
    t.string "name"
    t.integer "zip_code"
    t.integer "y_of_exp"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "username"
    t.string "password_digest"
  end

  create_table "projects", force: :cascade do |t|
    t.integer "user_id"
    t.integer "painter_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["painter_id"], name: "index_projects_on_painter_id"
    t.index ["user_id"], name: "index_projects_on_user_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.integer "painter_id"
    t.string "content"
    t.integer "rating"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["painter_id"], name: "index_reviews_on_painter_id"
  end

  create_table "rooms", force: :cascade do |t|
    t.integer "area"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "assigned?", default: false
    t.index ["user_id"], name: "index_rooms_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.integer "zip_code"
    t.string "email"
    t.string "house_style"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "username"
    t.string "password_digest"
  end

end
