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

// function parseMovies(movies) {
//   // convert HTML to JSON
//   // pass to buildMovie
// }

function buildMovie(data) {
  var movieTemplate = $.trim($('#movie-template').html());
  var $movie = $(movieTemplate);
  $movie.find('.title a').append(data.title);
  $movie.find('.title a').attr('href', "/movies/" + data.id)
  $movie.find('.genre').append(data.genre);
  $movie.find('.release-date').append(data.release_date);
  return $movie;
}

function sortByGenre() {
  event.preventDefault();
  var movies = $('.movie')
  $('.movie-list').empty();
  // iterate through movies and grab title, genres, and release date
  // build div again
  $.ajax({
    url: '/movies/genre',
    type: 'put',
  })
  .done(function(response) {
    for (var i = 0; i < response.length; i++) {
      var genre = response[i][0]; // genre
      var movie = response[i][1]; // object
      var data = { title: movie.title, genre: genre, release_date: movie.release_date, id: movie.id }
      // {data: { title: title, genre: genre, release_date: release_date, id: id}}
      var movieDiv = buildMovie(data);
      $('.movie-list').append(movieDiv);
    };
    console.log("done response is: " + response);
  }).fail(function(response) {
    console.log("fail response is: " + response);
  }).always(function(response) {
    console.log("always response is: " + response);
  });
};

function sortByReleaseDate(){
  event.preventDefault();
  var movies = $('.movie')
  $('.movie-list').empty();
  // iterate through movies and grab title, genres, and release date
  // build div again
  $.ajax({
    url: '/movies/release_date',
    type: 'put',
  })
  .done(function(response) {
    for (var i = 0; i < response.length; i++) {
      var genre = response[i][0]; // genre
      var movie = response[i][1]; // object
      var data = { title: movie.title, genre: genre, release_date: movie.release_date, id: movie.id }
      // {data: { title: title, genre: genre, release_date: release_date, id: id}}
      var movieDiv = buildMovie(data);
      $('.movie-list').append(movieDiv);
    };
    console.log("done response is: " + response);
  }).fail(function(response) {
    console.log("fail response is: " + response);
  }).always(function(response) {
    console.log("always response is: " + response);
  });
};

function sortByTitle(){
  event.preventDefault();
  var movies = $('.movie')
  $('.movie-list').empty();
  // iterate through movies and grab title, genres, and release date
  // build div again
  $.ajax({
    url: '/movies/title',
    type: 'put',
  })
  .done(function(response) {
    for (var i = 0; i < response.length; i++) {
      var genre = response[i][0]; // genre
      var movie = response[i][1]; // object
      var data = { title: movie.title, genre: genre, release_date: movie.release_date, id: movie.id }
      // {data: { title: title, genre: genre, release_date: release_date, id: id}}
      var movieDiv = buildMovie(data);
      $('.movie-list').append(movieDiv);
    };
    console.log("done response is: " + response);
  }).fail(function(response) {
    console.log("fail response is: " + response);
  }).always(function(response) {
    console.log("always response is: " + response);
  });
};