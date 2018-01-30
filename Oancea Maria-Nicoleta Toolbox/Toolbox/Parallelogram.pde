/*
  created by Oancea Maria-Nicoleta
  email: oanceamarianicoleta@gmail.com
  MIT license
*/ 

String aP = "";
String bP= "";
String hP = "";
String perimeterP = "";
String areaP = "";

boolean okaP = false;
boolean okbP = false;
boolean okhP = false;

//the function where the interface for the parallelogram perimeter and area calculation page is created
void parallelogramPA(){
  strokeWeight(3);
  stroke(#0000ff);
  fill(#0000ff);
  textAlign(CENTER, TOP);
  textSize(height/20);
  imageMode(CORNER);
  rect(0, 0, width, height/10 );
  fill(#ffffff);
  text("Parallelogram", width/2, height/30);
  image(backImg, width/36, height/60, width/6.5, height/15);
  
  imageMode(CENTER);
  image(parallelogramImg, width/2, height/4.8, width/1.5, height/5);
  
  if (okaP) aP = valueKeyboard;
  if (okbP) bP = valueKeyboard;
  if (okhP) hP = valueKeyboard;
  if (aP != "" && bP != "" && hP != "" ) calculatesPAP();
  
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
  text (aP, width/7, height/2.72);
  text("b = ", 20, height/2.35);
  if ( mouseX > width/8 && mouseX < width/8+width/2 && mouseY > height/2.4 && mouseY < height/2.4+height/20 ) fill(#d9d9d9);
  else noFill();
  rect(width/8, height/2.4, width/2, height/20, 15);
  fill(#000000);
  text (bP, width/7, height/2.35);
  text("h = ", 20, height/2.05);
  if ( mouseX > width/8 && mouseX < width/8+width/2 && mouseY > height/2.1 && mouseY < height/2.1+height/20 ) fill(#d9d9d9);
  else noFill();
  rect(width/8, height/2.1, width/2, height/20, 15);
  fill(#000000);
  text (hP, width/7, height/2.05);
  
  textSize(height/25);
  text("P = ", 20, height/1.75);
  text (perimeterP, width/6.5, height/1.75);
  text("A = ", 20, height/1.6);
  text (areaP, width/6.5, height/1.6);
  
}

//the function, where defines actions for the parallelogram perimeter and area calculation page
void parallelogramPAClick(){
  if ( mouseX > width/36 && mouseX < width/36+width/6.5 && mouseY > height/60 && mouseY < height/60+height/15 ) {
    page = -2;
    pagePAV = 1;
    pagePA = 0;
    aP = bP = hP = valueKeyboard = perimeterP = areaP = "";
  }

  if ( mouseX > width/8 && mouseX < width/8+width/2 && mouseY > height/2.8 && mouseY < height/2.8+height/20 ) {
    activeKeyboard = true;
    okaP = true;
    okbP = false;
    okhP = false;
    valueKeyboard = aP;
  }
  if ( mouseX > width/8 && mouseX < width/8+width/2 && mouseY > height/2.4 && mouseY < height/2.4+height/20 ) {
    activeKeyboard = true;
    okbP = true;
    okaP = false;
    okhP = false;
    valueKeyboard = bP;
  }
  if ( mouseX > width/8 && mouseX < width/8+width/2 && mouseY > height/2.1 && mouseY < height/2.1+height/20 ) {
    activeKeyboard = true;
    okhP = true;
    okaP = false;
    okbP = false;
    valueKeyboard = hP;
  }
}

//the function where calculate perimeter and area of the parallelogram
void calculatesPAP(){
  perimeterP = str( 2 * ( float(aP) + float(bP) ) ); 
  areaP = str( float(bP) * float(hP) );
}