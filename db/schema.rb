ActiveRecord::Schema.define(version: 20161005173335) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: :cascade do |t|
    t.text     "comment_body"
    t.integer  "post_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "user_id"
    t.index ["post_id"], name: "index_comments_on_post_id", using: :btree
    t.index ["user_id"], name: "index_comments_on_user_id", using: :btree
  end

  create_table "links", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "tag_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tag_id"], name: "index_links_on_tag_id", using: :btree
    t.index ["user_id"], name: "index_links_on_user_id", using: :btree
  end

  create_table "opportunities", force: :cascade do |t|
    t.string   "title"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "body"
    t.index ["user_id"], name: "index_opportunities_on_user_id", using: :btree
  end

  create_table "posts", force: :cascade do |t|
    t.string   "post_title"
    t.text     "post_body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
    t.string   "post_image"
    t.index ["user_id"], name: "index_posts_on_user_id", using: :btree
  end

  create_table "tags", force: :cascade do |t|
    t.string   "alma_mater"
    t.string   "academic_discipline"
    t.string   "specific_discipline"
    t.string   "specialization" 
    t.string   "topic_of_research"
    t.string   "level_of_education"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.string   "current_company"
    t.string   "current_position"
    t.string   "current_website"
    t.string   "location"
    t.float    "longitude"
    t.float    "latitude"
    t.string   "uid"
    t.string   "provider"
    t.string   "linkedin_token"
    t.string   "linkedin_secret"
    t.text     "linkedin_raw_info"
    t.string   "profile_picture"
    t.index ["email"], name: "index_users_on_email", using: :btree
    t.index ["uid", "provider"], name: "index_users_on_uid_and_provider", using: :btree
  end

  add_foreign_key "comments", "posts"
  add_foreign_key "comments", "users"
  add_foreign_key "links", "tags"
  add_foreign_key "links", "users"
  add_foreign_key "opportunities", "users"
  add_foreign_key "posts", "users"
end
