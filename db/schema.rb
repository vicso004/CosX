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

ActiveRecord::Schema.define(:version => 20120514070218) do

  create_table "admins", :force => true do |t|
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
    t.integer  "player_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admins", ["email"], :name => "index_admins_on_email", :unique => true
  add_index "admins", ["player_id"], :name => "index_admins_on_player_id"
  add_index "admins", ["reset_password_token"], :name => "index_admins_on_reset_password_token", :unique => true

  create_table "articles", :force => true do |t|
    t.string   "title"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "assets", :force => true do |t|
    t.integer  "article_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
  end

  create_table "carousel_items", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "active"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "goals", :force => true do |t|
    t.integer  "match_id"
    t.integer  "goaler_id"
    t.integer  "assister_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "goals", ["assister_id"], :name => "index_goals_on_assister_id"
  add_index "goals", ["goaler_id"], :name => "index_goals_on_goaler_id"
  add_index "goals", ["match_id"], :name => "index_goals_on_match_id"

  create_table "match_assignments", :force => true do |t|
    t.integer  "player_id"
    t.integer  "match_id"
    t.boolean  "confirmed"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "match_assignments", ["match_id"], :name => "index_match_assignments_on_match_id"
  add_index "match_assignments", ["player_id"], :name => "index_match_assignments_on_player_id"

  create_table "matches", :force => true do |t|
    t.string   "other_team"
    t.integer  "score_other"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "season_id"
    t.date     "datum"
    t.time     "tid"
  end

  add_index "matches", ["season_id"], :name => "index_matches_on_season_id"

  create_table "players", :force => true do |t|
    t.string   "name"
    t.string   "position"
    t.boolean  "active",     :limit => 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "players", ["name"], :name => "index_players_on_name", :unique => true

  create_table "posts", :force => true do |t|
    t.string   "title"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "seasons", :force => true do |t|
    t.string   "period"
    t.integer  "year"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

# Could not dump table "users" because of following StandardError
#   Unknown type 'bolean' for column 'admin'

end
