/*
  created by Oancea Maria-Nicoleta
  email: oanceamarianicoleta@gmail.com
  MIT license
*/

String aD = "";
String hD= "";
String perimeterD = "";
String areaD = "";

boolean okaD = false;
boolean okhD = false;

//the function where the interface for the circle perimeter and area calculation page is created
void diamondPA(){
  strokeWeight(3);
  stroke(#0000ff);
  fill(#0000ff);
  textAlign(CENTER, TOP);
  textSize(height/20);
  imageMode(CORNER);
  rect(0, 0, width, height/10 );
  fill(#ffffff);
  text("Diamond", width/2, height/30);
  image(backImg, width/36, height/60, width/6.5, height/15);
  
  imageMode(CENTER);
  image(diamondImg, width/2, height/4.8, width/1.5, height/5);
  
  if (okaD) aD = valueKeyboard;
  if (okhD) hD = valueKeyboard;
  if (aD != "" && hD != "" ) calculatesPAD();
  
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
  text (aD, width/7, height/2.72);
  text("h = ", 20, height/2.35);
  if ( mouseX > width/8 && mouseX < width/8+width/2 && mouseY > height/2.4 && mouseY < height/2.4+height/20 ) fill(#d9d9d9);
  else noFill();
  rect(width/8, height/2.4, width/2, height/20, 15);
  fill(#000000);
  text (hD, width/7, height/2.35);
  
  textSize(height/25);
  text("P = ", 20, height/1.95);
  text (perimeterD, width/6.5, height/1.95);
  text("A = ", 20, height/1.75);
  text (areaD, width/6.5, height/1.75);
  
}

//the function, where defines actions for the diamond perimeter and area calculation page
void diamondPAClick(){
  if ( mouseX > width/36 && mouseX < width/36+width/6.5 && mouseY > height/60 && mouseY < height/60+height/15 ) {
    page = -2;
    pagePAV = 1;
    pagePA = 0;
    aD = hD = valueKeyboard = perimeterD = areaD = "";
  }

  if ( mouseX > width/7 && mouseX < width/7+width/2 && mouseY > height/2.8 && mouseY < height/2.8+height/20 ) {
    activeKeyboard = true;
    okaD = true;
    okhD = false;
    valueKeyboard = aD;
  }
  if ( mouseX > width/7 && mouseX < width/7+width/2 && mouseY > height/2.4 && mouseY < height/2.4+height/20 ) {
    activeKeyboard = true;
    okhD = true;
    okaD = false;
    valueKeyboard = hD;
  }
}

//the function where calculate perimeter and area of the diamond
void calculatesPAD(){
  perimeterD = str( 4 *  float(aD) ); 
  areaD = str( float(aD) * float(hD) );
}