/*
  created by Oancea Maria-Nicoleta
  email: oanceamarianicoleta@gmail.com
  MIT license
*/

String aTr = "";
String bTr= "";
String cTr = "";
String perimeterTr = "";
String areaTr = "";

boolean okaTr = false;
boolean okbTr = false;
boolean okcTr = false;

//the function where the interface for the triangle perimeter and area calculation page is created 
void trianglePA(){
  strokeWeight(3);
  stroke(#0000ff);
  fill(#0000ff);
  textAlign(CENTER, TOP);
  textSize(height/20);
  imageMode(CORNER);
  rect(0, 0, width, height/10 );
  fill(#ffffff);
  text("Triangle", width/2, height/30);
  image(backImg, width/36, height/60, width/6.5, height/15);
  
  imageMode(CENTER);
  image(triangleImg, width/2, height/4.8, width/1.5, height/5);
  
  if (okaTr) aTr = valueKeyboard;
  if (okbTr) bTr = valueKeyboard;
  if (okcTr) cTr = valueKeyboard;
  if (aTr != "" && bTr != "" && cTr != "" ) calculatesPATr();
  
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
  text (aTr, width/7, height/2.72);
  text("b = ", 20, height/2.35);
  if ( mouseX > width/8 && mouseX < width/8+width/2 && mouseY > height/2.4 && mouseY < height/2.4+height/20 ) fill(#d9d9d9);
  else noFill();
  rect(width/8, height/2.4, width/2, height/20, 15);
  fill(#000000);
  text (bTr, width/7, height/2.35);
  text("c = ", 20, height/2.05);
  if ( mouseX > width/8 && mouseX < width/8+width/2 && mouseY > height/2.1 && mouseY < height/2.1+height/20 ) fill(#d9d9d9);
  else noFill();
  rect(width/8, height/2.1, width/2, height/20, 15);
  fill(#000000);
  text (cTr, width/7, height/2.05);
  
  textSize(height/25);
  text("P = ", 20, height/1.75);
  text (perimeterTr, width/6.5, height/1.75);
  text("A = ", 20, height/1.6);
  text (areaTr, width/6.5, height/1.6);
  
}

//the function, where defines actions for the triangle perimeter and area calculation page
void trianglePAClick(){
  if ( mouseX > width/36 && mouseX < width/36+width/6.5 && mouseY > height/60 && mouseY < height/60+height/15 ) {
    page = -2;
    pagePAV = 1;
    pagePA = 0;
    aTr = bTr = cTr = valueKeyboard = perimeterTr = areaTr = "";
  }

  if ( mouseX > width/8 && mouseX < width/8+width/2 && mouseY > height/2.8 && mouseY < height/2.8+height/20 ) {
    activeKeyboard = true;
    okaTr = true;
    okbTr = false;
    okcTr = false;
    valueKeyboard = aTr;
  }
  if ( mouseX > width/8 && mouseX < width/8+width/2 && mouseY > height/2.4 && mouseY < height/2.4+height/20 ) {
    activeKeyboard = true;
    okbTr = true;
    okaTr = false;
    okcTr = false;
    valueKeyboard = bTr;
  }
  if ( mouseX > width/8 && mouseX < width/8+width/2 && mouseY > height/2.1 && mouseY < height/2.1+height/20 ) {
    activeKeyboard = true;
    okcTr = true;
    okaTr = false;
    okbTr = false;
    valueKeyboard = cTr;
  }
}

//the function where calculate perimeter and area of the triangle
void calculatesPATr(){
  perimeterTr = str( float(aTr) + float(bTr) + float(cTr) ); 
  float p = ( float(aTr) + float(bTr) + float(cTr) ) / 2;
  areaTr = str( sqrt( p * ( p - float(aTr) ) * ( p - float(bTr) ) * ( p - float(cTr) ) ) );
}