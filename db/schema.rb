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

ActiveRecord::Schema.define(version: 2018_09_06_051953) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "appusers", force: :cascade do |t|
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
    t.string "name"
    t.string "role_level"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_appusers_on_email", unique: true
    t.index ["reset_password_token"], name: "index_appusers_on_reset_password_token", unique: true
  end

  create_table "articles", force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.integer "visits_count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "appuser_id"
    t.index ["appuser_id"], name: "index_articles_on_appuser_id"
  end

  create_table "comments", force: :cascade do |t|
    t.bigint "appuser_id"
    t.bigint "article_id"
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["appuser_id"], name: "index_comments_on_appuser_id"
    t.index ["article_id"], name: "index_comments_on_article_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "articles", "appusers"
  add_foreign_key "comments", "appusers"
  add_foreign_key "comments", "articles"
end
