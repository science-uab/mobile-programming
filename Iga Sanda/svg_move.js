
// Author: Iga (Voronianu) Sanda Florina <vorosanda@gmail.com> 
// MIT License 

document.getElementById("id_logic_level_version").innerHTML = "Business level version: 2018.01.28.2"; 

var circle1 = document.getElementById("id_circle1");
var circle2 = document.getElementById("id_circle2");

circle1.addEventListener("touchmove", on_touch_move);
circle2.addEventListener("touchmove", on_touch_move);

var svg = document.getElementById("id_svg");
var rect_svg = svg.getBoundingClientRect();

//----------------------------------------
function on_touch_move(e)
{
	e.preventDefault();
	
	var touches = e.changedTouches;
	for (var i = 0; i < touches.length; i++){
		var circle = touches[i].target;
		if (touches[i].pageX - rect_svg.left <= rect_svg.width && 
			touches[i].pageY - rect_svg.top <= rect_svg.height &&
			touches[i].pageX - rect_svg.left >= 0 &&
			touches[i].pageY - rect_svg.top >= 0
			){
			circle.setAttribute("cx", touches[i].pageX - rect_svg.left);
			circle.setAttribute("cy", touches[i].pageY - rect_svg.top);
		}
	}
}
//----------------------------------------