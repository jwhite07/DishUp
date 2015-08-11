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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20150811163314) do

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace"
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"

  create_table "admin_users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "failed_attempts",        default: 0,  null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
  end

  add_index "admin_users", ["confirmation_token"], name: "index_admin_users_on_confirmation_token", unique: true
  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  add_index "admin_users", ["unlock_token"], name: "index_admin_users_on_unlock_token", unique: true

  create_table "diet_claims", force: :cascade do |t|
    t.integer  "diet_type_id"
    t.integer  "dish_id"
    t.string   "notes"
    t.string   "claim_type"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "diet_claims", ["diet_type_id"], name: "index_diet_claims_on_diet_type_id"
  add_index "diet_claims", ["dish_id"], name: "index_diet_claims_on_dish_id"

  create_table "diet_types", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "dish_types", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.string   "icon_url"
    t.integer  "dishes_count", default: 0
  end

  create_table "dishes", force: :cascade do |t|
    t.string   "name"
    t.decimal  "price"
    t.integer  "menu_id"
    t.decimal  "rating",        default: 0.0
    t.text     "description"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.integer  "restaurant_id"
  end

  add_index "dishes", ["restaurant_id"], name: "index_dishes_on_restaurant_id"

  create_table "dishes_dish_types", force: :cascade do |t|
    t.integer "dish_id"
    t.integer "dish_type_id"
  end

  add_index "dishes_dish_types", ["dish_id"], name: "index_dishes_dish_types_on_dish_id"
  add_index "dishes_dish_types", ["dish_type_id"], name: "index_dishes_dish_types_on_dish_type_id"

  create_table "dishes_ingredients", force: :cascade do |t|
    t.integer "dish_id"
    t.integer "ingredient_id"
  end

  add_index "dishes_ingredients", ["dish_id"], name: "index_dishes_ingredients_on_dish_id"
  add_index "dishes_ingredients", ["ingredient_id"], name: "index_dishes_ingredients_on_ingredient_id"

  create_table "dishes_menus", force: :cascade do |t|
    t.integer "dish_id"
    t.integer "menu_id"
  end

  add_index "dishes_menus", ["dish_id"], name: "index_dishes_menus_on_dish_id"
  add_index "dishes_menus", ["menu_id"], name: "index_dishes_menus_on_menu_id"

  create_table "dishpics", force: :cascade do |t|
    t.integer  "dish_id"
    t.integer  "favorites",     default: 0
    t.integer  "user_id"
    t.boolean  "flagged",       default: false
    t.boolean  "remove",        default: false
    t.text     "caption"
    t.decimal  "quality_score", default: 0.0
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.string   "url"
  end

  create_table "dishpics_ingredients", force: :cascade do |t|
    t.integer "dishpic_id"
    t.integer "ingredient_id"
  end

  add_index "dishpics_ingredients", ["dishpic_id"], name: "index_dishpics_ingredients_on_dishpic_id"
  add_index "dishpics_ingredients", ["ingredient_id"], name: "index_dishpics_ingredients_on_ingredient_id"

  create_table "ingredients", force: :cascade do |t|
    t.string   "name"
    t.boolean  "allergen"
    t.boolean  "optional"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "menus", force: :cascade do |t|
    t.string   "name"
    t.integer  "restaurant_id"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.boolean  "default",       default: false
  end

  add_index "menus", ["restaurant_id"], name: "index_menus_on_restaurant_id"

  create_table "ratings", force: :cascade do |t|
    t.integer  "rating"
    t.integer  "user_id"
    t.integer  "dish_id"
    t.integer  "dishpic_id"
    t.boolean  "flag"
    t.string   "type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "ratings", ["dish_id"], name: "index_ratings_on_dish_id"
  add_index "ratings", ["dishpic_id"], name: "index_ratings_on_dishpic_id"
  add_index "ratings", ["user_id"], name: "index_ratings_on_user_id"

  create_table "restaurants", force: :cascade do |t|
    t.string   "name"
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.string   "country"
    t.string   "postal_code"
    t.string   "logo"
    t.string   "premium_level"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.string   "phone_number"
    t.string   "website"
    t.string   "hours"
    t.float    "latitude"
    t.float    "longitude"
    t.integer  "dishes_count",  default: 0
  end

  create_table "user_ingredient_preferences", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "ingredient_id"
    t.boolean  "like"
    t.boolean  "dislike"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "user_ingredient_preferences", ["ingredient_id"], name: "index_user_ingredient_preferences_on_ingredient_id"
  add_index "user_ingredient_preferences", ["user_id"], name: "index_user_ingredient_preferences_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "username"
    t.string   "avatar"
    t.string   "default_location"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.string   "auth_token",             default: ""
  end

  add_index "users", ["auth_token"], name: "index_users_on_auth_token", unique: true
  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
