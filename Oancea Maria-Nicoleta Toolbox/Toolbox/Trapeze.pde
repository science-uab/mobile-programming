/*
  created by Oancea Maria-Nicoleta
  email: oanceamarianicoleta@gmail.com
  MIT license
*/

String aT = "";
String bT= "";
String cT = "";
String dT = "";
String hT = "";
String perimeterT = "";
String areaT = "";

boolean okaT = false;
boolean okbT = false;
boolean okcT = false;
boolean okdT = false;
boolean okhT = false;

float transT = 0;

//the function where the interface for the trapeze perimeter and area calculation page is created 
void trapezePA(){
  strokeWeight(3);
  stroke(#0000ff);
  fill(#0000ff);
  textAlign(CENTER, TOP);
  textSize(height/20);
  imageMode(CORNER);
  rect(0, 0, width, height/10 );
  fill(#ffffff);
  text("Trapeze", width/2, height/30);
  image(backImg, width/36, height/60, width/6.5, height/15);
  
  pushMatrix();
  translate(0, transT);
  
  imageMode(CENTER);
  if (transT == 0) image(trapezeImg, width/2, height/4.8, width/1.5, height/5);
  
  if (okaT) aT = valueKeyboard;
  if (okbT) bT = valueKeyboard;
  if (okcT) cT = valueKeyboard;
  if (okdT) {
    dT = valueKeyboard;
    transT = -height/5;
  }
  else if (!okhT)transT = 0;
  if (okhT) {
    hT = valueKeyboard;
    transT = -height/5;
  }
  else if (!okdT) transT = 0;
  if (aT != "" && bT != "" && cT != "" && dT != "" && hT != "" ) calculatesPAT();
  if (!activeKeyboard) transT = 0;
  
  textSize(height/30);
  textAlign(LEFT, TOP);
  fill(#000000);
  strokeWeight(6);
  stroke(#b3b3b3);
  noFill();
  text("Enter the value:", 20, height/3.2);
  text("a = ", 20, height/2.72);
  if ( mouseX > width/8 && mouseX < width/8+width/2 && mouseY > height/2.8 + transT && mouseY < height/2.8+height/20 + transT ) fill(#d9d9d9);
  else noFill();
  rect(width/8, height/2.8, width/2, height/20, 15);
  fill(#000000);
  text (aT, width/7, height/2.72);
  text("b = ", 20, height/2.35);
  if ( mouseX > width/8 && mouseX < width/8+width/2 && mouseY > height/2.4 + transT && mouseY < height/2.4+height/20 + transT ) fill(#d9d9d9);
  else noFill();
  rect(width/8, height/2.4, width/2, height/20, 15);
  fill(#000000);
  text (bT, width/7, height/2.35);
  text("c = ", 20, height/2.05);
  if ( mouseX > width/8 && mouseX < width/8+width/2 && mouseY > height/2.1 + transT && mouseY < height/2.1+height/20 + transT ) fill(#d9d9d9);
  else noFill();
  rect(width/8, height/2.1, width/2, height/20, 15);
  fill(#000000);
  text (cT, width/7, height/2.05);
  text("d = ", 20, height/1.835);
  if ( mouseX > width/8 && mouseX < width/8+width/2 && mouseY > height/1.87 + transT && mouseY < height/1.87+height/20 + transT ) fill(#d9d9d9);
  else noFill();
  rect(width/8, height/1.87, width/2, height/20, 15);
  fill(#000000);
  text (dT, width/7, height/1.835);
  text("h = ", 20, height/1.65);
  if ( mouseX > width/8 && mouseX < width/8+width/2 && mouseY > height/1.68 + transT && mouseY < height/1.68+height/20 + transT ) fill(#d9d9d9);
  else noFill();
  rect(width/8, height/1.68, width/2, height/20, 15);
  fill(#000000);
  text (hT, width/7, height/1.65);
  
  textSize(height/25);
  text("P = ", 20, height/1.44);
  text (perimeterT, width/6.5, height/1.44);
  text("A = ", 20, height/1.33);
  text (areaT, width/6.5, height/1.33);
  
  popMatrix();
}

//the function, where defines actions for the trapeze perimeter and area calculation page
void trapezePAClick(){
  if ( mouseX > width/36 && mouseX < width/36+width/6.5 && mouseY > height/60 && mouseY < height/60+height/15 ) {
    page = -2;
    pagePAV = 1;
    pagePA = 0;
    aT = bT = cT = dT = hT = valueKeyboard = perimeterT = areaT = "";
    transT = 0;
  }

  if ( mouseX > width/8 && mouseX < width/8+width/2 && mouseY > height/2.8 + transT && mouseY < height/2.8+height/20 + transT ) {
    activeKeyboard = true;
    okaT = true;
    okbT = false;
    okcT = false;
    okdT = false;
    okhT = false;
    valueKeyboard = aT;
  }
  if ( mouseX > width/8 && mouseX < width/8+width/2 && mouseY > height/2.4 + transT && mouseY < height/2.4+height/20 + transT ) {
    activeKeyboard = true;
    okbT = true;
    okaT = false;
    okcT = false;
    okdT = false;
    okhT = false;
    valueKeyboard = bT;
  }
  if ( mouseX > width/8 && mouseX < width/8+width/2 && mouseY > height/2.1 + transT && mouseY < height/2.1+height/20 + transT ) {
    activeKeyboard = true;
    okcT = true;
    okaT = false;
    okbT = false;
    okdT = false;
    okhT = false;
    valueKeyboard = cT;
  }
  if(!activeKeyboard) {
    if ( mouseX > width/8 && mouseX < width/8+width/2 && mouseY > height/1.87 + transT && mouseY < height/1.87+height/20 + transT ) {
      activeKeyboard = true;
      okdT = true;
      okaT = false;
      okbT = false;
      okcT = false;
      okhT = false;
      valueKeyboard = dT;
    }
    if ( mouseX > width/8 && mouseX < width/8+width/2 && mouseY > height/1.68 + transT && mouseY < height/1.68+height/20 + transT ) {
      activeKeyboard = true;
      okhT = true;
      okaT = false;
      okbT = false;
      okcT = false;
      okdT = false;
      valueKeyboard = hT;
    }
  }
}

//the function where calculate perimeter and area of the trapeze
void calculatesPAT(){
  perimeterT = str( float(aT) + float(bT) + float(cT) + float(dT)); 
  areaT = str( ( ( float(aT) + float(cT) ) * float(hT) ) / 2 );
}