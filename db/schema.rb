# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.0].define(version: 2025_02_23_214201) do
  create_table "customers", force: :cascade do |t|
    t.string "name"
    t.integer "points"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "invoices", force: :cascade do |t|
    t.integer "customer_id"
    t.integer "total_price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_invoices_on_customer_id"
  end

  create_table "movies", force: :cascade do |t|
    t.string "title"
    t.integer "price"
    t.string "category"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "purchases", force: :cascade do |t|
    t.integer "customer_id", null: false
    t.integer "total_price", default: 0
    t.integer "points_used", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "movie_id", null: false
    t.integer "points_awarded", default: 0
    t.integer "invoice_id"
    t.index ["customer_id"], name: "index_purchases_on_customer_id"
    t.index ["invoice_id"], name: "index_purchases_on_invoice_id"
    t.index ["movie_id"], name: "index_purchases_on_movie_id"
  end

  add_foreign_key "invoices", "customers"
  add_foreign_key "purchases", "customers"
  add_foreign_key "purchases", "invoices"
  add_foreign_key "purchases", "movies"
end
