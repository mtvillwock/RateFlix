# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
include MoviesHelper
genre_array = genre_list
build_genres(genre_array)
movies = ["Moulin Rouge!", "Clue", "Snatch", "Frozen", "Unbreakable"]
movies.each do |movie|
  attributes = search(movie)
  movie = Movie.create!(attributes)
  genres = find_movie_genres(movie.tmdb_id)
  build_movie_genres(movie: movie, genres: genres)
end