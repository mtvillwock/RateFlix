$(document).ready(function(){
  bindEvents();
});

function bindEvents(){
  titleSortListener();
  genreSortListener();
  releaseDateSortListener();
}

function titleSortListener(){
  $('.container').on('click', 'button.title', sortByTitle);
}

function genreSortListener(){
  $('.container').on('click', 'button.genre', sortByGenre);
}

function releaseDateSortListener(){
  $('.container').on('click', 'button.release-date', sortByReleaseDate);
}

function parseMovies(movies) {
  // convert HTML to JSON
  // pass to buildMovie
}

function buildMovie(data) {
  var movieTemplate = $.trim($('#movie-template').html());
  var $movie = $(movieTemplate);
  $movie.find('.title').text(data.title);
  $movie.find('.genre').text(data.genres);
  $movie.find('.release-date').text(data.release_date);
  return $movie;
}

function sortByGenre() {
  event.preventDefault();
  var movies = $('.movie')
  $('.movie-list').empty();
  // iterate through movies and grab title, genres, and release date
  // build div again
  for (var i = 0; i < movies.length; i++) {
    console.log(movies);
  };
  // debugger;
};

function sortByReleaseDate(){

};

function sortByTitle(){

};