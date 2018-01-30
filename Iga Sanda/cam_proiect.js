
// Author: Iga (Voronianu) Sanda Florina <vorosanda@gmail.com> 
// MIT License 

var d = new Date();

document.getElementById("id_business_level_version").innerHTML = 
		"Business level version:" + 
		d.getFullYear() + "." + d.getMonth() + 1 + "." + d.getDate() + ".1"; 

var constraints = {audio:true, video:{facingMode:"environment"}};		
navigator.mediaDevices.getUserMedia(constraints).then(on_success).catch(on_error);

var video = document.getElementById("id_video");
video.addEventListener("touchstart", snap);
video.addEventListener("mousedown", snap);

var canvas = document.getElementById("id_canvas");
canvas.addEventListener("touchstart", download);
canvas.addEventListener("mousedown", download);
//---------------------------------
function on_success(stream)
{
	video.srcObject = stream;
}
//---------------------------------
function on_error(error)
{
	alert("Error");
}
//---------------------------------
function snap()
{
	var context = canvas.getContext("2d");
	context.drawImage(video, 0, 0, 220, 140);
}
//---------------------------------
function download()
{
	var my_image = canvas.toDataURL("image/png").replace("image/png", "image/octet-stream");
	window.location.href = my_image;
}
//---------------------------------