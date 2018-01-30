
/* Author:Ligia Tatucu
     Email: ligia.tatucu21@gmail.com */

$(document).ready(function(){                                   
	$('body').on('submit', '#searchForm', function(e){      //functia pentru a atribui functionalitate de submit formularului de tip search
		let searchText=$('#searchText').val();
		getMovies(searchText);
		e.preventDefault();
	});
});

$(document).on('pagebeforeshow', '#movie', function(){
	let movieId=sessionStorage.getItem('movieId');
	getMovie(movieId);
});

//function onclick

function movieClicked(id) {                                  
	sessionStorage.setItem('movieId', id);
	$.mobile.changePage('movie.html');
	//console.log(id);
}

//GET MOVIES FROM ObBD API

function getMovies(searchText) {
	$.ajax({
		method:"GET",
		url:"https://www.omdbapi.com/?apikey=5c85a2b2&s=" +searchText //API BAZEI OMBD prin intermediul caruia se pot accesa filmele din baza de date
		
	}).done(function(data){
		let movies=data.Search; //put the array in the variable
		let output='';
		
		$.each(movies,function(index, movie){ //interfata pentru afisarea variantelor de filme cautate(se afiseaza in index.html)
			output +=`
				<li>
					<a onclick="movieClicked('${movie.imdbID}')"  href="#">
					<img src="${movie.Poster}">
					<h2>${movie.Title}</h2>
					<p>Release Year: ${movie.Year}</p>
					</a>
				</li>
			`;
		});
		$("#movies").html(output).listview('refresh');
	});
}

function getMovie(movieId) { //afisarea informatiilor detaliate ale filmului 
	$.ajax({
		method:'GET',
		url: "https://www.omdbapi.com/?apikey=5c85a2b2&i=" +movieId
	}).done(function(movie){
		let movieTop=`
			<div style="text-align:center">
	        <h1>${movie.Title}</h1>
			<img src="${movie.Poster}">
			</div>
		`;
		$('#movieTop').html(movieTop);
		
		let movieDetails =`
			<li><strong>Genre:</strong>${movie.Genre}</li>
			<li><strong>Rated:</strong>${movie.Rated}</li>
			<li><strong>Released:</strong>${movie.Released}</li>
			<li><strong>Runtime:</strong>${movie.Runtime}</li>
			<li><strong>IMDB Rating:</strong>${movie.Rating}</li>
			<li><strong>IMDB Votes:</strong>${movie.Votes}</li>
			<li><strong>Actors:</strong>${movie.Actors}</li>
			<li><strong>Director:</strong>${movie.Director}</li>
			
		`;
		
		$('#movieDetails').html(movieDetails).listview('refresh');
	});
	
}
