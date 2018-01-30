/*
  created by Oancea Maria-Nicoleta
  email: oanceamarianicoleta@gmail.com
  MIT license
*/ 

String aPenta = "";
String perimeterPenta = "";
String areaPenta = "";

//the function where the interface for the pentagon perimeter and area calculation page is created
void pentagonPA(){
  strokeWeight(3);
  stroke(#0000ff);
  fill(#0000ff);
  textAlign(CENTER, TOP);
  textSize(height/20);
  imageMode(CORNER);
  rect(0, 0, width, height/10 );
  fill(#ffffff);
  text("Pentagon", width/2, height/30);
  image(backImg, width/36, height/60, width/6.5, height/15);
  
  imageMode(CENTER);
  image(pentagonImg, width/2, height/4.8, height/4.5, height/5);  
  
  aPenta = valueKeyboard;
  if (aPenta != "" ) calculatesPAPenta();
  
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
  text (aPenta, width/7, height/2.72);

  textSize(height/25);
  text("P = ", 20, height/2.2);
  text (perimeterPenta, width/6.5, height/2.2);
  text("A = ", 20, height/2);
  text (areaPenta, width/6.5, height/2);
  
}

//the function, where defines actions for the pentagon perimeter and area calculation page
void pentagonPAClick(){
  if ( mouseX > width/36 && mouseX < width/36+width/6.5 && mouseY > height/60 && mouseY < height/60+height/15 ) {
    page = -2;
    pagePAV = 1;
    pagePA = 0;
    aPenta = valueKeyboard = perimeterPenta = areaPenta = "";
  }

  if ( mouseX > width/8 && mouseX < width/8+width/2 && mouseY > height/2.8 && mouseY < height/2.8+height/20 ) {
    activeKeyboard = true;
  }

}

//the function where calculate perimeter and area of the pentagon
void calculatesPAPenta(){
  perimeterPenta = str( 5 * float(aPenta)  ); 
  areaPenta = str( ( ( sqrt( 25 + 10 * sqrt(5) ) ) / 4 ) * pow( float(aPenta), 2 ) );
}