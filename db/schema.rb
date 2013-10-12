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

ActiveRecord::Schema.define(version: 20131009045333) do

  create_table "art_objects", force: true do |t|
    t.string   "url"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "article_id"
  end

  add_index "art_objects", ["article_id"], name: "index_art_objects_on_article_id"

  create_table "articles", force: true do |t|
    t.string   "title"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  add_index "articles", ["user_id"], name: "index_articles_on_user_id"

  create_table "sources", force: true do |t|
    t.string   "url"
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "article_id"
  end

  add_index "sources", ["article_id"], name: "index_sources_on_article_id"

  create_table "users", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.text     "acerca_de"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "username"
    t.string   "password"
  end

end
