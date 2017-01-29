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

ActiveRecord::Schema.define(version: 20170129232909) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "btree_gist"

  create_table "jam_sessions", force: :cascade do |t|
    t.integer   "band_id",        null: false
    t.integer   "band_member_id", null: false
    t.integer   "candidate_id",   null: false
    t.tstzrange "duration",       null: false
    t.datetime  "created_at",     null: false
    t.datetime  "updated_at",     null: false
    t.datetime  "start_time",     null: false
    t.datetime  "end_time",       null: false
    t.index ["band_id"], name: "index_jam_sessions_on_band_id", using: :btree
    t.index ["band_member_id", "duration"], name: "one_session_duration_per_band_member", using: :gist
    t.index ["band_member_id"], name: "index_jam_sessions_on_band_member_id", using: :btree
    t.index ["candidate_id"], name: "index_jam_sessions_on_candidate_id", using: :btree
  end

end
