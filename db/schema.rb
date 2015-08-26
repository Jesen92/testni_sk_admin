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

ActiveRecord::Schema.define(version: 20150826124443) do

  create_table "active_admin_comments", force: true do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree

  create_table "admin_users", force: true do |t|
    t.string   "ime",                    limit: 15
    t.string   "prezime",                limit: 25
    t.string   "email",                             default: "", null: false
    t.string   "encrypted_password",                default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                     default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "admin",                                          null: false
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true, using: :btree
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true, using: :btree

  create_table "banks", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "books", force: true do |t|
    t.string   "title"
    t.integer  "num"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "days", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name_eng",   limit: 11, null: false
  end

  create_table "entries", force: true do |t|
    t.integer  "mjesto_id"
    t.integer  "jezik_id"
    t.integer  "vrsta_id"
    t.string   "name"
    t.string   "parents_name"
    t.string   "tel"
    t.string   "email"
    t.text     "comment"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "events", force: true do |t|
    t.string   "title"
    t.string   "start",          limit: 20
    t.string   "end",            limit: 20
    t.string   "allDay"
    t.date     "start_date"
    t.date     "end_date"
    t.boolean  "repeat"
    t.integer  "br_pred"
    t.integer  "profesor_id"
    t.integer  "group_id"
    t.integer  "where_id"
    t.text     "recurring_rule"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "group_uceniks", force: true do |t|
    t.integer  "ucenik_id"
    t.integer  "group_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "groups", force: true do |t|
    t.string   "name"
    t.integer  "profesor_id"
    t.string   "level"
    t.integer  "cijena",      null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "jeziks", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "messages", force: true do |t|
    t.string   "title"
    t.text     "body"
    t.integer  "profesor_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "mjestos", force: true do |t|
    t.string   "naziv"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "novi_uceniks", force: true do |t|
    t.string   "mjesto",       limit: 15
    t.string   "jezik",        limit: 15
    t.string   "vrsta_tecaja", limit: 15
    t.string   "name"
    t.string   "parents_name"
    t.string   "tel"
    t.string   "email"
    t.text     "comment"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "payments", force: true do |t|
    t.string   "title",      limit: 50,                 null: false
    t.integer  "ucenik_id"
    t.integer  "group_id"
    t.integer  "uplata"
    t.boolean  "uplaceno",              default: false, null: false
    t.date     "date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "picked_days", force: true do |t|
    t.integer  "day_id"
    t.integer  "event_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "profesor_books", force: true do |t|
    t.integer  "profesor_id"
    t.integer  "book_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "profesor_jeziks", force: true do |t|
    t.integer  "profesor_id"
    t.integer  "jezik_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "profesors", force: true do |t|
    t.string   "name",                      limit: 50,  null: false
    t.integer  "OIB",                       limit: 8
    t.string   "ulica",                     limit: 50
    t.boolean  "radi_za_nas"
    t.text     "komentar"
    t.boolean  "sudski_tumac"
    t.string   "mobitel",                   limit: 20
    t.string   "telefon",                   limit: 20
    t.string   "mail",                      limit: 30
    t.string   "obrazovanje",               limit: 100
    t.string   "karijerska_pozicija",       limit: 100
    t.boolean  "inozemno_iskustvo"
    t.text     "inozemno_iskustvo_comment"
    t.date     "datum_rodenja",                         null: false
    t.string   "mjesto_rodenja",            limit: 100, null: false
    t.string   "postanski_broj",            limit: 5,   null: false
    t.string   "grad",                      limit: 20
    t.string   "IBAN",                      limit: 40
    t.integer  "bank_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "single_events", force: true do |t|
    t.integer  "event_id",                    null: false
    t.string   "title"
    t.string   "start"
    t.string   "end"
    t.date     "date"
    t.boolean  "odrzano",     default: false, null: false
    t.integer  "profesor_id"
    t.integer  "group_id"
    t.integer  "where_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ucenik_books", force: true do |t|
    t.integer  "book_id"
    t.integer  "ucenik_id"
    t.boolean  "paid",       default: false, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ucenik_events", force: true do |t|
    t.integer  "ucenik_id"
    t.integer  "single_event_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "uceniks", force: true do |t|
    t.string   "name",             limit: 50,             null: false
    t.integer  "OIB",              limit: 8
    t.string   "ulica",            limit: 50
    t.integer  "postanski_broj"
    t.string   "grad",             limit: 25
    t.string   "parents_name",     limit: 25
    t.string   "email",            limit: 20
    t.string   "tel",              limit: 25,             null: false
    t.date     "datum_rodenja"
    t.integer  "group_id"
    t.integer  "fee",                         default: 0, null: false
    t.integer  "fee_to_pay",                  default: 0, null: false
    t.boolean  "placanje_na_rate",                        null: false
    t.date     "prvi_mj_placanja"
    t.integer  "br_rata",                     default: 0, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.integer  "profesor_id"
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "role"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "versions", force: true do |t|
    t.string   "item_type",                         null: false
    t.integer  "item_id",                           null: false
    t.string   "event",                             null: false
    t.string   "whodunnit"
    t.text     "object",         limit: 2147483647
    t.text     "object_changes",                    null: false
    t.datetime "created_at"
  end

  add_index "versions", ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id", using: :btree

  create_table "vrsta_tecajas", force: true do |t|
    t.string   "vrsta"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "wheres", force: true do |t|
    t.string   "name"
    t.string   "adress"
    t.integer  "Kapacitet"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
