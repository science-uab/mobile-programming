/*
  created by Oancea Maria-Nicoleta
  email: oanceamarianicoleta@gmail.com
  MIT license
*/

String rC = "";
String perimeterC = "";
String areaC = ""; 

//the function where the interface for the circle perimeter and area calculation page is created 
void circlePA(){
  strokeWeight(3);
  stroke(#0000ff);
  fill(#0000ff);
  textAlign(CENTER, TOP);
  textSize(height/20);
  imageMode(CORNER);
  rect(0, 0, width, height/10 );
  fill(#ffffff);
  text("Circle", width/2, height/30);
  image(backImg, width/36, height/60, width/6.5, height/15);
  
  imageMode(CENTER);
  image(circleImg, width/2, height/4.8, height/5, height/5);  
  
  rC = valueKeyboard;
  if (rC != "" ) calculatesPAC();
  
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
  text (rC, width/7, height/2.72);

  textSize(height/25);
  text("C = ", 20, height/2.2);
  text (perimeterC, width/6.5, height/2.2);
  text("A = ", 20, height/2);
  text (areaC, width/6.5, height/2);
  
}

//the function, where defines actions for the circle perimeter and area calculation page
void circlePAClick(){
  if ( mouseX > width/36 && mouseX < width/36+width/6.5 && mouseY > height/60 && mouseY < height/60+height/15 ) {
    page = -2;
    pagePAV = 1;
    pagePA = 0;
    rC = valueKeyboard = perimeterC = areaC = "";
  }

  if ( mouseX > width/8 && mouseX < width/8+width/2 && mouseY > height/2.8 && mouseY < height/2.8+height/20 ) {
    activeKeyboard = true;
  }

}

//the function where calculate perimeter and area of the circle
void calculatesPAC(){
  perimeterC = str( 2 * PI * float(rC)  ); 
  areaC = str( PI * pow( float(rC), 2 ) );
}