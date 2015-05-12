class Movie < ActiveRecord::Base
  has_many :reviews
  has_many :genres, through: :genre_movies
  validates_presence_of :title, :release_date, :tmdb_id
  validates_uniqueness_of :tmdb_id
end
