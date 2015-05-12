require 'httparty'
module MoviesHelper
  include HTTParty
  BASE_URI = 'https://api.themoviedb.org/3'

  def genre_list
    # https://api.themoviedb.org/3/genre/movie/list?api_key=ENV['API_KEY']
    # returns JSON of all genre ids that when parsed
    genre_list_response = HTTParty.get(BASE_URI + "/genre/movie/list?api_key=" + ENV['API_KEY'])
    # looks like: { "genres": [ {id: id, name: name }, { id: id, name: name} ] }
    genres_array = genre_list_response.parsed_response["genres"]
  end

  def build_genres(genres)
    genre_list.each do |genre|
      genre = Genre.new(tmdb_id: genre["id"], name: genre["name"])
      genre.save
      p genre
    end
  end

  # def genre(genre)
  #   genre_id = Genre.where(name: genre).first.id
  #   HTTParty.get("/genre/#{genre_id}/movies?api_key=" + ENV['API_KEY'])
  # end

  def search(title)
    p title
    p title_query_string = title.downcase.split(" ").join("%20")
    # splits title if multiple words and joins with %20 for spaces
    # http://api.themoviedb.org/3/search/movie?query=die%20hard&api_key=ENV['API_KEY']
    HTTParty.get("/search/movie" + "?query=#{title_query_string}&api_key=" + ENV['API_KEY'])
    # should return collection of movies with that title
    # parse through array of results for movie hash with title == input title
  end

  # def release_date(movie)
  #   # movie = Movie.find_by(release_date)
  #   movie_id =
  #   # http://guides.rubyonrails.org/active_record_querying.html#ordering
  #   HTTParty.get('/movie/#{movie_id}/releases', @options)
  # end
end
