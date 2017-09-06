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

ActiveRecord::Schema.define(version: 20170906082746) do

  create_table "belt_attempts", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.boolean  "pass"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "student_id"
    t.integer  "belt_id"
    t.integer  "grading_id"
    t.index ["belt_id"], name: "index_belt_attempts_on_belt_id", using: :btree
    t.index ["grading_id"], name: "index_belt_attempts_on_grading_id", using: :btree
    t.index ["student_id"], name: "index_belt_attempts_on_student_id", using: :btree
  end

  create_table "belts", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.text     "description",    limit: 65535
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.boolean  "is_child"
    t.integer  "style_id"
    t.integer  "style_sequence"
    t.index ["style_id"], name: "index_belts_on_style_id", using: :btree
  end

  create_table "families", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "gradings", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.datetime "date"
    t.time     "time"
    t.decimal  "cost",       precision: 15, scale: 5
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  create_table "items", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer  "item_number"
    t.text     "description", limit: 65535
    t.decimal  "price",                     precision: 15, scale: 5
    t.datetime "created_at",                                         null: false
    t.datetime "updated_at",                                         null: false
  end

  create_table "membership_holds", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.datetime "start_date"
    t.datetime "end_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "student_id"
    t.index ["student_id"], name: "index_membership_holds_on_student_id", using: :btree
  end

  create_table "order_items", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.decimal  "price",      precision: 15, scale: 5
    t.integer  "quantity"
    t.integer  "order_id"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.integer  "item_id"
    t.index ["item_id"], name: "index_order_items_on_item_id", using: :btree
    t.index ["order_id"], name: "index_order_items_on_order_id", using: :btree
  end

  create_table "orders", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.datetime "order_date"
    t.integer  "transaction_id"
    t.integer  "user_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["transaction_id"], name: "index_orders_on_transaction_id", using: :btree
    t.index ["user_id"], name: "index_orders_on_user_id", using: :btree
  end

  create_table "student_belts", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "student_id"
    t.integer  "belt_id"
    t.index ["belt_id"], name: "index_student_belts_on_belt_id", using: :btree
    t.index ["student_id"], name: "index_student_belts_on_student_id", using: :btree
  end

  create_table "students", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.datetime "enroll_date"
    t.datetime "drop_date"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "user_id"
    t.datetime "grading_date"
    t.boolean  "is_child"
    t.integer  "family_id"
    t.index ["family_id"], name: "index_students_on_family_id", using: :btree
    t.index ["user_id"], name: "index_students_on_user_id", using: :btree
  end

  create_table "styles", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.text     "description", limit: 65535
    t.boolean  "has_belts"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
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

  add_foreign_key "belt_attempts", "belts"
  add_foreign_key "belt_attempts", "gradings"
  add_foreign_key "belt_attempts", "students"
  add_foreign_key "belts", "styles"
  add_foreign_key "membership_holds", "students"
  add_foreign_key "order_items", "items"
  add_foreign_key "order_items", "orders"
  add_foreign_key "orders", "transactions"
  add_foreign_key "orders", "users"
  add_foreign_key "student_belts", "belts"
  add_foreign_key "student_belts", "students"
  add_foreign_key "students", "families"
  add_foreign_key "students", "users"
  add_foreign_key "transactions", "transaction_types"
  add_foreign_key "transactions", "users"
end
