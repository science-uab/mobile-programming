/*
  created by Oancea Maria-Nicoleta
  email: oanceamarianicoleta@gmail.com
  MIT license
*/

String temperature1S = "";
String temperature2S = "";

String unitTemp1 = "";
String unitTemp2 = "";

String negativeValue = "";
String msgNeg = "";
String btnMSG = "NEGATIVE";

//the function, where the temperature converter interface is created
void temperatureConverter(){
  strokeWeight(3);
  stroke(#0000ff);
  fill(#0000ff);
  textAlign(CENTER, TOP);
  textSize(height/22.5);
  imageMode(CORNER);
  rect(0, 0, width, height/10 );
  fill(#ffffff);
  text("Temperature Converter", width/2+60, height/30);
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
  text(temperature1S, 20, height/6.8);  
  text(temperature2S, width/2+40, height/6.8);  
  textSize(height/25);
  text(unitTemp1, 20, height/5);  
  text(unitTemp2, width/2+40, height/5);

 if (valueKeyboard.length() <= 15 ) temperature1S = negativeValue + valueKeyboard; 
 if (unitTemp1 != "" && unitTemp2 != "" && temperature1S != "" ) convertsTemperature();
  
  textSize(height/35);
  noFill();
  rect(10, height/4, width/2-40, 3*height/20);
  rect(width/2+30, height/4, width/2-40, 3*height/20);
  noStroke();
  if (mouseX > 10 && mouseX < width/2-30 && mouseY > height/4 && mouseY <  height/4+height/20 ) fill(#aaaaaa);
  else fill(#ffffff); 
  rect(10, height/4, width/2-40, height/20);
  fill(#000000);
  text("Celsius (°C)", 20, height/3.8); 
  if (mouseX > 10 && mouseX < width/2-30 && mouseY > height/4+height/20 && mouseY <  height/4+2*height/20 ) fill(#aaaaaa);
  else fill(#ffffff); 
  rect(10, height/4+height/20, width/2-40, height/20);
  fill(#000000);
  text("Fahrenheit (°F)", 20, height/3.8+height/20); 
  if (mouseX > 10 && mouseX < width/2-30 && mouseY > height/4+2*height/20 && mouseY <  height/4+3*height/20 ) fill(#aaaaaa);
  else fill(#ffffff); 
  rect(10, height/4+2*height/20, width/2-40, height/20);
  fill(#000000);
  text("kelvin (K)", 20, height/3.8+2*height/20); 
  
  if (mouseX > width/2+30 && mouseX < width-10 && mouseY > height/4 && mouseY <  height/4+height/20 ) fill(#aaaaaa);
  else fill(#ffffff); 
  rect(width/2+30, height/4, width/2-40, height/20);
  fill(#000000);
  text("Celsius (°C)", width/2+40, height/3.8); 
  if (mouseX > width/2+30 && mouseX < width-10 && mouseY > height/4+height/20 && mouseY <  height/4+2*height/20 ) fill(#aaaaaa);
  else fill(#ffffff); 
  rect(width/2+30, height/4+height/20, width/2-40, height/20);
  fill(#000000);
  text("Fahrenheit (°F)", width/2+40, height/3.8+height/20); 
  if (mouseX > width/2+30 && mouseX < width-10 && mouseY > height/4+2*height/20 && mouseY <  height/4+3*height/20 ) fill(#aaaaaa);
  else fill(#ffffff); 
  rect(width/2+30, height/4+2*height/20, width/2-40, height/20);
  fill(#000000);
  text("kelvin (K)", width/2+40, height/3.8+2*height/20); 
  
  strokeWeight(6);
  stroke(#b3b3b3);
  if (mouseX > 10 && mouseX < width/2-30 && mouseY > height/2.3 && mouseY <  height/2.3+height/15 ) fill(#d9d9d9);
  else fill(#ffffff); 
  rect(10, height/2.3, width/2-40, height/15, 15);
  fill(#000000);
  textAlign(CENTER, TOP);
  textSize(height/30);
  fill(#000000);
  text(btnMSG, width/4-10, height/2.2);  
  textAlign(LEFT, TOP);
  textSize(height/35);
  text(msgNeg, width/2-10, height/2.2);  
}

//the function, where defines actions on the temperature converter page
void temperatureConverterClick(){
  if ( mouseX > width/36 && mouseX < width/36+width/6.5 && mouseY > height/60 && mouseY < height/60+height/15 ) {
    page = 7;
    activeKeyboard = false;
    unitTemp1 = unitTemp2 = temperature1S = temperature2S = valueKeyboard = negativeValue = msgNeg = "";
    btnMSG = "NEGATIVE";
  }

  if ( mouseX > 10 && mouseX < width/2-30 && mouseY > height/7 && mouseY < height/7+height/12 ) activeKeyboard = true;
  
  if(!activeKeyboard) {
    if (mouseX > 10 && mouseX < width/2-30 && mouseY > height/4 && mouseY <  height/4+height/20 ) unitTemp1 = "Celsius (°C)";
    if (mouseX > 10 && mouseX < width/2-30 && mouseY > height/4+height/20 && mouseY <  height/4+2*height/20 ) unitTemp1 = "Fahrenheit (°F)";
    if (mouseX > 10 && mouseX < width/2-30 && mouseY > height/4+2*height/20 && mouseY <  height/4+3*height/20 ) unitTemp1 = "kelvin (K)";
    
    if (mouseX > width/2+30 && mouseX < width-10 && mouseY > height/4 && mouseY <  height/4+height/20 ) unitTemp2 = "Celsius (°C)";
    if (mouseX > width/2+30 && mouseX < width-10 && mouseY > height/4+height/20 && mouseY <  height/4+2*height/20 ) unitTemp2 = "Fahrenheit (°F)";
    if (mouseX > width/2+30 && mouseX < width-10 && mouseY > height/4+2*height/20 && mouseY <  height/4+3*height/20 ) unitTemp2 = "kelvin (K)";
  }
  if (mouseX > 10 && mouseX < width/2-30 && mouseY > height/2.3 && mouseY <  height/2.3+height/15 ) {
    if (negativeValue == "") {
      negativeValue = "-";
      msgNeg = "Negative value is set!";
      btnMSG = "POSITIVE";
    }
    else {
      negativeValue = msgNeg = "";
      btnMSG = "NEGATIVE";
    }
  }
  
}

//the function in which an angle is converted from unit1 to unit2
void convertsTemperature(){
  if ( unitTemp1 == "Celsius (°C)" && unitTemp2 == "Celsius (°C)" ) temperature2S = temperature1S;
  if ( unitTemp1 == "Celsius (°C)" && unitTemp2 == "Fahrenheit (°F)" ) temperature2S = str( float(temperature1S) * 1.8 + 32 );
  if ( unitTemp1 == "Celsius (°C)" && unitTemp2 == "kelvin (K)" ) temperature2S = str( float(temperature1S) + 273.15 );
  
  if ( unitTemp1 == "Fahrenheit (°F)" && unitTemp2 == "Celsius (°C)" ) temperature2S = str( ( float(temperature1S) - 32 ) / 1.8 );
  if ( unitTemp1 == "Fahrenheit (°F)" && unitTemp2 == "Fahrenheit (°F)" ) temperature2S = temperature1S;
  if ( unitTemp1 == "Fahrenheit (°F)" && unitTemp2 == "kelvin (K)" ) temperature2S = str( ( float(temperature1S) + 459.67 ) * 5 / 9 );
  
  if ( unitTemp1 == "kelvin (K)" && unitTemp2 == "Celsius (°C)" ) temperature2S = str( float(temperature1S) - 273.15 );
  if ( unitTemp1 == "kelvin (K)" && unitTemp2 == "Fahrenheit (°F)" ) temperature2S = str( ( float(temperature1S) * 9 / 5 ) - 459.67 );
  if ( unitTemp1 == "kelvin (K)" && unitTemp2 == "kelvin (K)" ) temperature2S = temperature1S;
  
}