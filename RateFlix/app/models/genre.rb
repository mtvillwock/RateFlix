class Genre < ActiveRecord::Base
  has_and_belongs_to_many :movies, join_table: :movies_genres
  validates_presence_of :tmdb_id, :name
  validates_uniqueness_of :tmdb_id
end
