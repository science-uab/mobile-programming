/*
  created by Oancea Maria-Nicoleta
  email: oanceamarianicoleta@gmail.com
  MIT license
*/ 

String nPyramid = "";
String aPyramid= "";
String hPyramid = "";
String areaPyramid = "";
String volumePyramid = "";

boolean oknPyramid = false;
boolean okaPyramid = false;
boolean okhPyramid = false;

//the function where the interface for the pyramid area and volume calculation page is created
void pyramidAV(){
  strokeWeight(3);
  stroke(#0000ff);
  fill(#0000ff);
  textAlign(CENTER, TOP);
  textSize(height/20);
  imageMode(CORNER);
  rect(0, 0, width, height/10 );
  fill(#ffffff);
  text("Pyramid", width/2, height/30);
  image(backImg, width/36, height/60, width/6.5, height/15);
  
  imageMode(CENTER);
  image(pyramidImg, width/2, height/4.8, width/2.5, height/5);
  
  if (oknPyramid) nPyramid = valueKeyboard;
  if (okaPyramid) aPyramid = valueKeyboard;
  if (okhPyramid) hPyramid = valueKeyboard;
  if (nPyramid != "" && aPyramid != "" && hPyramid != "" ) calculatesAVPyramid();
  
  textSize(height/30);
  textAlign(LEFT, TOP);
  fill(#000000);
  strokeWeight(6);
  stroke(#b3b3b3);
  noFill();
  text("Enter the value:", 20, height/3.2);
  text("n = ", 20, height/2.72);
  if ( mouseX > width/8 && mouseX < width/8+width/2 && mouseY > height/2.8 && mouseY < height/2.8+height/20 ) fill(#d9d9d9);
  else noFill();
  rect(width/8, height/2.8, width/2, height/20, 15);
  fill(#000000);
  text (nPyramid, width/7, height/2.72);
  text("a = ", 20, height/2.35);
  if ( mouseX > width/8 && mouseX < width/8+width/2 && mouseY > height/2.4 && mouseY < height/2.4+height/20 ) fill(#d9d9d9);
  else noFill();
  rect(width/8, height/2.4, width/2, height/20, 15);
  fill(#000000);
  text (aPyramid, width/7, height/2.35);
  text("h = ", 20, height/2.05);
  if ( mouseX > width/8 && mouseX < width/8+width/2 && mouseY > height/2.1 && mouseY < height/2.1+height/20 ) fill(#d9d9d9);
  else noFill();
  rect(width/8, height/2.1, width/2, height/20, 15);
  fill(#000000);
  text (hPyramid, width/7, height/2.05);
  
  textSize(height/25);
  text("A = ", 20, height/1.75);
  text (areaPyramid, width/6.5, height/1.75);
  text("V = ", 20, height/1.6);
  text (volumePyramid, width/6.5, height/1.6);
  
}

//the function, where defines actions for the pyramid area and volume calculation page
void pyramidAVClick(){
  if ( mouseX > width/36 && mouseX < width/36+width/6.5 && mouseY > height/60 && mouseY < height/60+height/15 ) {
    page = -2;
    pagePAV = 2;
    pageAV = 0;
    nPyramid = aPyramid = hPyramid = valueKeyboard = areaPyramid = volumePyramid = "";
  }

  if ( mouseX > width/8 && mouseX < width/8+width/2 && mouseY > height/2.8 && mouseY < height/2.8+height/20 ) {
    activeKeyboard = true;
    oknPyramid = true;
    okaPyramid = false;
    okhPyramid = false;
    valueKeyboard = nPyramid;
  }
  if ( mouseX > width/8 && mouseX < width/8+width/2 && mouseY > height/2.4 && mouseY < height/2.4+height/20 ) {
    activeKeyboard = true;
    okaPyramid = true;
    oknPyramid = false;
    okhPyramid = false;
    valueKeyboard = aPyramid;
  }
  if ( mouseX > width/8 && mouseX < width/8+width/2 && mouseY > height/2.1 && mouseY < height/2.1+height/20 ) {
    activeKeyboard = true;
    okhPyramid = true;
    oknPyramid = false;
    okaPyramid = false;
    valueKeyboard = hPyramid;
  }
}

//the function where calculate area and volume of the pyramid
void calculatesAVPyramid(){
  areaPyramid = str( ( ( (float) 1 / 4 ) * float(nPyramid) * pow( float(aPyramid), 2) * ( cos( PI / float(nPyramid) ) / sin( PI / float(nPyramid) ) ) ) + ( ( (float) 1 / 2 ) * float(nPyramid) *  float(aPyramid) * sqrt ( pow( float(hPyramid), 2) + ( ( (float) 1 / 4 ) *  pow( float(aPyramid), 2) *  pow ( ( cos( PI / float(nPyramid) ) / sin( PI / float(nPyramid) ) ), 2)  ) )  ) ); 
  volumePyramid = str( ( (float) 1 / 3 ) * ( ( (float) 1 / 4 ) * float(nPyramid) * pow( float(aPyramid), 2) * ( cos( PI / float(nPyramid) ) / sin( PI / float(nPyramid) ) ) ) * float(hPyramid) );
}