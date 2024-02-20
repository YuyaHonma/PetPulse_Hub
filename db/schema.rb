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

ActiveRecord::Schema.define(version: 2024_02_13_010102) do

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "advices", force: :cascade do |t|
    t.integer "post_id", null: false
    t.integer "trainer_id", null: false
    t.text "advice"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["post_id"], name: "index_advices_on_post_id"
    t.index ["trainer_id"], name: "index_advices_on_trainer_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "comments", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "messages", force: :cascade do |t|
    t.integer "owner_id", null: false
    t.integer "trainer_id", null: false
    t.integer "room_id", null: false
    t.text "message"
    t.boolean "send_type", default: false
    t.boolean "read", default: false
    t.datetime "read_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["owner_id"], name: "index_messages_on_owner_id"
    t.index ["room_id"], name: "index_messages_on_room_id"
    t.index ["trainer_id"], name: "index_messages_on_trainer_id"
  end

  create_table "owner_favorites", force: :cascade do |t|
    t.integer "owner_id", null: false
    t.integer "post_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["owner_id"], name: "index_owner_favorites_on_owner_id"
    t.index ["post_id"], name: "index_owner_favorites_on_post_id"
  end

  create_table "owners", force: :cascade do |t|
    t.string "name"
    t.string "name_kana"
    t.string "telephone"
    t.boolean "is_active", default: true
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "address"
    t.index ["email"], name: "index_owners_on_email", unique: true
    t.index ["reset_password_token"], name: "index_owners_on_reset_password_token", unique: true
  end

  create_table "pets", force: :cascade do |t|
    t.integer "owner_id", null: false
    t.string "pet_name"
    t.string "pet_name_kana"
    t.integer "gender", default: 0
    t.integer "dog_breed", default: 0
    t.date "dog_birthday"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["owner_id"], name: "index_pets_on_owner_id"
  end

  create_table "posts", force: :cascade do |t|
    t.integer "owner_id", null: false
    t.integer "category_id", null: false
    t.string "title"
    t.text "introduction"
    t.text "current_approach"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["category_id"], name: "index_posts_on_category_id"
    t.index ["owner_id"], name: "index_posts_on_owner_id"
  end

  create_table "rooms", force: :cascade do |t|
    t.integer "owner_id", null: false
    t.integer "trainer_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["owner_id"], name: "index_rooms_on_owner_id"
    t.index ["trainer_id"], name: "index_rooms_on_trainer_id"
  end

  create_table "trainer_categories", force: :cascade do |t|
    t.integer "trainer_id", null: false
    t.integer "category_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["category_id"], name: "index_trainer_categories_on_category_id"
    t.index ["trainer_id"], name: "index_trainer_categories_on_trainer_id"
  end

  create_table "trainer_favorites", force: :cascade do |t|
    t.integer "trainer_id", null: false
    t.integer "post_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["post_id"], name: "index_trainer_favorites_on_post_id"
    t.index ["trainer_id"], name: "index_trainer_favorites_on_trainer_id"
  end

  create_table "trainers", force: :cascade do |t|
    t.integer "category_id"
    t.string "name"
    t.string "name_kana"
    t.string "telephone"
    t.string "address"
    t.date "birthday"
    t.string "hobby"
    t.string "license"
    t.text "message"
    t.boolean "is_active", default: true
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["category_id"], name: "index_trainers_on_category_id"
    t.index ["email"], name: "index_trainers_on_email", unique: true
    t.index ["reset_password_token"], name: "index_trainers_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "advices", "posts"
  add_foreign_key "advices", "trainers"
  add_foreign_key "messages", "owners"
  add_foreign_key "messages", "rooms"
  add_foreign_key "messages", "trainers"
  add_foreign_key "owner_favorites", "owners"
  add_foreign_key "owner_favorites", "posts"
  add_foreign_key "pets", "owners"
  add_foreign_key "posts", "categories"
  add_foreign_key "posts", "owners"
  add_foreign_key "rooms", "owners"
  add_foreign_key "rooms", "trainers"
  add_foreign_key "trainer_categories", "categories"
  add_foreign_key "trainer_categories", "trainers"
  add_foreign_key "trainer_favorites", "posts"
  add_foreign_key "trainer_favorites", "trainers"
  add_foreign_key "trainers", "categories"
end
