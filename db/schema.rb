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

ActiveRecord::Schema.define(version: 20150419908309) do

  create_table "books", force: :cascade do |t|
    t.string   "title",          limit: 255
    t.string   "name",           limit: 255
    t.string   "desc",           limit: 255
    t.string   "author",         limit: 255
    t.integer  "length",         limit: 4
    t.integer  "brand_id",       limit: 4
    t.integer  "category_id",    limit: 4
    t.string   "image",          limit: 255
    t.integer  "number_or_view", limit: 4
    t.string   "link",           limit: 255
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "books", ["brand_id"], name: "index_books_on_brand_id", using: :btree
  add_index "books", ["category_id"], name: "index_books_on_category_id", using: :btree

  create_table "brands", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "image",      limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "libraries", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.integer  "book_id",    limit: 4
    t.integer  "view_times", limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "libraries", ["book_id"], name: "index_libraries_on_book_id", using: :btree
  add_index "libraries", ["user_id"], name: "index_libraries_on_user_id", using: :btree

  create_table "relationships", force: :cascade do |t|
    t.integer  "follower_id", limit: 4
    t.integer  "followed_id", limit: 4
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "relationships", ["followed_id"], name: "index_relationships_on_followed_id", using: :btree
  add_index "relationships", ["follower_id", "followed_id"], name: "index_relationships_on_follower_id_and_followed_id", unique: true, using: :btree
  add_index "relationships", ["follower_id"], name: "index_relationships_on_follower_id", using: :btree

  create_table "requests", force: :cascade do |t|
    t.integer  "user_id",         limit: 4
    t.string   "title",           limit: 255
    t.string   "content",         limit: 255
    t.string   "approval_status", limit: 255, default: "pending"
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
  end

  add_index "requests", ["user_id"], name: "index_requests_on_user_id", using: :btree

  create_table "reviews", force: :cascade do |t|
    t.integer  "user_id",           limit: 4
    t.integer  "book_id",           limit: 4
    t.text     "text",              limit: 65535
    t.integer  "rating_out_of_ten", limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "reviews", ["book_id"], name: "index_reviews_on_book_id", using: :btree
  add_index "reviews", ["user_id"], name: "index_reviews_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name",                   limit: 255
    t.integer  "role",                   limit: 4
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "books", "brands"
  add_foreign_key "books", "categories"
  add_foreign_key "libraries", "books"
  add_foreign_key "libraries", "users"
  add_foreign_key "requests", "users"
  add_foreign_key "reviews", "books"
  add_foreign_key "reviews", "users"
end
