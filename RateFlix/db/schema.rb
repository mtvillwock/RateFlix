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

ActiveRecord::Schema.define(version: 20150512052757) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "genres", force: :cascade do |t|
    t.integer "tmdb_id"
    t.string  "name"
  end

  create_table "movies", force: :cascade do |t|
    t.string  "title"
    t.date    "release_date"
    t.integer "tmdb_id"
  end

  create_table "movies_genres", id: false, force: :cascade do |t|
    t.integer "movie_id", null: false
    t.integer "genre_id", null: false
  end

  add_index "movies_genres", ["genre_id"], name: "index_movies_genres_on_genre_id", using: :btree
  add_index "movies_genres", ["movie_id"], name: "index_movies_genres_on_movie_id", using: :btree

  create_table "reviews", force: :cascade do |t|
    t.integer "movie_id"
    t.string  "user_email"
    t.date    "date_published"
    t.integer "rating"
    t.text    "comment"
  end

end
