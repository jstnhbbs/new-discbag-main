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

ActiveRecord::Schema[7.0].define(version: 2022_08_11_221416) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "pokemons", force: :cascade do |t|
    t.string "species"
    t.string "type1"
    t.string "type2"
    t.string "sprite_front"
    t.string "sprite_back"
    t.integer "stat_speed"
    t.integer "stat_special_defense"
    t.integer "stat_special_attack"
    t.integer "stat_defense"
    t.integer "stat_attack"
    t.integer "stat_hp"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "team_pokemons", force: :cascade do |t|
    t.bigint "team_id", null: false
    t.bigint "pokemon_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["pokemon_id"], name: "index_team_pokemons_on_pokemon_id"
    t.index ["team_id"], name: "index_team_pokemons_on_team_id"
  end

  create_table "teams", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_teams_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "team_pokemons", "pokemons"
  add_foreign_key "team_pokemons", "teams"
  add_foreign_key "teams", "users"
end
