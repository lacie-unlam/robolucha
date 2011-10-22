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

ActiveRecord::Schema.define(:version => 20111022211037) do

  create_table "matches", :force => true do |t|
    t.integer  "team1_id"
    t.integer  "team2_id"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "duration"
    t.integer  "rounds_nbr",  :limit => 1, :default => 3
  end

  add_index "matches", ["team1_id"], :name => "index_matches_on_team1_id"
  add_index "matches", ["team2_id"], :name => "index_matches_on_team2_id"

  create_table "rounds", :force => true do |t|
    t.integer  "points_team1", :limit => 1, :default => 0
    t.integer  "points_team2", :limit => 1, :default => 0
    t.integer  "match_id"
    t.datetime "created_at"
  end

  add_index "rounds", ["match_id"], :name => "index_rounds_on_match_id"

  create_table "teams", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "approval_time", :default => 0
  end

  add_index "teams", ["name"], :name => "index_teams_on_name", :unique => true

end
