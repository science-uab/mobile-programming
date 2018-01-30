/*
  created by Oancea Maria-Nicoleta
  email: oanceamarianicoleta@gmail.com
  MIT license
*/  

float inclination;

//the function where the interface for the inclination page is created
void inclination(){
  strokeWeight(3);
  stroke(#0000ff);
  fill(#0000ff);
  textAlign(CENTER, TOP);
  textSize(height/20);
  imageMode(CORNER);
  rect(0, 0, width, height/10 );
  fill(#ffffff);
  text("Inclination", width/2, height/30); 
  image(backImg, width/36, height/60, width/6.5, height/15);
  
  //the inclination is calculated based on the values returned by the accelerometer
  inclination = atan( ay / (sqrt(pow(ax,2) + pow(az,2))));
  inclination *= 180.00;
  inclination /= PI;
  
  image(line1, width/6, height/1.8, width/1.5, height/30);
  pushMatrix();
  translate(width/6, height/1.8 + height/30);
  if ( inclination >= 0) rotate( radians( 270 - inclination ) );
  else rotate( radians( 270 ) );
  image(line2, 0, 0, height/30, width/1.5);
  popMatrix();
  
  strokeWeight(12);
  stroke(#00ff00);
  noFill();
  if ( inclination >= 0) arc( width/6, height/1.8+height/30, width/5,  width/5, radians( 360 - inclination ), radians(358) );
  
  textSize(height/24);
  fill(#000000);
  if ( inclination >= 0) text("Inclination: " + round( (inclination * 100.0f ) / 100.0f ) + "°", width/2, height/1.4);
}

//if touch the back button created in the application returns to the home page
void inclinationClick(){
  if ( mouseX > width/36 && mouseX < width/36+width/6.5 && mouseY > height/60 && mouseY < height/60+height/15 ) {
    page = 0;
  }
}