# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'httparty'

# puts response.body, response.code, response.message, response.headers.inspect

class TheMovieDatabase
  include HTTParty
  base_uri 'https://api.themoviedb.org/3'

  def initialize
  end

  def genre_list
    # https://api.themoviedb.org/3/genre/movie/list?api_key=ENV['API_KEY']
    # returns list of all genre ids
    self.class.get("/genre/movie/list?api_key=" + ENV['API_KEY'])
  end

  def parse_genre_list(genre_list)
    genre_list_response = tmdb.genre_list
    genres_array = genre_list_response.parsed_response["genres"]
    genres_array.each do |genre|
      genre = Genre.new(tmdb_id: genre["id"], name: genre["name"])
      genre.save
    end
  end

  # def genre(genre)
  #   genre_id = Genre.where(name: genre).first.id
  #   self.class.get("/genre/#{genre_id}/movies?api_key=" + ENV['API_KEY'])
  # end

  # def search(title)
  #   p title
  #   p title_query_string = title.downcase.split(" ").join("%20")
  #   # splits title if multiple words and joins with %20 for spaces
  #   # http://api.themoviedb.org/3/search/movie?query=die%20hard&api_key=ENV['API_KEY']
  #   self.class.get("/search/movie" + "?query=#{title_query_string}&api_key=" + ENV['API_KEY'])
  #   # should return collection of movies with that title
  #   # parse through array of results for movie hash with title == input title

  # end

  # def release_date(movie)
  #   # movie = Movie.find_by(release_date)
  #   movie_id =
  #   # http://guides.rubyonrails.org/active_record_querying.html#ordering
  #   self.class.get('/movie/#{movie_id}/releases', @options)
  # end
end

tmdb = TheMovieDatabase.new
genre_response = tmdb.genre_list