/*
  created by Oancea Maria-Nicoleta
  email: oanceamarianicoleta@gmail.com
  MIT license
*/

int pagePA = 0;

//the function where the interface for the perimeter and area calculation page is created
void calculatePerimeterArea(){
  strokeWeight(3);
  stroke(#0000ff);
  fill(#0000ff);
  textAlign(CENTER, TOP);
  textSize(height/22);
  imageMode(CORNER);
  rect(0, 0, width, height/10 );
  fill(#ffffff);
  text("Perimeter / Area", width/2+40, height/30);
  image(backImg, width/36, height/60, width/6.5, height/15);
  imageMode(CENTER);
  
  textSize(height/25);
  strokeWeight(6);
  stroke(#b3b3b3);
  fill(#000000);
  noFill();
  rect(-2, height/10, width+4, height/12 );
  text("Circle", width/2, height/8);
  rect(-2, height/10+height/12, width+4, height/12 );
  text("Ellipse", width/2, height/8+height/12);
  rect(-2, height/10+2*height/12, width+4, height/12 );
  text("Triangle", width/2, height/8+2*height/12);
  rect(-2, height/10+3*height/12, width+4, height/12 );
  text("Square", width/2, height/8+3*height/12);
  rect(-2, height/10+4*height/12, width+4, height/12 );
  text("Rectangle", width/2, height/8+4*height/12);
  rect(-2, height/10+5*height/12, width+4, height/12 );
  text("Diamond", width/2, height/8+5*height/12);
  rect(-2, height/10+6*height/12, width+4, height/12 );
  text("Parallelogram", width/2, height/8+6*height/12);
  rect(-2, height/10+7*height/12, width+4, height/12 );
  text("Trapeze", width/2, height/8+7*height/12);
  rect(-2, height/10+8*height/12, width+4, height/12 );
  text("Pentagon", width/2, height/8+8*height/12);
  rect(-2, height/10+9*height/12, width+4, height/12 );
  text("Hexagon", width/2, height/8+9*height/12);
}

//the function, where defines actions for the perimeter and area calculation page
void calculatePerimeterAreaClick(){
  if ( mouseX > width/36 && mouseX < width/36+width/6.5 && mouseY > height/60 && mouseY < height/60+height/15 ) {
    page = 8;
  }

  if ( mouseX > 0 && mouseX < width && mouseY > height/10 && mouseY < height/10+height/12 ) pagePA = 1;
  if ( mouseX > 0 && mouseX < width && mouseY > height/10+height/12 && mouseY < height/10+2*height/12 ) pagePA = 2;
  if ( mouseX > 0 && mouseX < width && mouseY > height/10+2*height/12 && mouseY < height/10+3*height/12 ) pagePA = 3;
  if ( mouseX > 0 && mouseX < width && mouseY > height/10+3*height/12 && mouseY < height/10+4*height/12 ) pagePA = 4;
  if ( mouseX > 0 && mouseX < width && mouseY > height/10+4*height/12 && mouseY < height/10+5*height/12 ) pagePA = 5;
  if ( mouseX > 0 && mouseX < width && mouseY > height/10+5*height/12 && mouseY < height/10+6*height/12 ) pagePA = 6;
  if ( mouseX > 0 && mouseX < width && mouseY > height/10+6*height/12 && mouseY < height/10+7*height/12 ) pagePA = 7;
  if ( mouseX > 0 && mouseX < width && mouseY > height/10+7*height/12 && mouseY < height/10+8*height/12 ) pagePA = 8;
  if ( mouseX > 0 && mouseX < width && mouseY > height/10+8*height/12 && mouseY < height/10+9*height/12 ) pagePA = 9;
  if ( mouseX > 0 && mouseX < width && mouseY > height/10+9*height/12 && mouseY < height/10+10*height/12 ) pagePA = 10;
 
}