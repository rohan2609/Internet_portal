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

ActiveRecord::Schema.define(version: 20170608102351) do

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_type"
    t.integer  "resource_id"
    t.string   "author_type"
    t.integer  "author_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"
  end

  create_table "admin_users", force: :cascade do |t|
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
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "contactforms", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "contact"
    t.string   "message"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "contacts", force: :cascade do |t|
    t.string   "name"
    t.string   "phone"
    t.string   "email"
    t.string   "message"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "customers", force: :cascade do |t|
    t.string   "fullname"
    t.string   "mobile_no"
    t.string   "phone_no"
    t.string   "email"
    t.string   "access_token"
    t.string   "kyc"
    t.datetime "date"
    t.boolean  "status"
    t.string   "address1"
    t.string   "address2"
    t.string   "customer_number"
    t.string   "pincode"
    t.integer  "plan_id"
    t.integer  "payment_id"
    t.date     "plan_start_date"
    t.date     "plan_expiry_date"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.string   "kyc_file_name"
    t.string   "kyc_content_type"
    t.integer  "kyc_file_size"
    t.datetime "kyc_updated_at"
    t.index ["payment_id"], name: "index_customers_on_payment_id"
    t.index ["plan_id"], name: "index_customers_on_plan_id"
  end

  create_table "homes", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "contact_no"
    t.string   "message"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "offline_payment_histories", force: :cascade do |t|
    t.integer  "customer_id"
    t.integer  "plan_id"
    t.integer  "offline_payment_id"
    t.string   "cash"
    t.string   "check"
    t.string   "bank_name"
    t.string   "check_number"
    t.string   "amount_paid"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.index ["customer_id"], name: "index_offline_payment_histories_on_customer_id"
    t.index ["offline_payment_id"], name: "index_offline_payment_histories_on_offline_payment_id"
    t.index ["plan_id"], name: "index_offline_payment_histories_on_plan_id"
  end

  create_table "offline_payments", force: :cascade do |t|
    t.string   "cash"
    t.string   "check"
    t.integer  "customer_id"
    t.integer  "plan_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["customer_id"], name: "index_offline_payments_on_customer_id"
    t.index ["plan_id"], name: "index_offline_payments_on_plan_id"
  end

  create_table "payments", force: :cascade do |t|
    t.string   "mihpayid"
    t.string   "txnid"
    t.string   "status"
    t.string   "unmappedstatus"
    t.string   "amount"
    t.string   "cardCategory"
    t.string   "email"
    t.string   "name_on_card"
    t.string   "issuing_bank"
    t.boolean  "payment_mode"
    t.integer  "customer_id"
    t.integer  "plan_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["customer_id"], name: "index_payments_on_customer_id"
    t.index ["plan_id"], name: "index_payments_on_plan_id"
  end

  create_table "plans", force: :cascade do |t|
    t.string   "plan_name"
    t.string   "plan_price"
    t.string   "no_of_days"
    t.string   "speed"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_customers", force: :cascade do |t|
    t.integer "user_id"
    t.integer "customer_id"
    t.index ["customer_id"], name: "index_user_customers_on_customer_id"
    t.index ["user_id"], name: "index_user_customers_on_user_id"
  end

  create_table "users", force: :cascade do |t|
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
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
