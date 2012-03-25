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

ActiveRecord::Schema.define(:version => 20120324122538) do

  create_table "gateway", :force => true do |t|
    t.string "number",    :limit => 20, :default => "", :null => false
    t.float  "latitude"
    t.float  "longitude"
    t.string "area"
  end

  create_table "inbox", :force => true do |t|
    t.string    "number",     :limit => 20, :default => "", :null => false
    t.datetime  "smsdate",                                  :null => false
    t.timestamp "insertdate",                               :null => false
    t.text      "text"
    t.integer   "phone",      :limit => 1
    t.integer   "processed",  :limit => 1,  :default => 0,  :null => false
  end

  create_table "messages", :force => true do |t|
    t.string   "phone_number"
    t.float    "latitude"
    t.float    "longitude"
    t.string   "type"
    t.integer  "qty"
    t.text     "msg"
    t.float    "price"
    t.string   "city"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "key"
  end

  create_table "multipartinbox", :force => true do |t|
    t.string    "number",     :limit => 20, :default => "", :null => false
    t.datetime  "smsdate",                                  :null => false
    t.timestamp "insertdate",                               :null => false
    t.text      "text"
    t.integer   "phone",      :limit => 1
    t.integer   "processed",  :limit => 1,  :default => 0,  :null => false
    t.integer   "refnum"
    t.integer   "maxnum"
    t.integer   "curnum"
  end

  create_table "outbox", :force => true do |t|
    t.string    "number",         :limit => 20,  :default => "",                    :null => false
    t.timestamp "processed_date",                                                   :null => false
    t.timestamp "insertdate",                                                       :null => false
    t.string    "text",           :limit => 160
    t.integer   "phone",          :limit => 1
    t.integer   "processed",      :limit => 1,   :default => 0,                     :null => false
    t.integer   "error",          :limit => 1,   :default => -1,                    :null => false
    t.integer   "dreport",        :limit => 1,   :default => 0,                     :null => false
    t.time      "not_before",                    :default => '2000-01-01 00:00:00', :null => false
    t.time      "not_after",                     :default => '2000-01-01 23:59:59', :null => false
  end

end
