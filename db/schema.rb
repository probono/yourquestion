# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20100914074046) do

  create_table "administrations", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "answers", :force => true do |t|
    t.text     "body"
    t.integer  "question_id"
    t.text     "email",       :limit => 255
    t.string   "name"
    t.integer  "votes_count",                :default => 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "departments", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "administration_id"
    t.string   "phone"
    t.text     "address"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "me_toos", :force => true do |t|
    t.integer  "question_id"
    t.string   "user_agent"
    t.string   "ip"
    t.string   "referer"
    t.string   "session_id"
    t.string   "request_hash"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "questions", :force => true do |t|
    t.string   "title"
    t.text     "body"
    t.datetime "answered_at"
    t.datetime "sent_at"
    t.integer  "administration_id"
    t.integer  "department_id"
    t.string   "name"
    t.string   "email"
    t.integer  "me_toos_count",     :default => 0
    t.integer  "days_to_answer"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "taggings", :force => true do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "context"
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id"], :name => "index_taggings_on_tag_id"
  add_index "taggings", ["taggable_id", "taggable_type", "context"], :name => "index_taggings_on_taggable_id_and_taggable_type_and_context"

  create_table "tags", :force => true do |t|
    t.string "name"
  end

  create_table "votes", :force => true do |t|
    t.integer  "answer_id"
    t.string   "user_agent"
    t.string   "ip"
    t.string   "referer"
    t.string   "session_id"
    t.string   "request_hash"
    t.boolean  "positive"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
