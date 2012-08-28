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

ActiveRecord::Schema.define(:version => 20120823091926) do

  create_table "addresses", :force => true do |t|
    t.string   "province"
    t.string   "city"
    t.string   "street"
    t.string   "area"
    t.string   "person"
    t.integer  "postcode"
    t.string   "phone"
    t.string   "time"
    t.string   "info"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.string   "delivery_way"
    t.datetime "get_time"
    t.integer  "deliver_pay_id"
    t.string   "hour"
    t.string   "day"
  end

  create_table "deliver_pays", :force => true do |t|
    t.string   "pay_way",     :null => false
    t.string   "deliver_way", :null => false
    t.integer  "order_id",    :null => false
    t.text     "remark"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "flight_addresses", :force => true do |t|
    t.integer  "flight_id"
    t.integer  "address_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "flights", :force => true do |t|
    t.string   "airline",     :null => false
    t.string   "flight_no",   :null => false
    t.string   "plane_type",  :null => false
    t.datetime "leave_time",  :null => false
    t.string   "leave_city",  :null => false
    t.datetime "arrive_time", :null => false
    t.string   "arrive_city", :null => false
    t.text     "remark"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "price"
    t.string   "cabin_class"
  end

  create_table "orders", :force => true do |t|
    t.string   "contact_name",  :null => false
    t.integer  "contact_phone", :null => false
    t.string   "contact_email", :null => false
    t.integer  "print_time",    :null => false
    t.integer  "flight_id",     :null => false
    t.text     "remark"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "passengers", :force => true do |t|
    t.string   "name",            :null => false
    t.string   "cred_type",       :null => false
    t.string   "cred_number",     :null => false
    t.integer  "accident_number"
    t.integer  "delay_number"
    t.integer  "order_id",        :null => false
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "rails_admin_histories", :force => true do |t|
    t.text     "message"
    t.string   "username"
    t.integer  "item"
    t.string   "table"
    t.integer  "month",      :limit => 2
    t.integer  "year",       :limit => 5
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
  end

  add_index "rails_admin_histories", ["item", "table", "month", "year"], :name => "index_rails_admin_histories"

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "role"
    t.integer  "phone"
    t.string   "username"
    t.boolean  "admin"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
