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

ActiveRecord::Schema.define(version: 20161112034135) do

  create_table "comments", force: :cascade do |t|
    t.string  "text"
    t.integer "newchunk_id"
    t.integer "user_id"
    t.index ["newchunk_id"], name: "index_comments_on_newchunk_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "likes", force: :cascade do |t|
    t.integer "user_id"
    t.integer "newchunk_id"
    t.index ["newchunk_id"], name: "index_likes_on_newchunk_id"
    t.index ["user_id"], name: "index_likes_on_user_id"
  end

  create_table "newchunks", force: :cascade do |t|
    t.string  "title"
    t.string  "text"
    t.string  "video_link"
    t.string  "image_link"
    t.string  "sound_link"
    t.integer "oldchunk_id"
    t.integer "user_id"
    t.index ["oldchunk_id"], name: "index_newchunks_on_oldchunk_id"
    t.index ["user_id"], name: "index_newchunks_on_user_id"
  end

  create_table "oldchunks", force: :cascade do |t|
    t.string  "title"
    t.string  "text"
    t.integer "project_id"
    t.index ["project_id"], name: "index_oldchunks_on_project_id"
  end

  create_table "projects", force: :cascade do |t|
    t.string  "title"
    t.integer "user_id"
    t.index ["user_id"], name: "index_projects_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string  "username"
    t.string  "password"
    t.integer "project_id"
    t.index ["project_id"], name: "index_users_on_project_id"
  end

end
