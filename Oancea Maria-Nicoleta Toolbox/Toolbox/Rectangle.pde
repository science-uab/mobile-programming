/*
  created by Oancea Maria-Nicoleta
  email: oanceamarianicoleta@gmail.com
  MIT license
*/ 

String lR = "";
String LR= "";
String perimeterR = "";
String areaR = "";

boolean oklR = false;
boolean okLR = false;

//the function where the interface for the rectangle perimeter and area calculation page is created
void rectanglePA(){
  strokeWeight(3);
  stroke(#0000ff);
  fill(#0000ff);
  textAlign(CENTER, TOP);
  textSize(height/20);
  imageMode(CORNER);
  rect(0, 0, width, height/10 );
  fill(#ffffff);
  text("Rectangle", width/2, height/30);
  image(backImg, width/36, height/60, width/6.5, height/15);
  
  imageMode(CENTER);
  image(rectangleImg, width/2, height/4.8, width/1.5, height/5);
  
  if (oklR) lR = valueKeyboard;
  if (okLR) LR = valueKeyboard;
  if (lR != "" && LR != "" ) calculatesPAR();
  
  textSize(height/30);
  textAlign(LEFT, TOP);
  fill(#000000);
  strokeWeight(6);
  stroke(#b3b3b3);
  noFill();
  text("Enter the value:", 20, height/3.2);
  text("l = ", 20, height/2.72);
  if ( mouseX > width/8 && mouseX < width/8+width/2 && mouseY > height/2.8 && mouseY < height/2.8+height/20 ) fill(#d9d9d9);
  else noFill();
  rect(width/8, height/2.8, width/2, height/20, 15);
  fill(#000000);
  text (lR, width/7, height/2.72);
  text("L = ", 20, height/2.35);
  if ( mouseX > width/8 && mouseX < width/8+width/2 && mouseY > height/2.4 && mouseY < height/2.4+height/20 ) fill(#d9d9d9);
  else noFill();
  rect(width/8, height/2.4, width/2, height/20, 15);
  fill(#000000);
  text (LR, width/7, height/2.35);
  
  textSize(height/25);
  text("P = ", 20, height/1.95);
  text (perimeterR, width/6.5, height/1.95);
  text("A = ", 20, height/1.75);
  text (areaR, width/6.5, height/1.75);
  
}

//the function, where defines actions for the rectangle perimeter and area calculation page
void rectanglePAClick(){
  if ( mouseX > width/36 && mouseX < width/36+width/6.5 && mouseY > height/60 && mouseY < height/60+height/15 ) {
    page = -2;
    pagePAV = 1;
    pagePA = 0;
    lR = LR = valueKeyboard = perimeterR = areaR = "";
  }

  if ( mouseX > width/7 && mouseX < width/7+width/2 && mouseY > height/2.8 && mouseY < height/2.8+height/20 ) {
    activeKeyboard = true;
    oklR = true;
    okLR = false;
    valueKeyboard = lR;
  }
  if ( mouseX > width/7 && mouseX < width/7+width/2 && mouseY > height/2.4 && mouseY < height/2.4+height/20 ) {
    activeKeyboard = true;
    okLR = true;
    oklR = false;
    valueKeyboard = LR;
  }
}

//the function where calculate perimeter and area of the rectangle
void calculatesPAR(){
  perimeterR = str( 2 * ( float(lR) + float(LR) ) ); 
  areaR = str( float(lR) * float(LR) );
}