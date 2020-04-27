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

ActiveRecord::Schema.define(version: 2020_04_27_091109) do

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "cart_items", force: :cascade do |t|
    t.integer "climber_id"
    t.integer "item_id"
    t.integer "cart_item_quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "cart_item_size"
  end

  create_table "climbers", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "name"
    t.string "name_kana"
    t.string "post_code"
    t.string "address"
    t.boolean "is_member_status", default: false, null: false
    t.integer "jim_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_climbers_on_email", unique: true
    t.index ["reset_password_token"], name: "index_climbers_on_reset_password_token", unique: true
  end

  create_table "genres", force: :cascade do |t|
    t.string "genre_name"
    t.boolean "is_active", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "items", force: :cascade do |t|
    t.integer "genre_id"
    t.text "item_description"
    t.string "item_name"
    t.integer "item_price"
    t.string "image_id"
    t.boolean "is_sale_status", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "size_id"
  end

  create_table "jims", force: :cascade do |t|
    t.string "jim_address"
    t.string "jim_name"
    t.string "jim_access"
    t.text "jim_description"
    t.string "jim_image_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "order_items", force: :cascade do |t|
    t.integer "item_id"
    t.integer "order_id"
    t.integer "product_status", default: 0, null: false
    t.integer "order_item_price"
    t.integer "order_item_quantity"
    t.string "order_item_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "order_item_size"
  end

  create_table "orders", force: :cascade do |t|
    t.integer "climber_id"
    t.integer "pay_method", default: 0, null: false
    t.integer "order_status", default: 0, null: false
    t.integer "freight"
    t.integer "total"
    t.string "ship_name"
    t.string "ship_postcode"
    t.string "ship_address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ships", force: :cascade do |t|
    t.integer "climber_id"
    t.string "address"
    t.string "name"
    t.string "code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sizes", force: :cascade do |t|
    t.float "size"
    t.boolean "is_active_size", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
