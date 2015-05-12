class Movie < ActiveRecord::Base
  has_many :reviews
  has_and_belongs_to_many :genres, join_table: :movies_genres
  validates_presence_of :title, :release_date, :tmdb_id
  validates_uniqueness_of :tmdb_id
end
