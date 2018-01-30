/*
  created by Oancea Maria-Nicoleta
  email: oanceamarianicoleta@gmail.com
  MIT license
*/

int pageAV = 0;

//the function where the interface for the area and volume calculation page is created
void calculateAreaVolume(){
  strokeWeight(3);
  stroke(#0000ff);
  fill(#0000ff);
  textAlign(CENTER, TOP);
  textSize(height/22);
  imageMode(CORNER);
  rect(0, 0, width, height/10 );
  fill(#ffffff);
  text("Area / Volume", width/2+40, height/30);
  image(backImg, width/36, height/60, width/6.5, height/15);
  imageMode(CENTER);
  
  textSize(height/25);
  strokeWeight(6);
  stroke(#b3b3b3);
  fill(#000000);
  noFill();
  rect(-2, height/10, width+4, height/12 );
  text("Sphere", width/2, height/8);
  rect(-2, height/10+height/12, width+4, height/12 );
  text("Cone", width/2, height/8+height/12);
  rect(-2, height/10+2*height/12, width+4, height/12 );
  text("Cylinder", width/2, height/8+2*height/12);
  rect(-2, height/10+3*height/12, width+4, height/12 );
  text("Pyramid", width/2, height/8+3*height/12);
  rect(-2, height/10+4*height/12, width+4, height/12 );
  text("Prism", width/2, height/8+4*height/12);
  rect(-2, height/10+5*height/12, width+4, height/12 );
  text("Cube", width/2, height/8+5*height/12);
  rect(-2, height/10+6*height/12, width+4, height/12 );
  text("Rectangular Parallelepiped", width/2, height/8+6*height/12);
}

//the function, where defines actions for the area and volume calculation page
void calculateAreaVolumeClick(){
  if ( mouseX > width/36 && mouseX < width/36+width/6.5 && mouseY > height/60 && mouseY < height/60+height/15 ) {
    page = 8;
  }

  //when selecting a geometric figure the variable corresponding to that page receives the corresponding value
  if ( mouseX > 0 && mouseX < width && mouseY > height/10 && mouseY < height/10+height/12 ) pageAV = 1;
  if ( mouseX > 0 && mouseX < width && mouseY > height/10+height/12 && mouseY < height/10+2*height/12 ) pageAV = 2;
  if ( mouseX > 0 && mouseX < width && mouseY > height/10+2*height/12 && mouseY < height/10+3*height/12 ) pageAV = 3;
  if ( mouseX > 0 && mouseX < width && mouseY > height/10+3*height/12 && mouseY < height/10+4*height/12 ) pageAV = 4;
  if ( mouseX > 0 && mouseX < width && mouseY > height/10+4*height/12 && mouseY < height/10+5*height/12 ) pageAV = 5;
  if ( mouseX > 0 && mouseX < width && mouseY > height/10+5*height/12 && mouseY < height/10+6*height/12 ) pageAV = 6;
  if ( mouseX > 0 && mouseX < width && mouseY > height/10+6*height/12 && mouseY < height/10+7*height/12 ) pageAV = 7;
 
}