# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_10_05_221538) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "brief_feedbacks", force: :cascade do |t|
    t.bigint "company_id"
    t.bigint "client_id"
    t.text "keywords", default: [], array: true
    t.text "red_flags", default: [], array: true
    t.text "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_brief_feedbacks_on_client_id"
    t.index ["company_id"], name: "index_brief_feedbacks_on_company_id"
  end

  create_table "brief_templates", force: :cascade do |t|
    t.string "name"
    t.string "type"
    t.text "fields", default: [], array: true
    t.bigint "company_id", null: false
    t.bigint "user_id", null: false
    t.bigint "client_id"
    t.boolean "internal", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "global_brief_template_id"
    t.string "goal_framework"
    t.index ["client_id"], name: "index_brief_templates_on_client_id"
    t.index ["company_id"], name: "index_brief_templates_on_company_id"
    t.index ["fields"], name: "index_brief_templates_on_fields", using: :gin
    t.index ["global_brief_template_id"], name: "index_brief_templates_on_global_brief_template_id"
    t.index ["user_id"], name: "index_brief_templates_on_user_id"
  end

  create_table "briefs", force: :cascade do |t|
    t.text "responses", default: [], array: true
    t.bigint "brief_template_id", null: false
    t.bigint "user_id", null: false
    t.bigint "client_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "goal_framework"
    t.index ["brief_template_id"], name: "index_briefs_on_brief_template_id"
    t.index ["client_id"], name: "index_briefs_on_client_id"
    t.index ["responses"], name: "index_briefs_on_responses", using: :gin
    t.index ["user_id"], name: "index_briefs_on_user_id"
  end

  create_table "clients", force: :cascade do |t|
    t.bigint "company_id", null: false
    t.string "name"
    t.jsonb "compulsory_fields"
    t.text "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_clients_on_company_id"
  end

  create_table "companies", force: :cascade do |t|
    t.string "name"
    t.string "plan"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "contents", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.text "link"
    t.bigint "mood_board_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["mood_board_id"], name: "index_contents_on_mood_board_id"
  end

  create_table "global_brief_templates", force: :cascade do |t|
    t.string "name"
    t.string "template_type"
    t.text "fields", default: [], array: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "goal_framework"
    t.index ["fields"], name: "index_global_brief_templates_on_fields", using: :gin
  end

  create_table "goals", force: :cascade do |t|
    t.bigint "brief_id", null: false
    t.string "name"
    t.text "description"
    t.text "measurements", default: [], array: true
    t.date "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["brief_id"], name: "index_goals_on_brief_id"
  end

  create_table "mood_boards", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.bigint "brief_id"
    t.bigint "client_id"
    t.bigint "company_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["brief_id"], name: "index_mood_boards_on_brief_id"
    t.index ["client_id"], name: "index_mood_boards_on_client_id"
    t.index ["company_id"], name: "index_mood_boards_on_company_id"
    t.index ["user_id"], name: "index_mood_boards_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "position"
    t.boolean "is_admin", default: false
    t.string "user_type"
    t.bigint "company_id", null: false
    t.bigint "client_id"
    t.index ["client_id"], name: "index_users_on_client_id"
    t.index ["company_id"], name: "index_users_on_company_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "brief_feedbacks", "clients"
  add_foreign_key "brief_feedbacks", "companies"
  add_foreign_key "brief_templates", "clients"
  add_foreign_key "brief_templates", "companies"
  add_foreign_key "brief_templates", "global_brief_templates"
  add_foreign_key "brief_templates", "users"
  add_foreign_key "briefs", "brief_templates"
  add_foreign_key "briefs", "clients"
  add_foreign_key "briefs", "users"
  add_foreign_key "clients", "companies"
  add_foreign_key "contents", "mood_boards"
  add_foreign_key "goals", "briefs"
  add_foreign_key "mood_boards", "briefs"
  add_foreign_key "mood_boards", "clients"
  add_foreign_key "mood_boards", "companies"
  add_foreign_key "mood_boards", "users"
  add_foreign_key "users", "clients"
  add_foreign_key "users", "companies"
end
