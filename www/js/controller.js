angular.module('starter.controllers', ['ionic','firebase'])

.controller('MapCtrl', ['$scope','$firebase','$ionicPopup', function($scope,$firebase,$ionicPopup) {
	$scope.getLocation = function(){
		 navigator.geolocation.getCurrentPosition(function(position){
			 alert('Your current location is: ' + position.coords.latitude + ' latitude & ' + position.coords.longitude + ' longitude.');

		 	});
	}
}])

.directive('map', function() {
    return {
        restrict: 'A',
        link:function(scope, element, attrs){

			if(navigator.geolocation){
		        navigator.geolocation.getCurrentPosition(function(position){
	  			  	var zValue = scope.$eval(attrs.zoom);
	  	          	var lat = position.coords.latitude;
	  	          	var lng = position.coords.longitude;

	  	           	var myLatlng = new google.maps.LatLng(lat,lng),
	  	            mapOptions = {
	  	                zoom: zValue,
	  	                center: myLatlng
	  	            },
	  	            map = new google.maps.Map(element[0],mapOptions),
	  	            marker = new google.maps.Marker({
	  				    position: myLatlng,
	  				    map: map,
	  				    draggable:true
	  			    });
		        });
		    } else{
		        alert("Sorry, your browser does not support geolocation.");
		    }

        }
    };
});
