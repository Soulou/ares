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

ActiveRecord::Schema.define(:version => 20120303151159) do

  create_table "groups", :force => true do |t|
    t.string   "name",        :null => false
    t.integer  "gid_number"
    t.string   "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "groups", ["name"], :name => "index_groups_on_name", :unique => true

  create_table "memberships", :force => true do |t|
    t.integer  "user_id"
    t.integer  "group_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.integer  "group_id",                                        :null => false
    t.string   "username",                                        :null => false
    t.string   "email",                                           :null => false
    t.string   "first_name",                                      :null => false
    t.string   "last_name",                                       :null => false
    t.string   "encrypted_password",                              :null => false
    t.integer  "promotion",                                       :null => false
    t.integer  "start_year",                                      :null => false
    t.integer  "uid_number"
    t.string   "home_directory",                                  :null => false
    t.string   "login_shell",            :default => "/bin/bash"
    t.string   "description"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "authentication_token"
    t.datetime "created_at",                                      :null => false
    t.datetime "updated_at",                                      :null => false
  end

  add_index "users", ["authentication_token"], :name => "index_users_on_authentication_token", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true
  add_index "users", ["uid_number"], :name => "index_users_on_uid_number", :unique => true
  add_index "users", ["username"], :name => "index_users_on_username", :unique => true

end
