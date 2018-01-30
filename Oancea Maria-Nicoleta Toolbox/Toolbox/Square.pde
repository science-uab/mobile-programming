/*
  created by Oancea Maria-Nicoleta
  email: oanceamarianicoleta@gmail.com
  MIT license
*/

String lS = "";
String perimeterS = "";
String areaS = "";

//the function where the interface for the square perimeter and area calculation page is created 
void squarePA(){
  strokeWeight(3);
  stroke(#0000ff);
  fill(#0000ff);
  textAlign(CENTER, TOP);
  textSize(height/20);
  imageMode(CORNER);
  rect(0, 0, width, height/10 );
  fill(#ffffff);
  text("Square", width/2, height/30);
  image(backImg, width/36, height/60, width/6.5, height/15);
  
  imageMode(CENTER);
  image(squareImg, width/2, height/4.8, height/4.7, height/5);  
  
  lS = valueKeyboard;
  if (lS != "" ) calculatesPAS();
  
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
  text (lS, width/7, height/2.72);

  textSize(height/25);
  text("P = ", 20, height/2.2);
  text (perimeterS, width/6.5, height/2.2);
  text("A = ", 20, height/2);
  text (areaS, width/6.5, height/2);
  
}


//the function, where defines actions for the square perimeter and area calculation page
void squarePAClick(){
  if ( mouseX > width/36 && mouseX < width/36+width/6.5 && mouseY > height/60 && mouseY < height/60+height/15 ) {
    page = -2;
    pagePAV = 1;
    pagePA = 0;
    lS = valueKeyboard = perimeterS = areaS = "";
  }

  if ( mouseX > width/8 && mouseX < width/8+width/2 && mouseY > height/2.8 && mouseY < height/2.8+height/20 ) {
    activeKeyboard = true;
  }

}

//the function where calculate perimeter and area of the square
void calculatesPAS(){
  perimeterS = str( 4 * float(lS)  ); 
  areaS = str( pow( float(lS), 2 ) );
}