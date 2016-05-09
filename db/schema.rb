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

ActiveRecord::Schema.define(version: 20160508122327) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "books", id: :bigserial, force: :cascade do |t|
    t.string   "name"
    t.string   "cover"
    t.string   "intro"
    t.string   "isbn"
    t.string   "author"
    t.string   "press"
    t.date     "publish_date"
    t.string   "language"
    t.string   "category"
    t.string   "tags"
    t.float    "price"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "total",        default: 0, null: false
    t.integer  "available",    default: 0, null: false
  end

  create_table "borrows", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "book_id"
    t.date     "should_return_date"
    t.string   "status"
    t.datetime "returned_at"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  add_index "borrows", ["book_id"], name: "index_borrows_on_book_id", using: :btree
  add_index "borrows", ["user_id"], name: "index_borrows_on_user_id", using: :btree

  create_table "users", id: :bigserial, force: :cascade do |t|
    t.string   "name",               default: "",       null: false
    t.string   "email",              default: "",       null: false
    t.string   "role",               default: "normal", null: false
    t.string   "status",             default: "active", null: false
    t.string   "building"
    t.string   "office"
    t.string   "seat"
    t.string   "team"
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.string   "encrypted_password", default: "",       null: false
    t.integer  "sign_in_count",      default: 0,        null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree

end
