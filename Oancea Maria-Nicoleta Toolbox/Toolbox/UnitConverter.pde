/*
  created by Oancea Maria-Nicoleta
  email: oanceamarianicoleta@gmail.com
  MIT license
*/

int pageUC = 0;
int angleUC = 0;

//the function where the interface for the unit converter page is created
void unitConverter(){
  strokeWeight(3);
  stroke(#0000ff);
  fill(#0000ff);
  textAlign(CENTER, TOP);
  textSize(height/20);
  imageMode(CORNER);
  rect(0, 0, width, height/10 );
  fill(#ffffff);
  text("Unit Converter", width/2, height/30);
  image(backImg, width/36, height/60, width/6.5, height/15);
  imageMode(CENTER);
  
  textSize(height/25);
  strokeWeight(6);
  stroke(#b3b3b3);
  fill(#000000);
  noFill();
  rect(-2, height/10, width+4, height/14 );
  text("Angle Converter", width/2, height/8.5);
  rect(-2, height/10 + height/14, width+4, height/14 );
  text("Area Converter", width/2, height/8.5 + height/14);
  rect(-2, height/10 + 2*height/14, width+4, height/14 );
  text("Length Converter", width/2, height/8.5 + 2*height/14);
  rect(-2, height/10 + 3*height/14, width+4, height/14 );
  text("Metric Converter", width/2, height/8.5 + 3*height/14);
  rect(-2, height/10 + 4*height/14, width+4, height/14 );
  text("Temperature Converter", width/2, height/8.5 + 4*height/14);
  rect(-2, height/10 + 5*height/14, width+4, height/14 );
  text("Time Converter", width/2, height/8.5 + 5*height/14);
  rect(-2, height/10 + 6*height/14, width+4, height/14 );
  text("Volume Converter", width/2, height/8.5 + 6*height/14);
  rect(-2, height/10 + 7*height/14, width+4, height/14 );
  text("Weight Converter", width/2, height/8.5 + 7*height/14);
  
  if ( angleUC < 360 ) angleUC++;
  else angleUC = 0;
  image(logoUC, width/2, height/1.2, height/3.5, height/3.5);
  pushMatrix();
  translate(width/2, height/1.2);
  rotate( radians(angleUC) );
  image(iconUC, 0, 0, height/3.5, height/3.5);
  popMatrix();
   
}

//the function, where defines actions for the unit converter page
void unitConverterClick(){
  if ( mouseX > width/36 && mouseX < width/36+width/6.5 && mouseY > height/60 && mouseY < height/60+height/15 ) {
    page = 0;
  }
  
  if ( mouseX > 0 && mouseX < width && mouseY > height/10 && mouseY < height/10 + height/14 ) {
    pageUC = 1;
    page = -1;
  }
  if ( mouseX > 0 && mouseX < width && mouseY > height/10 + height/14 && mouseY < height/10 + 2*height/14 ) {
    pageUC = 2;
    page = -1;
  }
  if ( mouseX > 0 && mouseX < width && mouseY > height/10 + 2*height/14 && mouseY < height/10 + 3*height/14 ) {
    pageUC = 3;
    page = -1;
  }
  if ( mouseX > 0 && mouseX < width && mouseY > height/10 + 3*height/14 && mouseY < height/10 + 4*height/14 ) {
    pageUC = 4;
    page = -1;
  }
  if ( mouseX > 0 && mouseX < width && mouseY > height/10 + 4*height/14 && mouseY < height/10 + 5*height/14 ) {
    pageUC = 5;
    page = -1;
  }
  if ( mouseX > 0 && mouseX < width && mouseY > height/10 + 5*height/14 && mouseY < height/10 + 6*height/14 ) {
    pageUC = 6;
    page = -1;
  }
  if ( mouseX > 0 && mouseX < width && mouseY > height/10 + 6*height/14 && mouseY < height/10 + 7*height/14 ) {
    pageUC = 7;
    page = -1;
  }
  if ( mouseX > 0 && mouseX < width && mouseY > height/10 + 7*height/14 && mouseY < height/10 + 8*height/14 ) {
    pageUC = 8;
    page = -1;
  }

}