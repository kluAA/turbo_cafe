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

ActiveRecord::Schema[7.0].define(version: 2022_11_13_222115) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_categories_on_name"
  end

  create_table "items", force: :cascade do |t|
    t.string "name", null: false
    t.string "slug", null: false
    t.text "description"
    t.integer "price_cents", default: 0, null: false
    t.string "price_currency", default: "USD", null: false
    t.integer "tax_cents", default: 0, null: false
    t.string "tax_currency", default: "USD", null: false
    t.boolean "taxable"
    t.bigint "category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_items_on_category_id"
    t.index ["slug"], name: "index_items_on_slug", unique: true
    t.index ["taxable"], name: "index_items_on_taxable"
  end

  create_table "orders", force: :cascade do |t|
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "status", default: "new", null: false
    t.string "status_tracking_slug", null: false
    t.integer "subtotal_cents"
    t.string "subtotal_currency", default: "USD", null: false
    t.integer "tax_amount_cents"
    t.string "tax_amount_currency", default: "USD", null: false
    t.integer "total_cents"
    t.string "total_currency", default: "USD", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["status"], name: "index_orders_on_status"
    t.index ["status_tracking_slug"], name: "index_orders_on_status_tracking_slug", unique: true
  end

  create_table "special_items", force: :cascade do |t|
    t.bigint "item_id"
    t.bigint "special_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_special_items_on_item_id"
    t.index ["special_id"], name: "index_special_items_on_special_id"
  end

  create_table "specials", force: :cascade do |t|
    t.string "name", null: false
    t.string "slug", null: false
    t.string "description"
    t.integer "price_cents", default: 0, null: false
    t.string "price_currency", default: "USD", null: false
    t.integer "tax_cents", default: 0, null: false
    t.string "tax_currency", default: "USD", null: false
    t.boolean "taxable"
    t.bigint "category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_specials_on_category_id"
    t.index ["slug"], name: "index_specials_on_slug", unique: true
  end

  add_foreign_key "items", "categories"
  add_foreign_key "special_items", "items"
  add_foreign_key "special_items", "specials"
  add_foreign_key "specials", "categories"
end
