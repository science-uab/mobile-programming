/*
  created by Oancea Maria-Nicoleta
  email: oanceamarianicoleta@gmail.com
  MIT license
*/ 

String state = "START";

Thread distanceRunner = null;
final Runnable distanceUpdater = new Runnable(){
  public void run(){     
    go();
  };
};
final Handler distnaceHandler = new Handler();

float xCloud1, yCloud1, xCloud2, yCloud2, xCloud3, yCloud3;

double latitude1, latitude2, longitude1, longitude2, altitude1, altitude2, distance = 0;

//the function where the interface for the distance page is created
void distance(){
  strokeWeight(3);
  stroke(#0000ff);
  fill(#0000ff);
  textAlign(CENTER, TOP);
  textSize(height/20);
  imageMode(CORNER);
  rect(0, 0, width, height/10 );
  fill(#ffffff);
  text("Distance", width/2, height/30);
  image(backImg, width/36, height/60, width/6.5, height/15);
  
  //creating an animation while walking
  if (state == "STOP" ){
    image(clouds[1], xCloud1, yCloud1, 100, 100);
    if (xCloud1 > -100) xCloud1--;
    else xCloud1 = width;
    image(clouds[2], xCloud2, yCloud2, 120, 90);
    if (xCloud2 > -120) xCloud2--;
    else xCloud2 = width + width/2.5;
    image(clouds[3], xCloud3, yCloud3, 80, 80);
    if (xCloud3 > -80) xCloud3--;
    else xCloud3 = width + width/1.5;
  }
  imageMode(CENTER);
  image(mens[posMen], width/2, height/3, 300, 300);
  
  strokeWeight(6);
  stroke(#000000);
  line(0, height/2.5, width, height/2.5 );
  line(0, height/2.1, width, height/2.1);
  
  //the gps coordinates are taken over
  activity.runOnUiThread(new Runnable(){
      public void run(){
        if ( myLocation.canAccessGPS() ) locManager.requestLocationUpdates(LocationManager.GPS_PROVIDER, 100, 0, myLocation);
      }
  });
    
  textSize(height/24);
  strokeWeight(5);
  stroke(#b3b3b3);
  fill(#000000);
  noFill();
  
  //showing the distance traveled
  if (state == "START" && distance != 0){
    if (distance < 1000) text("Distance: " + (round( (float)distance * 100.0f ) / 100.0f) + "m", width/2, height/1.6);
    else text("Distance: " + (round( (float)(distance/1000) * 100.0f ) / 100.0f ) + "km", width/2, height/1.6);
  }
  
  //if gps is turned on, the start button is displayed if not an appropriate message
  if (GPSenabeled){
    if (latitude != 0){
      if ( mouseX > width/3 && mouseX < 2*width/3 && mouseY > height/8+2*height/3 && mouseY < height/8+2*height/3+height/10 ) fill(#d9d9d9);
      else noFill();
      rect(width/3, height/8+2*height/3, width/3, height/10, 40);
      fill(#000000);
      text(state, width/2, height/8+2*height/3+40);
    }
    else text("GPS conecting...", width/2, height/8+2*height/3+40);
  }
  else text( "GPS is not enabled." ,  width/2, height/8+2*height/3+40);
}

//the function, where defines actions for the distance page
void distanceClick(){
  if ( mouseX > width/36 && mouseX < width/36+width/6.5 && mouseY > height/60 && mouseY < height/60+height/15 ) {
    page = 0;
  }
  
  //if you press the start button, the GPS coordinates are taken over and start animation
  if ( mouseX > width/3 && mouseX < 2*width/3 && mouseY > height/8+2*height/3 && mouseY < height/8+2*height/3+height/10 ){
    if (distanceRunner == null){ 
        distanceRunner = new Thread(){
            public void run(){
                while (distanceRunner != null && state == "STOP") {
                    try {
                        Thread.sleep(30);
                    } catch (InterruptedException e) { };
                    distnaceHandler.post(distanceUpdater);
                }
            }
        };
        distanceRunner.start();
    }
  //  if you press the stop button, the GPS coordinates are taken over, the function that calculates the distance is called and the animation is stopped
    if (state == "STOP"){
      state = "START";
      distanceRunner = null;
      posMen = 1;
      latitude2 = latitude;
      longitude2 = longitude;
      altitude2 = altitude;
      calculeaza();
    }
    else {
      state = "STOP";
      latitude1 = latitude;
      longitude1 = longitude;
      altitude1 = altitude;
      distance = 0;
    }   
  }
}

void go(){
   if (posMen < 20) posMen++;
   else posMen = 1;
}

//the function that calculates the distance
void calculeaza(){
  final int R = 6371; 
  double latDistance = Math.toRadians(latitude2 - latitude1);
  double lonDistance = Math.toRadians(longitude2 - longitude1);
  double a = Math.sin(latDistance / 2) * Math.sin(latDistance / 2) + Math.cos(Math.toRadians(latitude1)) * Math.cos(Math.toRadians(latitude2)) * Math.sin(lonDistance / 2) * Math.sin(lonDistance / 2);
  double c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a));
  double distanceLL = R * c * 1000; 
  double altitudeD = altitude1 - altitude2;
  distanceLL = Math.pow(distanceLL, 2) + Math.pow(altitudeD, 2);
  distance = Math.sqrt(distanceLL);  
}