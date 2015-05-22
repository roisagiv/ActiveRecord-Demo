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

ActiveRecord::Schema.define(version: 0) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", primary_key: "category", force: :cascade do |t|
    t.string "categoryname", limit: 50, null: false
  end

  create_table "cust_hist", id: false, force: :cascade do |t|
    t.integer "customerid", null: false
    t.integer "orderid",    null: false
    t.integer "prod_id",    null: false
  end

  add_index "cust_hist", ["customerid"], name: "ix_cust_hist_customerid", using: :btree

  create_table "customers", primary_key: "customerid", force: :cascade do |t|
    t.string  "firstname",            limit: 50, null: false
    t.string  "lastname",             limit: 50, null: false
    t.string  "address1",             limit: 50, null: false
    t.string  "address2",             limit: 50
    t.string  "city",                 limit: 50, null: false
    t.string  "state",                limit: 50
    t.string  "zip",                  limit: 9
    t.string  "country",              limit: 50, null: false
    t.integer "region",               limit: 2,  null: false
    t.string  "email",                limit: 50
    t.string  "phone",                limit: 50
    t.integer "creditcardtype",                  null: false
    t.string  "creditcard",           limit: 50, null: false
    t.string  "creditcardexpiration", limit: 50, null: false
    t.string  "username",             limit: 50, null: false
    t.string  "password",             limit: 50, null: false
    t.integer "age",                  limit: 2
    t.integer "income"
    t.string  "gender",               limit: 1
  end

  add_index "customers", ["username", "password"], name: "ix_cust_user_password", unique: true, using: :btree
  add_index "customers", ["username"], name: "ix_cust_username", unique: true, using: :btree

  create_table "inventory", primary_key: "prod_id", force: :cascade do |t|
    t.integer "quan_in_stock", null: false
    t.integer "sales",         null: false
  end

  create_table "orderlines", id: false, force: :cascade do |t|
    t.integer "orderlineid", limit: 2, null: false
    t.integer "orderid",               null: false
    t.integer "prod_id",               null: false
    t.integer "quantity",    limit: 2, null: false
    t.date    "orderdate",             null: false
  end

  add_index "orderlines", ["orderid", "orderlineid"], name: "ix_orderlines_orderid", unique: true, using: :btree

  create_table "orders", primary_key: "orderid", force: :cascade do |t|
    t.date    "orderdate",   null: false
    t.integer "customerid"
    t.decimal "netamount",   null: false
    t.decimal "tax",         null: false
    t.decimal "totalamount", null: false
  end

  add_index "orders", ["customerid"], name: "ix_order_custid", using: :btree

  create_table "products", primary_key: "prod_id", force: :cascade do |t|
    t.integer "category",       limit: 2, null: false
    t.text    "title",                    null: false
    t.text    "actor",                    null: false
    t.decimal "price",                    null: false
    t.integer "special",        limit: 2
    t.integer "common_prod_id",           null: false
  end

  add_index "products", ["category", "special"], name: "ix_prod_cat_special", using: :btree
  add_index "products", ["category"], name: "ix_prod_category", using: :btree
  add_index "products", ["special"], name: "ix_prod_special", using: :btree

  create_table "reorder", id: false, force: :cascade do |t|
    t.integer "prod_id",        null: false
    t.date    "date_low",       null: false
    t.integer "quan_low",       null: false
    t.date    "date_reordered"
    t.integer "quan_reordered"
    t.date    "date_expected"
  end

  add_foreign_key "cust_hist", "customers", column: "customerid", primary_key: "customerid", name: "fk_cust_hist_customerid", on_delete: :cascade
  add_foreign_key "orderlines", "orders", column: "orderid", primary_key: "orderid", name: "fk_orderid", on_delete: :cascade
  add_foreign_key "orders", "customers", column: "customerid", primary_key: "customerid", name: "fk_customerid", on_delete: :nullify
end
