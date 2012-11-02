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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20121101143218) do

  create_table "statements", :force => true do |t|
    t.datetime "deleted_at"
    t.string   "name"
    t.date     "planned_date"
    t.integer  "price"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "statements", ["deleted_at"], :name => "index_statements_on_deleted_at"

  create_table "versions", :force => true do |t|
    t.integer  "statement_id"
    t.string   "name"
    t.date     "planned_date"
    t.integer  "price"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

end
