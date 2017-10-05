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

ActiveRecord::Schema.define(:version => 20140409112814) do

  create_table "authentications", :force => true do |t|
    t.integer  "user_id"
    t.string   "provider"
    t.string   "uid"
    t.string   "username"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "authentications", ["user_id", "provider", "uid"], :name => "index_authentications_on_user_id_and_provider_and_uid", :unique => true

  create_table "ckeditor_assets", :force => true do |t|
    t.string   "data_file_name",                  :null => false
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.integer  "assetable_id"
    t.string   "assetable_type",    :limit => 30
    t.string   "type",              :limit => 30
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
  end

  add_index "ckeditor_assets", ["assetable_type", "assetable_id"], :name => "idx_ckeditor_assetable"
  add_index "ckeditor_assets", ["assetable_type", "type", "assetable_id"], :name => "idx_ckeditor_assetable_type"

  create_table "comments", :force => true do |t|
    t.integer  "post_id"
    t.integer  "user_id"
    t.text     "body"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "comments", ["post_id"], :name => "index_comments_on_post_id"
  add_index "comments", ["user_id"], :name => "index_comments_on_user_id"

  create_table "events", :force => true do |t|
    t.string   "title"
    t.date     "when"
    t.string   "weblink1"
    t.string   "weblink2"
    t.text     "description"
    t.boolean  "published"
    t.string   "slug"
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
    t.boolean  "hidedate",    :default => false
    t.string   "hide_text",   :default => "TBC"
    t.string   "subtitle"
  end

  create_table "images", :force => true do |t|
    t.string   "caption"
    t.string   "imagefile"
    t.string   "attachable_type"
    t.integer  "attachable_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "pages", :force => true do |t|
    t.string   "title"
    t.string   "subtitle"
    t.text     "body"
    t.boolean  "published"
    t.string   "slug"
    t.string   "carousel"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.string   "page_icon"
    t.string   "page_icon_caption"
  end

  create_table "posts", :force => true do |t|
    t.string   "title"
    t.text     "body"
    t.integer  "user_id"
    t.boolean  "published"
    t.datetime "published_at"
    t.boolean  "sticky"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.string   "slug"
  end

  add_index "posts", ["user_id"], :name => "index_posts_on_user_id"

  create_table "soundclouds", :force => true do |t|
    t.string   "title"
    t.string   "codenumber"
    t.integer  "event_id"
    t.boolean  "published"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "soundclouds", ["event_id"], :name => "index_soundclouds_on_event_id"

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
    t.string   "name"
    t.boolean  "admin"
    t.string   "avatar"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "videos", :force => true do |t|
    t.string   "title"
    t.integer  "codenumber",             :limit => 8
    t.integer  "event_id"
    t.boolean  "published"
    t.datetime "created_at",                          :null => false
    t.datetime "updated_at",                          :null => false
    t.integer  "video_width"
    t.integer  "video_height"
    t.string   "thumbnail"
    t.integer  "thumbnail_size"
    t.string   "thumbnail_content_type"
    t.integer  "thumbnail_width"
    t.integer  "thumbnail_height"
    t.boolean  "for_archive"
    t.integer  "duration"
    t.text     "description"
  end

  add_index "videos", ["event_id"], :name => "index_videos_on_event_id"

end
