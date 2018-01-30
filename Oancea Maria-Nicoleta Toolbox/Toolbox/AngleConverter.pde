/*
  created by Oancea Maria-Nicoleta
  email: oanceamarianicoleta@gmail.com
  MIT license
*/

String angle1s = "";
String angle2s = "";

String unitA1 = "";
String unitA2 = "";

//the function, where the angle converter interface is created
void angleConverter(){
  strokeWeight(3);
  stroke(#0000ff);
  fill(#0000ff);
  textAlign(CENTER, TOP);
  textSize(height/20);
  imageMode(CORNER);
  rect(0, 0, width, height/10 );
  fill(#ffffff);
  text("Angle Converter", width/2, height/30);
  image(backImg, width/36, height/60, width/6.5, height/15);
  
  strokeWeight(6);
  stroke(#b3b3b3);
  fill(#000000);
  noFill();
  
  rect(10, height/7.5, width/2-40, height/20, 15);
  text("=", width/2, height/7.3);
  fill(#d9d9d9);
  rect(width/2+30, height/7.5, width/2-40, height/20, 15);
  
  textAlign(LEFT, TOP);
  textSize(height/35);
  fill(#000000);
  text(angle1s, 20, height/6.8);  
  text(angle2s, width/2+40, height/6.8);  
  textSize(height/25);
  text(unitA1, 20, height/5);  
  text(unitA2, width/2+40, height/5);
  
 if (valueKeyboard.length() <= 15 ) angle1s = valueKeyboard; 
 //the conversion function is called while entering the value if the units of measurement have been selected
 if (unitA1 != "" && unitA2 != "" && angle1s != "" ) convertsAngle();
  
  //creating two lists of units of measure, the first for the units to be converted and a second for the units in which the value will be converted
  textSize(height/35);
  noFill();
  rect(10, height/4, width/2-40, 2*height/20);
  rect(width/2+30, height/4, width/2-40, 2*height/20);
  noStroke();
  if (mouseX > 10 && mouseX < width/2-30 && mouseY > height/4 && mouseY <  height/4+height/20 ) fill(#aaaaaa);
  else fill(#ffffff); 
  rect(10, height/4, width/2-40, height/20);
  fill(#000000);
  text("degrees", 20, height/3.8); 
  if (mouseX > 10 && mouseX < width/2-30 && mouseY > height/4+height/20 && mouseY <  height/4+2*height/20 ) fill(#aaaaaa);
  else fill(#ffffff); 
  rect(10, height/4+height/20, width/2-40, height/20);
  fill(#000000);
  text("radians", 20, height/3.8+height/20); 
  
  if (mouseX > width/2+30 && mouseX < width-10 && mouseY > height/4 && mouseY <  height/4+height/20 ) fill(#aaaaaa);
  else fill(#ffffff); 
  rect(width/2+30, height/4, width/2-40, height/20);
  fill(#000000);
  text("degrees", width/2+40, height/3.8); 
  if (mouseX > width/2+30 && mouseX < width-10 && mouseY > height/4+height/20 && mouseY <  height/4+2*height/20 ) fill(#aaaaaa);
  else fill(#ffffff); 
  rect(width/2+30, height/4+height/20, width/2-40, height/20);
  fill(#000000);
  text("radians", width/2+40, height/3.8+height/20); 
}

//the function, where defines actions on the angle converter page
void angleConverterClick(){
  //if touch the back button created in the application returns to the previous page
  if ( mouseX > width/36 && mouseX < width/36+width/6.5 && mouseY > height/60 && mouseY < height/60+height/15 ) {
    page = 7;
    activeKeyboard = false;
    unitA1 = unitA2 = angle1s = angle2s = valueKeyboard = "";
  }
  
  //when the input for entering value is pressed, the keyboard is displayed
  if ( mouseX > 10 && mouseX < width/2-30 && mouseY > height/7.5 && mouseY < height/7.5+height/20 ) activeKeyboard = true;
  
  //when selecting a unit of measurement it is stored in the corresponding variable
  if(!activeKeyboard) {
    if (mouseX > 10 && mouseX < width/2-30 && mouseY > height/4 && mouseY <  height/4+height/20 ) unitA1 = "degrees";
    if (mouseX > 10 && mouseX < width/2-30 && mouseY > height/4+height/20 && mouseY <  height/4+2*height/20 ) unitA1 = "radians";
    
    if (mouseX > width/2+30 && mouseX < width-10 && mouseY > height/4 && mouseY <  height/4+height/20 ) unitA2 = "degrees";
    if (mouseX > width/2+30 && mouseX < width-10 && mouseY > height/4+height/20 && mouseY <  height/4+2*height/20 ) unitA2 = "radians";
  }
}

//the function in which an angle is converted from unit1 to unit2
void convertsAngle(){
  //check all possible cases, and depending on the situation, perform the appropriate conversion
  if ( unitA1 == "degrees" && unitA2 == "degrees" ) angle2s = angle1s;
  if ( unitA1 == "degrees" && unitA2 == "radians" ) angle2s = str (radians( float(angle1s) ) );
  if ( unitA1 == "radians" && unitA2 == "degrees" ) angle2s = str (degrees( float(angle1s) ) );
  if ( unitA1 == "radians" && unitA2 == "radians" ) angle2s = angle1s;
}