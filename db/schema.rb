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

ActiveRecord::Schema.define(version: 20150714115959) do

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

  create_table "days", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name_eng",   limit: 11, null: false
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
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "picked_days", force: true do |t|
    t.integer  "day_id"
    t.integer  "event_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "profesors", force: true do |t|
    t.string   "name",                limit: 50,  null: false
    t.integer  "OIB",                 limit: 8
    t.string   "adresa"
    t.string   "jezik"
    t.boolean  "radi_za_nas"
    t.text     "komentar"
    t.boolean  "sudski_tumac"
    t.string   "mobitel",             limit: 20
    t.string   "telefon",             limit: 20
    t.string   "mail",                limit: 30
    t.string   "obrazovanje",         limit: 100
    t.string   "karijerska_pozicija", limit: 100
    t.boolean  "inozemno_iskustvo"
    t.date     "datum_rodenja",                   null: false
    t.string   "mjesto_rodenja",      limit: 100, null: false
    t.string   "postanski_broj",      limit: 5,   null: false
    t.string   "grad",                limit: 20
    t.string   "racun_banke",         limit: 30
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "single_events", force: true do |t|
    t.integer  "event_id",                    null: false
    t.string   "title"
    t.string   "start"
    t.string   "end"
    t.string   "date"
    t.boolean  "odrzano",     default: false, null: false
    t.integer  "profesor_id"
    t.integer  "group_id"
    t.integer  "where_id"
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
    t.string   "name",       limit: 50, null: false
    t.integer  "OIB",        limit: 8
    t.string   "adresa"
    t.integer  "group_id"
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

  create_table "wheres", force: true do |t|
    t.string   "name"
    t.string   "adress"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
