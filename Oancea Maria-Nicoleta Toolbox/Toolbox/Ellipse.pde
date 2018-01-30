/*
  created by Oancea Maria-Nicoleta
  email: oanceamarianicoleta@gmail.com
  MIT license
*/ 

String r1E = "";
String r2E= "";
String perimeterE = "";
String areaE = "";

boolean okr1E = false;
boolean okr2E = false;

//the function where the interface for the ellipse perimeter and area calculation page is created
void ellipsePA(){
  strokeWeight(3);
  stroke(#0000ff);
  fill(#0000ff);
  textAlign(CENTER, TOP);
  textSize(height/20);
  imageMode(CORNER);
  rect(0, 0, width, height/10 );
  fill(#ffffff);
  text("Ellipse", width/2, height/30);
  image(backImg, width/36, height/60, width/6.5, height/15);
  
  imageMode(CENTER);
  image(ellipseImg, width/2, height/4.8, width/1.5, height/5);
  
  if (okr1E) r1E = valueKeyboard;
  if (okr2E) r2E = valueKeyboard;
  if (r1E != "" && r2E != "" ) calculatesPAE();
  
  textSize(height/30);
  textAlign(LEFT, TOP);
  fill(#000000);
  strokeWeight(6);
  stroke(#b3b3b3);
  noFill();
  text("Enter the value:", 20, height/3.2);
  text("r1 = ", 20, height/2.72);
  if ( mouseX > width/7 && mouseX < width/7+width/2 && mouseY > height/2.8 && mouseY < height/2.8+height/20 ) fill(#d9d9d9);
  else noFill();
  rect(width/7, height/2.8, width/2, height/20, 15);
  fill(#000000);
  text (r1E, width/6, height/2.72);
  text("r2 = ", 20, height/2.35);
  if ( mouseX > width/7 && mouseX < width/7+width/2 && mouseY > height/2.4 && mouseY < height/2.4+height/20 ) fill(#d9d9d9);
  else noFill();
  rect(width/7, height/2.4, width/2, height/20, 15);
  fill(#000000);
  text (r2E, width/6, height/2.35);
  
  textSize(height/25);
  text("C = ", 20, height/1.95);
  text (perimeterE, width/6.5, height/1.95);
  text("A = ", 20, height/1.75);
  text (areaE, width/6.5, height/1.75);
  
}

//the function, where defines actions for the ellipse perimeter and area calculation page
void ellipsePAClick(){
  if ( mouseX > width/36 && mouseX < width/36+width/6.5 && mouseY > height/60 && mouseY < height/60+height/15 ) {
    page = -2;
    pagePAV = 1;
    pagePA = 0;
    r1E = r2E = valueKeyboard = perimeterE = areaE = "";
  }

  if ( mouseX > width/7 && mouseX < width/7+width/2 && mouseY > height/2.8 && mouseY < height/2.8+height/20 ) {
    activeKeyboard = true;
    okr1E = true;
    okr2E = false;
    valueKeyboard = r1E;
  }
  if ( mouseX > width/7 && mouseX < width/7+width/2 && mouseY > height/2.4 && mouseY < height/2.4+height/20 ) {
    activeKeyboard = true;
    okr2E = true;
    okr1E = false;
    valueKeyboard = r2E;
  }
}

//the function where calculate perimeter and area of the ellipse
void calculatesPAE(){
  perimeterE = str( 2 * PI * sqrt( ( pow( float(r1E), 2) + pow( float(r2E), 2 ) ) / 2 ) ); 
  areaE = str( PI * float(r1E) * float(r2E) );
}