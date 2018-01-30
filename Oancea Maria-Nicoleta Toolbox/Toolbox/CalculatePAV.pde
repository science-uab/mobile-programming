/*
  created by Oancea Maria-Nicoleta
  email: oanceamarianicoleta@gmail.com
  MIT license
*/

int pagePAV = 0;
boolean okPerimeter = true;
boolean okVolume = true;
float alpha = 0;

//the function where the interface for the perimeter, area and volume calculation page is created
void calculatePAV(){
  strokeWeight(3);
  stroke(#0000ff);
  fill(#0000ff);
  textAlign(CENTER, TOP);
  textSize(height/20);
  imageMode(CORNER);
  rect(0, 0, width, height/10 );
  fill(#ffffff);
  text("Calculate P.A.V.", width/2, height/30);
  image(backImg, width/36, height/60, width/6.5, height/15);
  imageMode(CENTER);
  
  textSize(height/25);
  strokeWeight(6);
  stroke(#b3b3b3);
  fill(#000000);
  noFill();
  rect(-2, height/10, width+4, height/10 );
  text("Calculate Perimeter/Area", width/2, height/7.5);
  rect(-2, height/5, width+4, height/10 );
  text("Calculate Area / Volume", width/2, height/7.5 + height/10);
  
  drawAnimCube();
}

//the function, where defines actions for the perimeter, area and volume calculation page
void calculatePAVClick(){
  if ( mouseX > width/36 && mouseX < width/36+width/6.5 && mouseY > height/60 && mouseY < height/60+height/15 ) {
    page = 0;
  }
  
  if ( mouseX > 0 && mouseX < width && mouseY > height/10 && mouseY < height/5 ) {
    pagePAV = 1;
    page = -2;
    pagePA = 0;
    okPerimeter = false;
    thread("threadPerimeterArea");

  }
  if ( mouseX > 0 && mouseX < width && mouseY > height/5 && mouseY < 3*height/10 ) {
    pagePAV = 2;
    page = -2;
    pageAV = 0;
    okVolume = false;
    thread("threadAreaVolume");
  }
  
}

//the function where you create a 3d cube that rotates
void drawAnimCube(){
  float x1, y1, x2, y2, x3, y3, x4, y4, x5, y5, x6, y6, x7, y7, x8, y8;
  float up1 = height/1.4;
  float left1 = width/2.3;
  float up2 = height/1.8;
  float left2 = width/1.8;
  float side = width/3;
  
  x1 = (left1 + side * cos(alpha));
  y1 = (up1 + side * sin(alpha));
  x2 = (left1 + side * cos(alpha + 1.57));
  y2 = (up1 + side * sin(alpha + 1.57));
  x3 = (left1 + side * cos(alpha - 3.14));
  y3 = (up1 + side * sin(alpha - 3.14));
  x4 = (left1 + side * cos(alpha - 1.57));
  y4 = (up1 + side * sin(alpha - 1.57));
  x5 = (left2 + side * cos(alpha));
  y5 = (up2 + side * sin(alpha));
  x6 = (left2 + side * cos(alpha + 1.57));
  y6 = (up2 + side * sin(alpha + 1.57));
  x7 = (left2 + side * cos(alpha + 3.14));
  y7 = (up2 + side * sin(alpha + 3.14));
  x8 = (left2 + side * cos(alpha - 1.57));
  y8 = (up2 + side * sin(alpha - 1.57));
  
  strokeWeight(8);
  stroke(#000000);
  
  line(x1, y1, x2, y2);
  line(x1, y1, x4, y4);
  line(x3, y3, x2, y2);
  line(x3, y3, x4, y4);
  line(x5, y5, x6, y6);
  line(x5, y5, x8, y8);
  line(x7, y7, x6, y6);
  line(x7, y7, x8, y8);
  line(x1, y1, x5, y5);
  line(x6, y6, x2, y2);
  line(x3, y3, x7, y7);
  line(x8, y8, x4, y4);
    
  if (alpha<360) alpha+=0.02;
  else alpha = 0;
}

void threadPerimeterArea(){
  delay(500);
  okPerimeter = true;
}

void threadAreaVolume(){
  delay(500);
  okVolume = true;
}