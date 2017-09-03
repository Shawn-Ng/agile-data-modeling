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

ActiveRecord::Schema.define(version: 20170903053951) do

  create_table "belts", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.text     "description", limit: 65535
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "students", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.datetime "enroll_date"
    t.datetime "drop_date"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "user_id"
    t.datetime "grading_date"
    t.integer  "belt_id"
    t.index ["belt_id"], name: "index_students_on_belt_id", using: :btree
    t.index ["user_id"], name: "index_students_on_user_id", using: :btree
  end

  create_table "transaction_types", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.text     "description", limit: 65535
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "transactions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.decimal  "amount",              precision: 15, scale: 5
    t.datetime "payment_date"
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
    t.integer  "user_id"
    t.integer  "transaction_type_id"
    t.index ["transaction_type_id"], name: "index_transactions_on_transaction_type_id", using: :btree
    t.index ["user_id"], name: "index_transactions_on_user_id", using: :btree
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "street"
    t.string   "town"
    t.string   "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "email"
  end

  add_foreign_key "students", "belts"
  add_foreign_key "students", "users"
  add_foreign_key "transactions", "transaction_types"
  add_foreign_key "transactions", "users"
end
