/*
  created by Oancea Maria-Nicoleta
  email: oanceamarianicoleta@gmail.com
  MIT license
*/

String rCone = "";
String hCone= "";
String areaCone = "";
String volumeCone = "";

boolean okrCone = false;
boolean okhCone = false;

//the function where the interface for the cone area and volume calculation page is created
void coneAV(){
  strokeWeight(3);
  stroke(#0000ff);
  fill(#0000ff);
  textAlign(CENTER, TOP);
  textSize(height/20);
  imageMode(CORNER);
  rect(0, 0, width, height/10 );
  fill(#ffffff);
  text("Cone", width/2, height/30);
  image(backImg, width/36, height/60, width/6.5, height/15);
  
  imageMode(CENTER);
  image(coneImg, width/2, height/4.8, width/3, height/5);
  
  if (okrCone) rCone = valueKeyboard;
  if (okhCone) hCone = valueKeyboard;
  if (rCone != "" && hCone != "" ) calculatesAVCone();
  
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
  text (rCone, width/7, height/2.72);
  text("h = ", 20, height/2.35);
  if ( mouseX > width/8 && mouseX < width/8+width/2 && mouseY > height/2.4 && mouseY < height/2.4+height/20 ) fill(#d9d9d9);
  else noFill();
  rect(width/8, height/2.4, width/2, height/20, 15);
  fill(#000000);
  text (hCone, width/7, height/2.35);
  
  textSize(height/25);
  text("A = ", 20, height/1.95);
  text (areaCone, width/6.5, height/1.95);
  text("V = ", 20, height/1.75);
  text (volumeCone, width/6.5, height/1.75);
  
}

//the function, where defines actions for the circle area and volume calculation page
void coneAVClick(){
  if ( mouseX > width/36 && mouseX < width/36+width/6.5 && mouseY > height/60 && mouseY < height/60+height/15 ) {
    page = -2;
    pagePAV = 2;
    pageAV = 0;
    rCone = hCone = valueKeyboard = areaCone = volumeCone = "";
  }

  if ( mouseX > width/7 && mouseX < width/7+width/2 && mouseY > height/2.8 && mouseY < height/2.8+height/20 ) {
    activeKeyboard = true;
    okrCone = true;
    okhCone = false;
    valueKeyboard = rCone;
  }
  if ( mouseX > width/7 && mouseX < width/7+width/2 && mouseY > height/2.4 && mouseY < height/2.4+height/20 ) {
    activeKeyboard = true;
    okhCone = true;
    okrCone = false;
    valueKeyboard = hCone;
  }
}

//the function where calculate area and volume of the cone
void calculatesAVCone(){
  areaCone = str( PI * float(rCone) * ( float(rCone) + sqrt( pow( float(rCone), 2 ) + pow( float(hCone), 2 ) ) ) ); 
  volumeCone = str( ( (float) 1 / 3 ) * PI * pow( float(rCone), 2 ) * float(hCone) );
}