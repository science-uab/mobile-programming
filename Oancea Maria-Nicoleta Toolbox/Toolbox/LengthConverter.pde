/*
  created by Oancea Maria-Nicoleta
  email: oanceamarianicoleta@gmail.com
  MIT license
*/ 

String length1S = "";
String length2S = "";

String unitL1 = "";
String unitL2 = "";

//the function, where the length converter interface is created
void lengthConverter(){
  strokeWeight(3);
  stroke(#0000ff);
  fill(#0000ff);
  textAlign(CENTER, TOP);
  textSize(height/20);
  imageMode(CORNER);
  rect(0, 0, width, height/10 );
  fill(#ffffff);
  text("Length Converter", width/2+30, height/30);
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
  text(length1S, 20, height/6.8);  
  text(length2S, width/2+40, height/6.8);  
  textSize(height/30);
  text(unitL1, 20, height/5);  
  text(unitL2, width/2+40, height/5);

 if (valueKeyboard.length() <= 15 ) length1S = valueKeyboard; 
 if (unitL1 != "" && unitL2 != "" && length1S != "" ) convertsLength();
  
  textSize(height/35);
  noFill();
  rect(10, height/4, width/2-40, 10*height/20);
  rect(width/2+30, height/4, width/2-40, 10*height/20);
  noStroke();
  if (mouseX > 10 && mouseX < width/2-30 && mouseY > height/4 && mouseY <  height/4+height/20 ) fill(#aaaaaa);
  else fill(#ffffff); 
  rect(10, height/4, width/2-40, height/20);
  fill(#000000);
  text("millimeter (mm)", 20, height/3.8); 
  if (mouseX > 10 && mouseX < width/2-30 && mouseY > height/4+height/20 && mouseY <  height/4+2*height/20 ) fill(#aaaaaa);
  else fill(#ffffff); 
  rect(10, height/4+height/20, width/2-40, height/20);
  fill(#000000);
  text("centimeter (cm)", 20, height/3.8+height/20); 
  if (mouseX > 10 && mouseX < width/2-30 && mouseY > height/4+2*height/20 && mouseY <  height/4+3*height/20 ) fill(#aaaaaa);
  else fill(#ffffff); 
  rect(10, height/4+2*height/20, width/2-40, height/20);
  fill(#000000);
  text("inch (in)", 20, height/3.8+2*height/20); 
  if (mouseX > 10 && mouseX < width/2-30 && mouseY > height/4+3*height/20 && mouseY <  height/4+4*height/20 ) fill(#aaaaaa);
  else fill(#ffffff); 
  rect(10, height/4+3*height/20, width/2-40, height/20);
  fill(#000000);
  text("decimeter (dm)", 20, height/3.8+3*height/20); 
  if (mouseX > 10 && mouseX < width/2-30 && mouseY > height/4+4*height/20 && mouseY <  height/4+5*height/20 ) fill(#aaaaaa);
  else fill(#ffffff); 
  rect(10, height/4+4*height/20, width/2-40, height/20);
  fill(#000000);
  text("foot (ft)", 20, height/3.8+4*height/20); 
  if (mouseX > 10 && mouseX < width/2-30 && mouseY > height/4+5*height/20 && mouseY <  height/4+6*height/20 ) fill(#aaaaaa);
  else fill(#ffffff); 
  rect(10, height/4+5*height/20, width/2-40, height/20);
  fill(#000000);
  text("meter (m)", 20, height/3.8+5*height/20); 
  if (mouseX > 10 && mouseX < width/2-30 && mouseY > height/4+6*height/20 && mouseY <  height/4+7*height/20 ) fill(#aaaaaa);
  else fill(#ffffff); 
  rect(10, height/4+6*height/20, width/2-40, height/20);
  fill(#000000);
  text("decameter (dam)", 20, height/3.8+6*height/20); 
  if (mouseX > 10 && mouseX < width/2-30 && mouseY > height/4+7*height/20 && mouseY <  height/4+8*height/20 ) fill(#aaaaaa);
  else fill(#ffffff); 
  rect(10, height/4+7*height/20, width/2-40, height/20);
  fill(#000000);
  text("hectometer (hm)", 20, height/3.8+7*height/20); 
  if (mouseX > 10 && mouseX < width/2-30 && mouseY > height/4+8*height/20 && mouseY <  height/4+9*height/20 ) fill(#aaaaaa);
  else fill(#ffffff); 
  rect(10, height/4+8*height/20, width/2-40, height/20);
  fill(#000000);
  text("kilometer (km)", 20, height/3.8+8*height/20); 
  if (mouseX > 10 && mouseX < width/2-30 && mouseY > height/4+9*height/20 && mouseY <  height/4+10*height/20 ) fill(#aaaaaa);
  else fill(#ffffff); 
  rect(10, height/4+9*height/20, width/2-40, height/20);
  fill(#000000);
  text("mile (mi)", 20, height/3.8+9*height/20); 
  
  if (mouseX > width/2+30 && mouseX < width-10 && mouseY > height/4 && mouseY <  height/4+height/20 ) fill(#aaaaaa);
  else fill(#ffffff); 
  rect(width/2+30, height/4, width/2-40, height/20);
  fill(#000000);
  text("millimeter (mm)", width/2+40, height/3.8); 
  if (mouseX > width/2+30 && mouseX < width-10 && mouseY > height/4+height/20 && mouseY <  height/4+2*height/20 ) fill(#aaaaaa);
  else fill(#ffffff); 
  rect(width/2+30, height/4+height/20, width/2-40, height/20);
  fill(#000000);
  text("centimeter (cm)", width/2+40, height/3.8+height/20); 
  if (mouseX > width/2+30 && mouseX < width-10 && mouseY > height/4+2*height/20 && mouseY <  height/4+3*height/20 ) fill(#aaaaaa);
  else fill(#ffffff); 
  rect(width/2+30, height/4+2*height/20, width/2-40, height/20);
  fill(#000000);
  text("inch (in)", width/2+40, height/3.8+2*height/20); 
  if (mouseX > width/2+30 && mouseX < width-10 && mouseY > height/4+3*height/20 && mouseY <  height/4+4*height/20 ) fill(#aaaaaa);
  else fill(#ffffff); 
  rect(width/2+30, height/4+3*height/20, width/2-40, height/20);
  fill(#000000);
  text("decimeter (dm)", width/2+40, height/3.8+3*height/20); 
  if (mouseX > width/2+30 && mouseX < width-10 && mouseY > height/4+4*height/20 && mouseY <  height/4+5*height/20 ) fill(#aaaaaa);
  else fill(#ffffff); 
  rect(width/2+30, height/4+4*height/20, width/2-40, height/20);
  fill(#000000);
  text("foot (ft)", width/2+40, height/3.8+4*height/20); 
  if (mouseX > width/2+30 && mouseX < width-10 && mouseY > height/4+5*height/20 && mouseY <  height/4+6*height/20 ) fill(#aaaaaa);
  else fill(#ffffff); 
  rect(width/2+30, height/4+5*height/20, width/2-40, height/20);
  fill(#000000);
  text("meter (m)", width/2+40, height/3.8+5*height/20); 
  if (mouseX > width/2+30 && mouseX < width-10 && mouseY > height/4+6*height/20 && mouseY <  height/4+7*height/20 ) fill(#aaaaaa);
  else fill(#ffffff); 
  rect(width/2+30, height/4+6*height/20, width/2-40, height/20);
  fill(#000000);
  text("decameter (dam)", width/2+40, height/3.8+6*height/20); 
  if (mouseX > width/2+30 && mouseX < width-10 && mouseY > height/4+7*height/20 && mouseY <  height/4+8*height/20 ) fill(#aaaaaa);
  else fill(#ffffff); 
  rect(width/2+30, height/4+7*height/20, width/2-40, height/20);
  fill(#000000);
  text("hectometer (hm)", width/2+40, height/3.8+7*height/20); 
  if (mouseX > width/2+30 && mouseX < width-10 && mouseY > height/4+8*height/20 && mouseY <  height/4+9*height/20 ) fill(#aaaaaa);
  else fill(#ffffff); 
  rect(width/2+30, height/4+8*height/20, width/2-40, height/20);
  fill(#000000);
  text("kilometer (km)", width/2+40, height/3.8+8*height/20); 
  if (mouseX > width/2+30 && mouseX < width-10 && mouseY > height/4+9*height/20 && mouseY <  height/4+10*height/20 ) fill(#aaaaaa);
  else fill(#ffffff); 
  rect(width/2+30, height/4+9*height/20, width/2-40, height/20);
  fill(#000000);
  text("mile (mi)", width/2+40, height/3.8+9*height/20); 
}

//the function, where defines actions on the length converter page
void lengthConverterClick(){
  if ( mouseX > width/36 && mouseX < width/36+width/6.5 && mouseY > height/60 && mouseY < height/60+height/15 ) {
    page = 7;
    activeKeyboard = false;
    unitL1 = unitL2 = length1S = length2S = valueKeyboard = "";
  }

  if ( mouseX > 10 && mouseX < width/2-30 && mouseY > height/7 && mouseY < height/7+height/12 ) activeKeyboard = true;
  
  if(!activeKeyboard) {
    if (mouseX > 10 && mouseX < width/2-30 && mouseY > height/4 && mouseY <  height/4+height/20 ) unitL1 = "millimeter (mm)";
    if (mouseX > 10 && mouseX < width/2-30 && mouseY > height/4+height/20 && mouseY <  height/4+2*height/20 ) unitL1 = "centimeter (cm)";
    if (mouseX > 10 && mouseX < width/2-30 && mouseY > height/4+2*height/20 && mouseY <  height/4+3*height/20 ) unitL1 = "inch (in)";
    if (mouseX > 10 && mouseX < width/2-30 && mouseY > height/4+3*height/20 && mouseY <  height/4+4*height/20 ) unitL1 = "decimeter (dm)";
    if (mouseX > 10 && mouseX < width/2-30 && mouseY > height/4+4*height/20 && mouseY <  height/4+5*height/20 ) unitL1 = "foot (ft)";
    if (mouseX > 10 && mouseX < width/2-30 && mouseY > height/4+5*height/20 && mouseY <  height/4+6*height/20 ) unitL1 = "meter (m)";
    if (mouseX > 10 && mouseX < width/2-30 && mouseY > height/4+6*height/20 && mouseY <  height/4+7*height/20 ) unitL1 = "decameter (dam)";
    if (mouseX > 10 && mouseX < width/2-30 && mouseY > height/4+7*height/20 && mouseY <  height/4+8*height/20 ) unitL1 = "hectometer (hm)";
    if (mouseX > 10 && mouseX < width/2-30 && mouseY > height/4+8*height/20 && mouseY <  height/4+9*height/20 ) unitL1 = "kilometer (km)"; 
    if (mouseX > 10 && mouseX < width/2-30 && mouseY > height/4+9*height/20 && mouseY <  height/4+10*height/20 ) unitL1 = "mile (mi)"; 
    
    if (mouseX > width/2+30 && mouseX < width-10 && mouseY > height/4 && mouseY <  height/4+height/20 ) unitL2 = "millimeter (mm)";
    if (mouseX > width/2+30 && mouseX < width-10 && mouseY > height/4+height/20 && mouseY <  height/4+2*height/20 ) unitL2 = "centimeter (cm)";
    if (mouseX > width/2+30 && mouseX < width-10 && mouseY > height/4+2*height/20 && mouseY <  height/4+3*height/20 ) unitL2 = "inch (in)";
    if (mouseX > width/2+30 && mouseX < width-10 && mouseY > height/4+3*height/20 && mouseY <  height/4+4*height/20 ) unitL2 = "decimeter (dm)";
    if (mouseX > width/2+30 && mouseX < width-10 && mouseY > height/4+4*height/20 && mouseY <  height/4+5*height/20 ) unitL2 = "foot (ft)";
    if (mouseX > width/2+30 && mouseX < width-10 && mouseY > height/4+5*height/20 && mouseY <  height/4+6*height/20 ) unitL2 = "meter (m)";
    if (mouseX > width/2+30 && mouseX < width-10 && mouseY > height/4+6*height/20 && mouseY <  height/4+7*height/20 ) unitL2 = "decameter (dam)";
    if (mouseX > width/2+30 && mouseX < width-10 && mouseY > height/4+7*height/20 && mouseY <  height/4+8*height/20 ) unitL2 = "hectometer (hm)";
    if (mouseX > width/2+30 && mouseX < width-10 && mouseY > height/4+8*height/20 && mouseY <  height/4+9*height/20 ) unitL2 = "kilometer (km)"; 
    if (mouseX > width/2+30 && mouseX < width-10 && mouseY > height/4+9*height/20 && mouseY <  height/4+10*height/20 ) unitL2 = "mile (mi)"; 
  }
}

//the function in which an length is converted from unit1 to unit2
void convertsLength(){ 
  if ( unitL1 == "millimeter (mm)" && unitL2 == "millimeter (mm)" ) length2S = length1S;
  if ( unitL1 == "millimeter (mm)" && unitL2 == "centimeter (cm)" ) length2S = str( float(length1S) * 0.1 );
  if ( unitL1 == "millimeter (mm)" && unitL2 == "inch (in)" ) length2S = str( float(length1S) * 0.0393700787 );
  if ( unitL1 == "millimeter (mm)" && unitL2 == "decimeter (dm)" ) length2S = str( float(length1S) * 0.001 );
  if ( unitL1 == "millimeter (mm)" && unitL2 == "foot (ft)" ) length2S = str( float(length1S) * 0.0032808399 );
  if ( unitL1 == "millimeter (mm)" && unitL2 == "meter (m)" ) length2S = str( float(length1S) * 1.0 * pow(10, -3) );
  if ( unitL1 == "millimeter (mm)" && unitL2 == "decameter (dam)" ) length2S = str( float(length1S) * 1.0 * pow(10, -4) );
  if ( unitL1 == "millimeter (mm)" && unitL2 == "hectometer (hm)" ) length2S = str( float(length1S) * 1.0 * pow(10, -5) ); 
  if ( unitL1 == "millimeter (mm)" && unitL2 == "kilometer (km)" ) length2S = str( float(length1S) * 1.0 * pow(10, -6) );
  if ( unitL1 == "millimeter (mm)" && unitL2 == "mile (mi)" ) length2S = str( float(length1S) * 6.21371192  * pow(10, -7) );
  
  if ( unitL1 == "centimeter (cm)" && unitL2 == "millimeter (mm)" ) length2S = str( float(length1S) * 10 );
  if ( unitL1 == "centimeter (cm)" && unitL2 == "centimeter (cm)" ) length2S = length1S;
  if ( unitL1 == "centimeter (cm)" && unitL2 == "inch (in)" ) length2S = str( float(length1S) * 0.393700787 );
  if ( unitL1 == "centimeter (cm)" && unitL2 == "decimeter (dm)" ) length2S = str( float(length1S) * 0.1 );
  if ( unitL1 == "centimeter (cm)" && unitL2 == "foot (ft)" ) length2S = str( float(length1S) * 0.032808399 );
  if ( unitL1 == "centimeter (cm)" && unitL2 == "meter (m)" ) length2S = str( float(length1S) * 1.0 * pow(10, -2) );
  if ( unitL1 == "centimeter (cm)" && unitL2 == "decameter (dam)" ) length2S = str( float(length1S) * 1.0 * pow(10, -3) );
  if ( unitL1 == "centimeter (cm)" && unitL2 == "hectometer (hm)" ) length2S = str( float(length1S) * 1.0 * pow(10, -4) ); 
  if ( unitL1 == "centimeter (cm)" && unitL2 == "kilometer (km)" ) length2S = str( float(length1S) * 1.0 * pow(10, -5) );
  if ( unitL1 == "centimeter (cm)" && unitL2 == "mile (mi)" ) length2S = str( float(length1S) * 6.21371192 * pow(10, -6) );
  
  if ( unitL1 == "inch (in)" && unitL2 == "millimeter (mm)" ) length2S = str( float(length1S) * 25.4 );
  if ( unitL1 == "inch (in)" && unitL2 == "centimeter (cm)" ) length2S = str( float(length1S) * 2.54 );
  if ( unitL1 == "inch (in)" && unitL2 == "inch (in)" ) length2S = length1S;
  if ( unitL1 == "inch (in)" && unitL2 == "decimeter (dm)" ) length2S = str( float(length1S) * 0.254 );
  if ( unitL1 == "inch (in)" && unitL2 == "foot (ft)" ) length2S = str( float(length1S) * 0.0833333333 );
  if ( unitL1 == "inch (in)" && unitL2 == "meter (m)" ) length2S = str( float(length1S) * 0.0254 );
  if ( unitL1 == "inch (in)" && unitL2 == "decameter (dam)" ) length2S = str( float(length1S) * 0.00254 );
  if ( unitL1 == "inch (in)" && unitL2 == "hectometer (hm)" ) length2S = str( float(length1S) * 2.54 * pow(10, -4) ); 
  if ( unitL1 == "inch (in)" && unitL2 == "kilometer (km)" ) length2S = str( float(length1S) * 2.54 * pow(10, -5) );
  if ( unitL1 == "inch (in)" && unitL2 == "mile (mi)" ) length2S = str( float(length1S) * 1.57828283 * pow(10, -5) );
  
  if ( unitL1 == "decimeter (dm)" && unitL2 == "millimeter (mm)" ) length2S = str( float(length1S) * 100 );
  if ( unitL1 == "decimeter (dm)" && unitL2 == "centimeter (cm)" ) length2S = str( float(length1S) * 10 );
  if ( unitL1 == "decimeter (dm)" && unitL2 == "inch (in)" ) length2S = str( float(length1S) * 3.93700787 );
  if ( unitL1 == "decimeter (dm)" && unitL2 == "decimeter (dm)" ) length2S = length1S;
  if ( unitL1 == "decimeter (dm)" && unitL2 == "foot (ft)" ) length2S = str( float(length1S) * 0.32808399  );
  if ( unitL1 == "decimeter (dm)" && unitL2 == "meter (m)" ) length2S = str( float(length1S) * 0.1 );
  if ( unitL1 == "decimeter (dm)" && unitL2 == "decameter (dam)" ) length2S = str( float(length1S) * 0.001 );
  if ( unitL1 == "decimeter (dm)" && unitL2 == "hectometer (hm)" ) length2S = str( float(length1S) * 1.0 * pow(10, -3) ); 
  if ( unitL1 == "decimeter (dm)" && unitL2 == "kilometer (km)" ) length2S = str( float(length1S) * 1.0 * pow(10, -4) );
  if ( unitL1 == "decimeter (dm)" && unitL2 == "mile (mi)" ) length2S = str( float(length1S) * 6.21371192 * pow(10, -5) );
  
  if ( unitL1 == "foot (ft)" && unitL2 == "millimeter (mm)" ) length2S = str( float(length1S) * 304.8 );
  if ( unitL1 == "foot (ft)" && unitL2 == "centimeter (cm)" ) length2S = str( float(length1S) * 30.48 );
  if ( unitL1 == "foot (ft)" && unitL2 == "inch (in)" ) length2S = str( float(length1S) * 12 );
  if ( unitL1 == "foot (ft)" && unitL2 == "decimeter (dm)" ) length2S = str( float(length1S) * 3.048 );
  if ( unitL1 == "foot (ft)" && unitL2 == "foot (ft)" ) length2S = length1S;
  if ( unitL1 == "foot (ft)" && unitL2 == "meter (m)" ) length2S = str( float(length1S) * 0.3048 );
  if ( unitL1 == "foot (ft)" && unitL2 == "decameter (dam)" ) length2S = str( float(length1S) *0.03048 );
  if ( unitL1 == "foot (ft)" && unitL2 == "hectometer (hm)" ) length2S = str( float(length1S) * 3.048 * pow(10, -3) ); 
  if ( unitL1 == "foot (ft)" && unitL2 == "kilometer (km)" ) length2S = str( float(length1S) * 3.048 * 1.0 * pow(10, -4) );
  if ( unitL1 == "foot (ft)" && unitL2 == "mile (mi)" ) length2S = str( float(length1S) * 0.000189393939 );
  
  if ( unitL1 == "meter (m)" && unitL2 == "millimeter (mm)" ) length2S = str( float(length1S) * 1000 );
  if ( unitL1 == "meter (m)" && unitL2 == "centimeter (cm)" ) length2S = str( float(length1S) * 100 );
  if ( unitL1 == "meter (m)" && unitL2 == "inch (in)" ) length2S = str( float(length1S) * 39.3700787 );
  if ( unitL1 == "meter (m)" && unitL2 == "decimeter (dm)" ) length2S = str( float(length1S) * 10 );
  if ( unitL1 == "meter (m)" && unitL2 == "foot (ft)" ) length2S = str( float(length1S) * 3.2808399 );
  if ( unitL1 == "meter (m)" && unitL2 == "meter (m)" ) length2S = length1S;
  if ( unitL1 == "meter (m)" && unitL2 == "decameter (dam)" ) length2S = str( float(length1S) * 0.1 );
  if ( unitL1 == "meter (m)" && unitL2 == "hectometer (hm)" ) length2S = str( float(length1S) * 0.01 ); 
  if ( unitL1 == "meter (m)" && unitL2 == "kilometer (km)" ) length2S = str( float(length1S) * 0.001 );
  if ( unitL1 == "meter (m)" && unitL2 == "mile (mi)" ) length2S = str( float(length1S) * 0.000621371192 );
  
  if ( unitL1 == "decameter (dam)" && unitL2 == "millimeter (mm)" ) length2S = str( float(length1S) * 1.0 * pow(10, 4) );
  if ( unitL1 == "decameter (dam)" && unitL2 == "centimeter (cm)" ) length2S = str( float(length1S) * 1.0 * pow(10, 3) );
  if ( unitL1 == "decameter (dam)" && unitL2 == "inch (in)" ) length2S = str( float(length1S) * 393.700787 );
  if ( unitL1 == "decameter (dam)" && unitL2 == "decimeter (dm)" ) length2S = str( float(length1S) * 100 );
  if ( unitL1 == "decameter (dam)" && unitL2 == "foot (ft)" ) length2S = str( float(length1S) * 32.808399 );
  if ( unitL1 == "decameter (dam)" && unitL2 == "meter (m)" ) length2S = str( float(length1S) * 10 );
  if ( unitL1 == "decameter (dam)" && unitL2 == "decameter (dam)" ) length2S = length1S;
  if ( unitL1 == "decameter (dam)" && unitL2 == "hectometer (hm)" ) length2S = str( float(length1S) * 0.1 ); 
  if ( unitL1 == "decameter (dam)" && unitL2 == "kilometer (km)" ) length2S = str( float(length1S) * 0.01 );
  if ( unitL1 == "decameter (dam)" && unitL2 == "mile (mi)" ) length2S = str( float(length1S) * 0.00621371192 );
  
  if ( unitL1 == "hectometer (hm)" && unitL2 == "millimeter (mm)" ) length2S = str( float(length1S) * 1.0 * pow(10, 5) );
  if ( unitL1 == "hectometer (hm)" && unitL2 == "centimeter (cm)" ) length2S = str( float(length1S) * 1.0 * pow(10, 4) );
  if ( unitL1 == "hectometer (hm)" && unitL2 == "inch (in)" ) length2S = str( float(length1S) * 3937.00787 );
  if ( unitL1 == "hectometer (hm)" && unitL2 == "decimeter (dm)" ) length2S = str( float(length1S) * 1.0 * pow(10, 3));
  if ( unitL1 == "hectometer (hm)" && unitL2 == "foot (ft)" ) length2S = str( float(length1S) * 328.08399 );
  if ( unitL1 == "hectometer (hm)" && unitL2 == "meter (m)" ) length2S = str( float(length1S) * 100 );
  if ( unitL1 == "hectometer (hm)" && unitL2 == "decameter (dam)" ) length2S = str( float(length1S) * 10 );
  if ( unitL1 == "hectometer (hm)" && unitL2 == "hectometer (hm)" ) length2S = length1S; 
  if ( unitL1 == "hectometer (hm)" && unitL2 == "kilometer (km)" ) length2S = str( float(length1S) * 0.1 );
  if ( unitL1 == "hectometer (hm)" && unitL2 == "mile (mi)" ) length2S = str( float(length1S) * 0.0621371192 );
  
  if ( unitL1 == "kilometer (km)" && unitL2 == "millimeter (mm)" ) length2S = str( float(length1S) * 1.0 * pow(10, 6) );
  if ( unitL1 == "kilometer (km)" && unitL2 == "centimeter (cm)" ) length2S = str( float(length1S) * 1.0 * pow(10, 5) );
  if ( unitL1 == "kilometer (km)" && unitL2 == "inch (in)" ) length2S = str( float(length1S) * 39370.0787 );
  if ( unitL1 == "kilometer (km)" && unitL2 == "decimeter (dm)" ) length2S = str( float(length1S) * 1.0 * pow(10, 4));
  if ( unitL1 == "kilometer (km)" && unitL2 == "foot (ft)" ) length2S = str( float(length1S) * 3280.8399 );
  if ( unitL1 == "kilometer (km)" && unitL2 == "meter (m)" ) length2S = str( float(length1S) * 1.0 * pow(10, 3) );
  if ( unitL1 == "kilometer (km)" && unitL2 == "decameter (dam)" ) length2S = str( float(length1S) * 100 );
  if ( unitL1 == "kilometer (km)" && unitL2 == "hectometer (hm)" ) length2S = str( float(length1S) * 10 );
  if ( unitL1 == "kilometer (km)" && unitL2 == "kilometer (km)" ) length2S = length1S; 
  if ( unitL1 == "kilometer (km)" && unitL2 == "mile (mi)" ) length2S = str( float(length1S) * 0.621371192 );
  
  if ( unitL1 == "mile (mi)" && unitL2 == "millimeter (mm)" ) length2S = str( float(length1S) * 1609344  );
  if ( unitL1 == "mile (mi)" && unitL2 == "centimeter (cm)" ) length2S = str( float(length1S) * 160934.4 );
  if ( unitL1 == "mile (mi)" && unitL2 == "inch (in)" ) length2S = str( float(length1S) * 63360 );
  if ( unitL1 == "mile (mi)" && unitL2 == "decimeter (dm)" ) length2S = str( float(length1S) * 16093.44  );
  if ( unitL1 == "mile (mi)" && unitL2 == "foot (ft)" ) length2S = str( float(length1S) * 5280 );
  if ( unitL1 == "mile (mi)" && unitL2 == "meter (m)" ) length2S = str( float(length1S) * 1609.344 );
  if ( unitL1 == "mile (mi)" && unitL2 == "decameter (dam)" ) length2S = str( float(length1S) * 160.9344 );
  if ( unitL1 == "mile (mi)" && unitL2 == "hectometer (hm)" ) length2S = str( float(length1S) * 16.09344 );
  if ( unitL1 == "mile (mi)" && unitL2 == "kilometer (km)" ) length2S = str( float(length1S) * 1.609344 );
  if ( unitL1 == "mile (mi)" && unitL2 == "mile (mi)" ) length2S = length1S; 
  
}