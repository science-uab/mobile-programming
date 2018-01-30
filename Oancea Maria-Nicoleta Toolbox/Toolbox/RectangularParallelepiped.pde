/*
  created by Oancea Maria-Nicoleta
  email: oanceamarianicoleta@gmail.com
  MIT license
*/ 

String aRP = "";
String bRP= "";
String cRP = "";
String areaRP = "";
String volumeRP = "";

boolean okaRP = false;
boolean okbRP = false;
boolean okcRP = false;

//the function where the interface for the rectangular parallelepiped area and volume calculation page is created
void rectangularParallelepipedAV(){
  strokeWeight(3);
  stroke(#0000ff);
  fill(#0000ff);
  textAlign(CENTER, TOP);
  textSize(height/27);
  imageMode(CORNER);
  rect(0, 0, width, height/10 );
  fill(#ffffff);
  text("Rectangular Parallelepiped", width/1.75, height/30);
  image(backImg, width/36, height/60, width/6.5, height/15);
  
  imageMode(CENTER);
  image(RPImg, width/2, height/4.8, width/2.5, height/5);
  
  if (okaRP) aRP = valueKeyboard;
  if (okbRP) bRP = valueKeyboard;
  if (okcRP) cRP = valueKeyboard;
  if (aRP != "" && bRP != "" && cRP != "" ) calculatesAVRectangularParallelepiped();
  
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
  text (aRP, width/7, height/2.72);
  text("b = ", 20, height/2.35);
  if ( mouseX > width/8 && mouseX < width/8+width/2 && mouseY > height/2.4 && mouseY < height/2.4+height/20 ) fill(#d9d9d9);
  else noFill();
  rect(width/8, height/2.4, width/2, height/20, 15);
  fill(#000000);
  text (bRP, width/7, height/2.35);
  text("c = ", 20, height/2.05);
  if ( mouseX > width/8 && mouseX < width/8+width/2 && mouseY > height/2.1 && mouseY < height/2.1+height/20 ) fill(#d9d9d9);
  else noFill();
  rect(width/8, height/2.1, width/2, height/20, 15);
  fill(#000000);
  text (cRP, width/7, height/2.05);
  
  textSize(height/25);
  text("A = ", 20, height/1.75);
  text (areaRP, width/6.5, height/1.75);
  text("V = ", 20, height/1.6);
  text (volumeRP, width/6.5, height/1.6);
  
}

//the function, where defines actions for the rectangular parallelepiped area and volume calculation page
void rectangularParallelepipedAVClick(){
  if ( mouseX > width/36 && mouseX < width/36+width/6.5 && mouseY > height/60 && mouseY < height/60+height/15 ) {
    page = -2;
    pagePAV = 2;
    pageAV = 0;
    aRP = bRP = cRP = valueKeyboard = areaRP = volumeRP = "";
  }

  if ( mouseX > width/8 && mouseX < width/8+width/2 && mouseY > height/2.8 && mouseY < height/2.8+height/20 ) {
    activeKeyboard = true;
    okaRP = true;
    okbRP = false;
    okcRP = false;
    valueKeyboard = aRP;
  }
  if ( mouseX > width/8 && mouseX < width/8+width/2 && mouseY > height/2.4 && mouseY < height/2.4+height/20 ) {
    activeKeyboard = true;
    okbRP = true;
    okaRP = false;
    okcRP = false;
    valueKeyboard = bRP;
  }
  if ( mouseX > width/8 && mouseX < width/8+width/2 && mouseY > height/2.1 && mouseY < height/2.1+height/20 ) {
    activeKeyboard = true;
    okcRP = true;
    okaRP = false;
    okbRP = false;
    valueKeyboard = cRP;
  }
}

//the function where calculate area and volume of the rectangular parallelepiped
void calculatesAVRectangularParallelepiped(){
  areaRP = str( float(aRP) * float(bRP) * float(cRP) ); 
  volumeRP = str(  2 * ( float(aRP) * float(bRP) + float(aRP) * float(cRP) + float(bRP) * float(cRP) ) );
}