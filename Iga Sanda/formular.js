
// Author: Iga (Voronianu) Sanda Florina <vorosanda@gmail.com> 
// MIT License 

document.getElementById("id_business_level_version").innerHTML = "Business level version: 2018.01.28.0"; 


navigator.geolocation.watchPosition(on_gps_success, on_gps_error);

var marker;
//--------------------------------------
function on_gps_success(p)
{
	document.getElementById("id_p").innerHTML = "lat = " + 
	p.coords.latitude + "<br>long = " + p.coords.longitude + 
	"<br>accuracy = " + p.coords.accuracy + "m" + 
	"<br>altitude = " + p.coords.altitude + "m"+
	"<br>speed = " + p.coords.speed + "m/s";
	
	var map_obj = new google.maps.Map(document.getElementById("id_map"));
	map_obj.setCenter({lat:p.coords.latitude, lng:p.coords.longitude});
	map_obj.setZoom(10);
	
	marker = new google.maps.Marker({
    position: {lat:p.coords.latitude, lng:p.coords.longitude},
    title:"LMM!",
	map:map_obj,
	animation: google.maps.Animation.DROP
	});
	marker.addListener("click", on_marker_click);
} 
//--------------------------------------
function on_marker_click()
{
	if (marker.getAnimation() !== null) {
		marker.setAnimation(null);
	} else {
		marker.setAnimation(google.maps.Animation.BOUNCE);
	}
}
//--------------------------------------
function on_gps_error(e)
{
	alert(e.code);
}
//--------------------------------------