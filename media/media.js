// RADU (CEAUȘU) VERONICA VICTORIA EMAIL: ceauvero@yahoo.com
//The above copyright notice and this permission notice shall be included in all
//copies or substantial portions of the Software
//-----------------------------------------
document.getElementById("id_logic_level_version").innerHTML = "Business level version: 2018.01.30.7"; 
window.addEventListener('deviceorientation', ondeviceorientation);
window.addEventListener('devicemotion', ondevicemotion);


//----------------------------------------

//----------------------------------------
function ondeviceorientation(event) 
{
	var alpha = event.alpha;
	var beta = event.beta;
	var gamma = event.gamma;
	
	document.getElementById("id_alpha").innerHTML = "alpha = " + Math.round(alpha * 10) / 10;
	document.getElementById("id_beta").innerHTML = "beta = " + Math.round(beta * 10) / 10;
	document.getElementById("id_gamma").innerHTML = "gamma = " + Math.round(gamma * 10) / 10;
	
	
	deseneaza_patrat_canvas(alpha, gamma, beta);
}
//----------------------------------------
function ondevicemotion(event) 
{
	document.getElementById("id_acc").innerHTML = "Acc = " + Math.round(event.acceleration.x * 10) / 10 + " " + Math.round(event.acceleration.y * 10) / 10 + " " + Math.round(event.acceleration.z * 10) / 10;
	
	var ag = event.accelerationIncludingGravity;
	var gamma = -Math.atan(ag.x / ag.z) * 180 / Math.PI;
	var beta = Math.atan(ag.y / ag.z) * 180 / Math.PI;
	
	document.getElementById("id_acc_g").innerHTML = "AccG = " + Math.round(ag.x * 10) / 10 + " " + Math.round(ag.y * 10) / 10 + " " + Math.round(ag.z * 10) / 10 + " gamma = " + Math.round(gamma * 10) / 10 + " beta = " + Math.round(beta * 10) / 10;
	
}

document.getElementById("id_logic_level_version").innerHTML = "DATA: 2018.01.30.2"; 

var canvas = document.getElementById("id_canvas");
var context = canvas.getContext("2d");
var rect_canvas = canvas.getBoundingClientRect();
var img = document.getElementById("id_img");

var top_x = 100;
var top_y = 100;

var img_width = 100;
var img_height = 100;


img.onload = function(){
	context.drawImage(img, top_x, top_y, img_width, img_height);
	var rect_img = img.getBoundingClientRect();
}
canvas.addEventListener("touchmove", on_touch_move);
canvas.addEventListener("touchstart", on_touch_start);

var offset_inside_image_x;
var offset_inside_image_y;
//----------------------------------------
function on_touch_start(e)
{
	e.preventDefault();
	
	var touches = e.changedTouches;
	for (var i = 0; i < touches.length; i++){
		if (touches[i].pageX - rect_canvas.left < top_x + img_width && touches[i].pageX - rect_canvas.left >= top_x && 
			touches[i].pageY - rect_canvas.top < top_y + img_height && touches[i].pageY - rect_canvas.top >= top_y) {
				offset_inside_image_x = (touches[i].pageX - rect_canvas.left) - top_x;
				offset_inside_image_y = (touches[i].pageY - rect_canvas.top) - top_y;
			}
	}
}
//----------------------------------------
function on_touch_move(e)
{
	e.preventDefault();
	
	var touches = e.changedTouches;
	for (var i = 0; i < touches.length; i++){
		if (touches[i].pageX - rect_canvas.left < top_x + img_width && touches[i].pageX - rect_canvas.left >= top_x && 
			touches[i].pageY - rect_canvas.top < top_y + img_height && touches[i].pageY - rect_canvas.top >= top_y) {
				context.clearRect(0, 0, 400, 300);
				top_x = touches[i].pageX - rect_canvas.left - offset_inside_image_x;
				top_y = touches[i].pageY - rect_canvas.top - offset_inside_image_y;
				context.drawImage(img, top_x, top_y, img_width, img_height);
			}
	}
}
