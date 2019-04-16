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

ActiveRecord::Schema.define(version: 5) do

  create_table "adopters", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "username"
    t.string "preferred_species"
    t.string "preferred_temperament"
    t.string "preferred_size"
    t.string "zip"
  end

  create_table "favorite_pets", force: :cascade do |t|
    t.integer "pet_id"
    t.integer "adopter_id"
  end

  create_table "pets", force: :cascade do |t|
    t.string  "name"
    t.string  "breed"
    t.string  "species"
    t.string  "temperament"
    t.string  "size"
    t.integer "age"
    t.string  "miscellaneous"
    t.boolean "available?"
    t.integer "owner_id"
    t.integer "shelter_id"
  end

  create_table "shelters", force: :cascade do |t|
    t.string  "name"
    t.string  "street"
    t.string  "city"
    t.string  "zip"
    t.boolean "volunteer?"
  end

end
