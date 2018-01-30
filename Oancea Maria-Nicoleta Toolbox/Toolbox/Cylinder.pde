/*
  created by Oancea Maria-Nicoleta
  email: oanceamarianicoleta@gmail.com
  MIT license
*/

String rCylinder = "";
String hCylinder= "";
String areaCylinder = "";
String volumeCylinder = "";

boolean okrCylinder = false;
boolean okhCylinder = false;

//the function where the interface for the cube area and volume calculation page is cylinder
void cylinderAV(){
  strokeWeight(3);
  stroke(#0000ff);
  fill(#0000ff);
  textAlign(CENTER, TOP);
  textSize(height/20);
  imageMode(CORNER);
  rect(0, 0, width, height/10 );
  fill(#ffffff);
  text("Cylinder", width/2, height/30);
  image(backImg, width/36, height/60, width/6.5, height/15);
  
  imageMode(CENTER);
  image(cylinderImg, width/2, height/4.8, width/3, height/5);
  
  if (okrCylinder) rCylinder = valueKeyboard;
  if (okhCylinder) hCylinder = valueKeyboard;
  if (rCylinder != "" && hCylinder != "" ) calculatesAVCylinder();
  
  textSize(height/30);
  textAlign(LEFT, TOP);
  fill(#000000);
  strokeWeight(6);
  stroke(#b3b3b3);
  noFill();
  text("Enter the value:", 20, height/3.2);
  text("r = ", 20, height/2.72);
  if ( mouseX > width/8 && mouseX < width/8+width/2 && mouseY > height/2.8 && mouseY < height/2.8+height/20 ) fill(#d9d9d9);
  else noFill();
  rect(width/8, height/2.8, width/2, height/20, 15);
  fill(#000000);
  text (rCylinder, width/7, height/2.72);
  text("h = ", 20, height/2.35);
  if ( mouseX > width/8 && mouseX < width/8+width/2 && mouseY > height/2.4 && mouseY < height/2.4+height/20 ) fill(#d9d9d9);
  else noFill();
  rect(width/8, height/2.4, width/2, height/20, 15);
  fill(#000000);
  text (hCylinder, width/7, height/2.35);
  
  textSize(height/25);
  text("A = ", 20, height/1.95);
  text (areaCylinder, width/6.5, height/1.95);
  text("V = ", 20, height/1.75);
  text (volumeCylinder, width/6.5, height/1.75);
  
}

//the function, where defines actions for the cylinder area and volume calculation page
void cylinderAVClick(){
  if ( mouseX > width/36 && mouseX < width/36+width/6.5 && mouseY > height/60 && mouseY < height/60+height/15 ) {
    page = -2;
    pagePAV = 2;
    pageAV = 0;
    rCylinder = hCylinder = valueKeyboard = areaCylinder = volumeCylinder = "";
  }

  if ( mouseX > width/7 && mouseX < width/7+width/2 && mouseY > height/2.8 && mouseY < height/2.8+height/20 ) {
    activeKeyboard = true;
    okrCylinder = true;
    okhCylinder = false;
    valueKeyboard = rCylinder;
  }
  if ( mouseX > width/7 && mouseX < width/7+width/2 && mouseY > height/2.4 && mouseY < height/2.4+height/20 ) {
    activeKeyboard = true;
    okhCylinder = true;
    okrCylinder = false;
    valueKeyboard = hCylinder;
  }
}

//the function where calculate area and volume of the cube
void calculatesAVCylinder(){
  areaCylinder = str( 2 * PI * float(rCylinder) * ( float(rCylinder) + float(hCylinder) ) ); 
  volumeCylinder = str( PI * pow( float(rCylinder), 2 ) * float(hCylinder) );
}