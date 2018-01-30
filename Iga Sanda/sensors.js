
// Author: Iga (Voronianu) Sanda Florina <vorosanda@gmail.com> 
// MIT License 

document.getElementById("id_logic_level_version").innerHTML = "Business level version: 2018.01.28.7"; 
window.addEventListener('deviceorientation', ondeviceorientation);
window.addEventListener('devicemotion', ondevicemotion);


//----------------------------------------
function deseneaza_cerc_svg(gamma, beta)
{
	var svg = document.getElementById("id_svg");
	var w = svg.getAttribute("width");
	var h = svg.getAttribute("height");
	
	var cerc = document.getElementById("id_circle");

	var centru = {x : w / 2, y : h / 2};
	var raza = cerc.getAttribute("r");
	var max_deplasare_x = w / 2 - raza;
	var max_deplasare_y = h / 2 - raza;

	cerc.setAttribute("cx", centru.x + gamma / 90 * max_deplasare_x);
	cerc.setAttribute("cy", centru.y + beta / 90 * max_deplasare_y);	
}
//----------------------------------------
function deseneaza_cerc_canvas(gamma, beta)
{
	var canvas = document.getElementById("id_canvas");
	var context = canvas.getContext("2d");
 
	context.beginPath();
	var w = canvas.getAttribute("width");
	var h = canvas.getAttribute("height");
	
	context.clearRect(0, 0, w, h);
	
	var centru = {x : w / 2, y : h / 2};
	var raza = 10;
	var max_deplasare_x = w / 2 - raza;
	var max_deplasare_y = h / 2 - raza;
 // gamma == 0 -> centru.x
 // gamma == -90 -> 0 + raza
 // gamma == 90 -> w - raza
	context.arc(centru.x + gamma / 90 * max_deplasare_x, centru.y + beta / 90 * max_deplasare_y, raza, 0, 2 * Math.PI);
 
	context.stroke();
}
//----------------------------------------
function deseneaza_patrat_canvas(alpha, gamma, beta)
{
	var canvas = document.getElementById("id_canvas");
	var context = canvas.getContext("2d");
 
	context.resetTransform();
	context.clearRect(0, 0, w, h);
	
	var w = canvas.getAttribute("width");
	var h = canvas.getAttribute("height");
		
	var centru = {x : w / 2, y : h / 2};
	var latura = 10;
	var max_deplasare_x = w / 2 - latura / 2;
	var max_deplasare_y = h / 2 - latura / 2;
	
	var centru_patrat = {x: centru.x + gamma / 90 * max_deplasare_x, y : centru.y + beta / 90 * max_deplasare_y};
	
	context.translate(centru_patrat.x, centru_patrat.y);
	context.rotate(alpha / 180 * Math.PI);
 // gamma == 0 -> centru.x
 // gamma == -90 -> 0 + raza
 // gamma == 90 -> w - raza
 
	context.beginPath();
	//context.arc(centru.x + gamma / 90 * max_deplasare_x, centru.y + beta / 90 * max_deplasare_y, raza, 0, 2 * Math.PI);
	context.strokeRect(- latura / 2, -latura / 2, latura, latura);
	context.stroke();
}
//----------------------------------------
function ondeviceorientation(event) 
{
	var alpha = event.alpha;
	var beta = event.beta;
	var gamma = event.gamma;
	
	document.getElementById("id_alpha").innerHTML = "alpha = " + Math.round(alpha * 10) / 10;
	document.getElementById("id_beta").innerHTML = "beta = " + Math.round(beta * 10) / 10;
	document.getElementById("id_gamma").innerHTML = "gamma = " + Math.round(gamma * 10) / 10;
	
	//deseneaza_cerc_canvas(gamma, beta);
	// deseneaza_cerc_svg(gamma, beta);
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
	//deseneaza_cerc_canvas(gamma, beta);
}
//----------------------------------------