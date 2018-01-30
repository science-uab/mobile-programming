/*
  created by Oancea Maria-Nicoleta
  email: oanceamarianicoleta@gmail.com
  MIT license
*/

float xBL, yBL, xBLV, yBLV, xBLH, yBLH;

//the function, where the bubble level interface is created
void bubbleLevel(){
  strokeWeight(3);
  stroke(#0000ff);
  fill(#0000ff);
  textAlign(CENTER, TOP);
  textSize(height/20);
  imageMode(CORNER);
  rect(0, 0, width, height/10 );
  fill(#ffffff);
  text("Bubble Level", width/2, height/30);
  image(backImg, width/36, height/60, width/6.5, height/15);
  
  //the bubble is initially positioned at the zero point of the bubble level
  //this point changes according to the inclination of the phone, values that return the accelerometer
  xBLH = width/2 + ax * 25;
  
  xBL = width/2.7 + ax * 15;
  yBL = height/2.2 + ay *15;
  
  yBLV = height/1.9 + ay * 25;
  
  imageMode(CENTER);
  image(BLhorizontal, width/2+3, height/5.8, width/1.1, height/9);
  image(bubble, xBLH, yBLH, height/14, height/16);
  
  image(bubbleLevel, width/2.7, height/2.2, width/1.5, width/1.5);
  image(bubble, xBL, yBL, height/17, height/17);
  
  image(BLvertical, width-width/6, height/1.9-2, height/9, width/1.1);
  image(bubble, xBLV, yBLV, height/16, height/14);

}

//if touch the back button created in the application returns to the home page
void bubbleLevelClick(){
  if ( mouseX > width/36 && mouseX < width/36+width/6.5 && mouseY > height/60 && mouseY < height/60+height/15 ) {
    page = 0;
  }
}