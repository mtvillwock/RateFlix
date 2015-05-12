class Genre < ActiveRecord::Base
  has_many :movies, through: :genre_movies
  validates_presence_of :tmdb_id, :name
  validates_uniqueness_of :tmdb_id
end
