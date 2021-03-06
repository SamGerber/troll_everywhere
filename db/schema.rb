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

ActiveRecord::Schema.define(version: 20160303200028) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "polls", force: :cascade do |t|
    t.string   "title",      null: false
    t.integer  "author_id",  null: false
    t.string   "token",      null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "ord"
  end

  add_index "polls", ["author_id", "ord"], name: "deferred_ord_and_author_id", unique: true, using: :btree
  add_index "polls", ["author_id"], name: "index_polls_on_author_id", using: :btree
  add_index "polls", ["title"], name: "index_polls_on_title", using: :btree

  create_table "questions", force: :cascade do |t|
    t.integer  "poll_id",    null: false
    t.string   "title",      null: false
    t.string   "body"
    t.string   "image_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean  "is_locked",  null: false
    t.integer  "ord"
  end

  add_index "questions", ["poll_id", "ord"], name: "deferred_ord_and_poll_id", unique: true, using: :btree
  add_index "questions", ["poll_id"], name: "index_questions_on_poll_id", using: :btree
  add_index "questions", ["title"], name: "index_questions_on_title", using: :btree

  create_table "responses", force: :cascade do |t|
    t.integer  "question_id", null: false
    t.integer  "author_id",   null: false
    t.string   "body"
    t.string   "image_url"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "ord"
  end

  add_index "responses", ["author_id"], name: "index_responses_on_author_id", using: :btree
  add_index "responses", ["question_id", "ord"], name: "deferred_ord_and_question_id", unique: true, using: :btree
  add_index "responses", ["question_id"], name: "index_responses_on_question_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "username",           null: false
    t.string   "email",              null: false
    t.string   "password_digest",    null: false
    t.string   "session_token",      null: false
    t.string   "url_suffix",         null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "active_question_id"
    t.boolean  "is_guest",           null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", using: :btree
  add_index "users", ["session_token"], name: "index_users_on_session_token", using: :btree
  add_index "users", ["url_suffix"], name: "index_users_on_url_suffix", using: :btree
  add_index "users", ["username"], name: "index_users_on_username", using: :btree

  create_table "votes", force: :cascade do |t|
    t.integer  "response_id", null: false
    t.integer  "voter_id",    null: false
    t.boolean  "is_up_vote",  null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_foreign_key "polls", "users", column: "author_id"
  add_foreign_key "questions", "polls"
  add_foreign_key "responses", "questions"
  add_foreign_key "responses", "users", column: "author_id"
  add_foreign_key "users", "questions", column: "active_question_id"
  add_foreign_key "votes", "responses"
  add_foreign_key "votes", "users", column: "voter_id"
end
