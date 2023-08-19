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

ActiveRecord::Schema[7.0].define(version: 2023_08_08_205111) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", precision: nil, null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", precision: nil, null: false
    t.string "service_name", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "applicants", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "phone"
    t.date "brithday"
    t.bigint "user_id", null: false
    t.bigint "position_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["position_id"], name: "index_applicants_on_position_id"
    t.index ["user_id"], name: "index_applicants_on_user_id"
  end

  create_table "companies", force: :cascade do |t|
    t.string "name"
    t.string "url"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_companies_on_user_id"
  end

  create_table "positions", force: :cascade do |t|
    t.string "name"
    t.integer "career"
    t.integer "contract"
    t.boolean "remote"
    t.boolean "full_time"
    t.string "city"
    t.string "state"
    t.text "summary"
    t.text "description"
    t.boolean "publish"
    t.bigint "company_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
    t.index ["company_id"], name: "index_positions_on_company_id"
  end

  create_table "profile_users", force: :cascade do |t|
    t.bigint "profile_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["profile_id"], name: "index_profile_users_on_profile_id"
    t.index ["user_id"], name: "index_profile_users_on_user_id"
  end

  create_table "profiles", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "skill_applicants", force: :cascade do |t|
    t.bigint "skill_id", null: false
    t.bigint "applicant_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["applicant_id"], name: "index_skill_applicants_on_applicant_id"
    t.index ["skill_id"], name: "index_skill_applicants_on_skill_id"
  end

  create_table "skills", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_positions", force: :cascade do |t|
    t.bigint "users_id", null: false
    t.bigint "positions_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["positions_id"], name: "index_user_positions_on_positions_id"
    t.index ["users_id"], name: "index_user_positions_on_users_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at", precision: nil
    t.datetime "remember_created_at", precision: nil
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "applicants", "positions"
  add_foreign_key "applicants", "users"
  add_foreign_key "companies", "users"
  add_foreign_key "positions", "companies"
  add_foreign_key "profile_users", "profiles"
  add_foreign_key "profile_users", "users"
  add_foreign_key "skill_applicants", "applicants"
  add_foreign_key "skill_applicants", "skills"
  add_foreign_key "user_positions", "positions", column: "positions_id"
  add_foreign_key "user_positions", "users", column: "users_id"
end
