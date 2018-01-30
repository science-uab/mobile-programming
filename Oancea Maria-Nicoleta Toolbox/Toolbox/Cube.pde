/*
  created by Oancea Maria-Nicoleta
  email: oanceamarianicoleta@gmail.com
  MIT license
*/

String aCube = "";
String areaCube = "";
String volumeCube = "";

//the function where the interface for the cube area and volume calculation page is created
void cubeAV(){
  strokeWeight(3);
  stroke(#0000ff);
  fill(#0000ff);
  textAlign(CENTER, TOP);
  textSize(height/20);
  imageMode(CORNER);
  rect(0, 0, width, height/10 );
  fill(#ffffff);
  text("Cube", width/2, height/30);
  image(backImg, width/36, height/60, width/6.5, height/15);
  
  imageMode(CENTER);
  image(cubeImg, width/2, height/4.8, height/5, height/5);  
  
  aCube = valueKeyboard;
  if (aCube != "" ) calculatesAVCube();
  
  textSize(height/30);
  textAlign(LEFT, TOP);
  fill(#000000);
  strokeWeight(6);
  stroke(#b3b3b3);
  noFill();
  text("Enter the value:", 20, height/3.2);
  text("a = ", 20, height/2.72);
  if ( mouseX > width/8 && mouseX < width/8+width/2 && mouseY > height/2.8 && mouseY < height/2.8+height/20 ) fill(#d9d9d9);
  else noFill();
  rect(width/8, height/2.8, width/2, height/20, 15);
  fill(#000000);
  text (aCube, width/7, height/2.72);

  textSize(height/25);
  text("A = ", 20, height/2.2);
  text (areaCube, width/6.5, height/2.2);
  text("V = ", 20, height/2);
  text (volumeCube, width/6.5, height/2);
  
}

//the function, where defines actions for the cube area and volume calculation page
void cubeAVClick(){
  if ( mouseX > width/36 && mouseX < width/36+width/6.5 && mouseY > height/60 && mouseY < height/60+height/15 ) {
    page = -2;
    pagePAV = 2;
    pageAV = 0;
    aCube = valueKeyboard = areaCube = volumeCube = "";
  }

  if ( mouseX > width/8 && mouseX < width/8+width/2 && mouseY > height/2.8 && mouseY < height/2.8+height/20 ) {
    activeKeyboard = true;
  }

}

//the function where calculate area and volume of the cube
void calculatesAVCube(){
  areaCube = str( 6 * pow( float(aCube), 2 ) ); 
  volumeCube = str( pow( float(aCube), 3 ) );
}