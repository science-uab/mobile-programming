/*
  created by Oancea Maria-Nicoleta
  email: oanceamarianicoleta@gmail.com
  MIT license
*/ 

String nPrism = "";
String aPrism= "";
String hPrism = "";
String areaPrism = "";
String volumePrism = "";

boolean oknPrism = false;
boolean okaPrism = false;
boolean okhPrism = false;

//the function where the interface for the prism area and volume calculation page is created
void prismAV(){
  strokeWeight(3);
  stroke(#0000ff);
  fill(#0000ff);
  textAlign(CENTER, TOP);
  textSize(height/20);
  imageMode(CORNER);
  rect(0, 0, width, height/10 );
  fill(#ffffff);
  text("Prism", width/2, height/30);
  image(backImg, width/36, height/60, width/6.5, height/15);
  
  imageMode(CENTER);
  image(prismImg, width/2, height/4.8, width/2.5, height/5);
  
  if (oknPrism) nPrism = valueKeyboard;
  if (okaPrism) aPrism = valueKeyboard;
  if (okhPrism) hPrism = valueKeyboard;
  if (nPrism != "" && aPrism != "" && hPrism != "" ) calculatesAVPrism();
  
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
  text (nPrism, width/7, height/2.72);
  text("a = ", 20, height/2.35);
  if ( mouseX > width/8 && mouseX < width/8+width/2 && mouseY > height/2.4 && mouseY < height/2.4+height/20 ) fill(#d9d9d9);
  else noFill();
  rect(width/8, height/2.4, width/2, height/20, 15);
  fill(#000000);
  text (aPrism, width/7, height/2.35);
  text("h = ", 20, height/2.05);
  if ( mouseX > width/8 && mouseX < width/8+width/2 && mouseY > height/2.1 && mouseY < height/2.1+height/20 ) fill(#d9d9d9);
  else noFill();
  rect(width/8, height/2.1, width/2, height/20, 15);
  fill(#000000);
  text (hPrism, width/7, height/2.05);
  
  textSize(height/25);
  text("A = ", 20, height/1.75);
  text (areaPrism, width/6.5, height/1.75);
  text("V = ", 20, height/1.6);
  text (volumePrism, width/6.5, height/1.6);
  
}

//the function, where defines actions for the prism area and volume calculation page
void prismAVClick(){
  if ( mouseX > width/36 && mouseX < width/36+width/6.5 && mouseY > height/60 && mouseY < height/60+height/15 ) {
    page = -2;
    pagePAV = 2;
    pageAV = 0;
    nPrism = aPrism = hPrism = valueKeyboard = areaPrism = volumePrism = "";
  }

  if ( mouseX > width/8 && mouseX < width/8+width/2 && mouseY > height/2.8 && mouseY < height/2.8+height/20 ) {
    activeKeyboard = true;
    oknPrism = true;
    okaPrism = false;
    okhPrism = false;
    valueKeyboard = nPrism;
  }
  if ( mouseX > width/8 && mouseX < width/8+width/2 && mouseY > height/2.4 && mouseY < height/2.4+height/20 ) {
    activeKeyboard = true;
    okaPrism = true;
    oknPrism = false;
    okhPrism = false;
    valueKeyboard = aPrism;
  }
  if ( mouseX > width/8 && mouseX < width/8+width/2 && mouseY > height/2.1 && mouseY < height/2.1+height/20 ) {
    activeKeyboard = true;
    okhPrism = true;
    oknPrism = false;
    okaPrism = false;
    valueKeyboard = hPrism;
  }
}

//the function where calculate area and volume of the prism
void calculatesAVPrism(){
  areaPrism = str( 2 * ( ( (float) 1 / 4 ) * float(nPrism) * pow( float(aPrism), 2) * ( cos( PI / float(nPrism) ) / sin( PI / float(nPrism) ) ) ) + ( float(nPrism) *  float(aPrism) * float(hPrism)  ) ); 
  volumePrism = str(  ( ( (float) 1 / 4 ) * float(nPrism) * pow( float(aPrism), 2) * ( cos( PI / float(nPrism) ) / sin( PI / float(nPrism) ) ) ) * float(hPrism) );
}