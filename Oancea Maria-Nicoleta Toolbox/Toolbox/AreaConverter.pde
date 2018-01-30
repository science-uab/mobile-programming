/*
  created by Oancea Maria-Nicoleta
  email: oanceamarianicoleta@gmail.com
  MIT license
*/

String area1S = "";
String area2S = "";

String unitAr1 = "";
String unitAr2 = "";

//the function, where the area converter interface is created
void areaConverter(){
  strokeWeight(3);
  stroke(#0000ff);
  fill(#0000ff);
  textAlign(CENTER, TOP);
  textSize(height/20);
  imageMode(CORNER);
  rect(0, 0, width, height/10 );
  fill(#ffffff);
  text("Area Converter", width/2, height/30);
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
  text(area1S, 20, height/6.8);  
  text(area2S, width/2+40, height/6.8);  
  textSize(height/25);
  text(unitAr1, 20, height/5);  
  text(unitAr2, width/2+40, height/5);

 if (valueKeyboard.length() <= 15 ) area1S = valueKeyboard; 
 if (unitAr1 != "" && unitAr2 != "" && area1S != "" ) convertsArea();
  
  textSize(height/35);
  noFill();
  rect(10, height/4, width/2-40, 10*height/20);
  rect(width/2+30, height/4, width/2-40, 10*height/20);
  noStroke();
  if (mouseX > 10 && mouseX < width/2-30 && mouseY > height/4 && mouseY <  height/4+height/20 ) fill(#aaaaaa);
  else fill(#ffffff); 
  rect(10, height/4, width/2-40, height/20);
  fill(#000000);
  text("mm²", 20, height/3.8); 
  if (mouseX > 10 && mouseX < width/2-30 && mouseY > height/4+height/20 && mouseY <  height/4+2*height/20 ) fill(#aaaaaa);
  else fill(#ffffff); 
  rect(10, height/4+height/20, width/2-40, height/20);
  fill(#000000);
  text("cm²", 20, height/3.8+height/20); 
  if (mouseX > 10 && mouseX < width/2-30 && mouseY > height/4+2*height/20 && mouseY <  height/4+3*height/20 ) fill(#aaaaaa);
  else fill(#ffffff); 
  rect(10, height/4+2*height/20, width/2-40, height/20);
  fill(#000000);
  text("in²", 20, height/3.8+2*height/20); 
  if (mouseX > 10 && mouseX < width/2-30 && mouseY > height/4+3*height/20 && mouseY <  height/4+4*height/20 ) fill(#aaaaaa);
  else fill(#ffffff); 
  rect(10, height/4+3*height/20, width/2-40, height/20);
  fill(#000000);
  text("dm²", 20, height/3.8+3*height/20); 
  if (mouseX > 10 && mouseX < width/2-30 && mouseY > height/4+4*height/20 && mouseY <  height/4+5*height/20 ) fill(#aaaaaa);
  else fill(#ffffff); 
  rect(10, height/4+4*height/20, width/2-40, height/20);
  fill(#000000);
  text("ft²", 20, height/3.8+4*height/20); 
  if (mouseX > 10 && mouseX < width/2-30 && mouseY > height/4+5*height/20 && mouseY <  height/4+6*height/20 ) fill(#aaaaaa);
  else fill(#ffffff); 
  rect(10, height/4+5*height/20, width/2-40, height/20);
  fill(#000000);
  text("m²", 20, height/3.8+5*height/20); 
  if (mouseX > 10 && mouseX < width/2-30 && mouseY > height/4+6*height/20 && mouseY <  height/4+7*height/20 ) fill(#aaaaaa);
  else fill(#ffffff); 
  rect(10, height/4+6*height/20, width/2-40, height/20);
  fill(#000000);
  text("are(a) / dam²", 20, height/3.8+6*height/20); 
  if (mouseX > 10 && mouseX < width/2-30 && mouseY > height/4+7*height/20 && mouseY <  height/4+8*height/20 ) fill(#aaaaaa);
  else fill(#ffffff); 
  rect(10, height/4+7*height/20, width/2-40, height/20);
  fill(#000000);
  text("hectare(ha) / hm²", 20, height/3.8+7*height/20); 
  if (mouseX > 10 && mouseX < width/2-30 && mouseY > height/4+8*height/20 && mouseY <  height/4+9*height/20 ) fill(#aaaaaa);
  else fill(#ffffff); 
  rect(10, height/4+8*height/20, width/2-40, height/20);
  fill(#000000);
  text("km²", 20, height/3.8+8*height/20); 
  if (mouseX > 10 && mouseX < width/2-30 && mouseY > height/4+9*height/20 && mouseY <  height/4+10*height/20 ) fill(#aaaaaa);
  else fill(#ffffff); 
  rect(10, height/4+9*height/20, width/2-40, height/20);
  fill(#000000);
  text("square mile", 20, height/3.8+9*height/20); 
  
  if (mouseX > width/2+30 && mouseX < width-10 && mouseY > height/4 && mouseY <  height/4+height/20 ) fill(#aaaaaa);
  else fill(#ffffff); 
  rect(width/2+30, height/4, width/2-40, height/20);
  fill(#000000);
  text("mm²", width/2+40, height/3.8); 
  if (mouseX > width/2+30 && mouseX < width-10 && mouseY > height/4+height/20 && mouseY <  height/4+2*height/20 ) fill(#aaaaaa);
  else fill(#ffffff); 
  rect(width/2+30, height/4+height/20, width/2-40, height/20);
  fill(#000000);
  text("cm²", width/2+40, height/3.8+height/20); 
  if (mouseX > width/2+30 && mouseX < width-10 && mouseY > height/4+2*height/20 && mouseY <  height/4+3*height/20 ) fill(#aaaaaa);
  else fill(#ffffff); 
  rect(width/2+30, height/4+2*height/20, width/2-40, height/20);
  fill(#000000);
  text("in²", width/2+40, height/3.8+2*height/20); 
  if (mouseX > width/2+30 && mouseX < width-10 && mouseY > height/4+3*height/20 && mouseY <  height/4+4*height/20 ) fill(#aaaaaa);
  else fill(#ffffff); 
  rect(width/2+30, height/4+3*height/20, width/2-40, height/20);
  fill(#000000);
  text("dm²", width/2+40, height/3.8+3*height/20); 
  if (mouseX > width/2+30 && mouseX < width-10 && mouseY > height/4+4*height/20 && mouseY <  height/4+5*height/20 ) fill(#aaaaaa);
  else fill(#ffffff); 
  rect(width/2+30, height/4+4*height/20, width/2-40, height/20);
  fill(#000000);
  text("ft²", width/2+40, height/3.8+4*height/20); 
  if (mouseX > width/2+30 && mouseX < width-10 && mouseY > height/4+5*height/20 && mouseY <  height/4+6*height/20 ) fill(#aaaaaa);
  else fill(#ffffff); 
  rect(width/2+30, height/4+5*height/20, width/2-40, height/20);
  fill(#000000);
  text("m²", width/2+40, height/3.8+5*height/20); 
  if (mouseX > width/2+30 && mouseX < width-10 && mouseY > height/4+6*height/20 && mouseY <  height/4+7*height/20 ) fill(#aaaaaa);
  else fill(#ffffff); 
  rect(width/2+30, height/4+6*height/20, width/2-40, height/20);
  fill(#000000);
  text("are(a) / dam²", width/2+40, height/3.8+6*height/20); 
  if (mouseX > width/2+30 && mouseX < width-10 && mouseY > height/4+7*height/20 && mouseY <  height/4+8*height/20 ) fill(#aaaaaa);
  else fill(#ffffff); 
  rect(width/2+30, height/4+7*height/20, width/2-40, height/20);
  fill(#000000);
  text("hectare(ha) / hm²", width/2+40, height/3.8+7*height/20); 
  if (mouseX > width/2+30 && mouseX < width-10 && mouseY > height/4+8*height/20 && mouseY <  height/4+9*height/20 ) fill(#aaaaaa);
  else fill(#ffffff); 
  rect(width/2+30, height/4+8*height/20, width/2-40, height/20);
  fill(#000000);
  text("km²", width/2+40, height/3.8+8*height/20); 
  if (mouseX > width/2+30 && mouseX < width-10 && mouseY > height/4+9*height/20 && mouseY <  height/4+10*height/20 ) fill(#aaaaaa);
  else fill(#ffffff); 
  rect(width/2+30, height/4+9*height/20, width/2-40, height/20);
  fill(#000000);
  text("square mile", width/2+40, height/3.8+9*height/20); 
}

//the function, where defines actions on the area converter page
void areaConverterClick(){
  if ( mouseX > width/36 && mouseX < width/36+width/6.5 && mouseY > height/60 && mouseY < height/60+height/15 ) {
    page = 7;
    activeKeyboard = false;
    unitAr1 = unitAr2 = area1S = area2S = valueKeyboard = "";
  }

  if ( mouseX > 10 && mouseX < width/2-30 && mouseY > height/7 && mouseY < height/7+height/12 ) activeKeyboard = true;
  
  if(!activeKeyboard ) {
    if (mouseX > 10 && mouseX < width/2-30 && mouseY > height/4 && mouseY <  height/4+height/20 ) unitAr1 = "mm²";
    if (mouseX > 10 && mouseX < width/2-30 && mouseY > height/4+height/20 && mouseY <  height/4+2*height/20 ) unitAr1 = "cm²";
    if (mouseX > 10 && mouseX < width/2-30 && mouseY > height/4+2*height/20 && mouseY <  height/4+3*height/20 ) unitAr1 = "in²";
    if (mouseX > 10 && mouseX < width/2-30 && mouseY > height/4+3*height/20 && mouseY <  height/4+4*height/20 ) unitAr1 = "dm²";
    if (mouseX > 10 && mouseX < width/2-30 && mouseY > height/4+4*height/20 && mouseY <  height/4+5*height/20 ) unitAr1 = "ft²";
    if (mouseX > 10 && mouseX < width/2-30 && mouseY > height/4+5*height/20 && mouseY <  height/4+6*height/20 ) unitAr1 = "m²";
    if (mouseX > 10 && mouseX < width/2-30 && mouseY > height/4+6*height/20 && mouseY <  height/4+7*height/20 ) unitAr1 = "are(a) / dam²";
    if (mouseX > 10 && mouseX < width/2-30 && mouseY > height/4+7*height/20 && mouseY <  height/4+8*height/20 ) unitAr1 = "hectare(ha)";
    if (mouseX > 10 && mouseX < width/2-30 && mouseY > height/4+8*height/20 && mouseY <  height/4+9*height/20 ) unitAr1 = "km²"; 
    if (mouseX > 10 && mouseX < width/2-30 && mouseY > height/4+9*height/20 && mouseY <  height/4+10*height/20 ) unitAr1 = "square mile"; 
    
    if (mouseX > width/2+30 && mouseX < width-10 && mouseY > height/4 && mouseY <  height/4+height/20 ) unitAr2 = "mm²";
    if (mouseX > width/2+30 && mouseX < width-10 && mouseY > height/4+height/20 && mouseY <  height/4+2*height/20 ) unitAr2 = "cm²";
    if (mouseX > width/2+30 && mouseX < width-10 && mouseY > height/4+2*height/20 && mouseY <  height/4+3*height/20 ) unitAr2 = "in²";
    if (mouseX > width/2+30 && mouseX < width-10 && mouseY > height/4+3*height/20 && mouseY <  height/4+4*height/20 ) unitAr2 = "dm²";
    if (mouseX > width/2+30 && mouseX < width-10 && mouseY > height/4+4*height/20 && mouseY <  height/4+5*height/20 ) unitAr2 = "ft²";
    if (mouseX > width/2+30 && mouseX < width-10 && mouseY > height/4+5*height/20 && mouseY <  height/4+6*height/20 ) unitAr2 = "m²";
    if (mouseX > width/2+30 && mouseX < width-10 && mouseY > height/4+6*height/20 && mouseY <  height/4+7*height/20 ) unitAr2 = "are(a) / dam²";
    if (mouseX > width/2+30 && mouseX < width-10 && mouseY > height/4+7*height/20 && mouseY <  height/4+8*height/20 ) unitAr2 = "hectare(ha)";
    if (mouseX > width/2+30 && mouseX < width-10 && mouseY > height/4+8*height/20 && mouseY <  height/4+9*height/20 ) unitAr2 = "km²"; 
    if (mouseX > width/2+30 && mouseX < width-10 && mouseY > height/4+9*height/20 && mouseY <  height/4+10*height/20 ) unitAr2 = "square mile"; 
  }
}

//the function in which an angle is converted from unit1 to unit2
void convertsArea(){
  if ( unitAr1 == "mm²" && unitAr2 == "mm²" ) area2S = area1S;
  if ( unitAr1 == "mm²" && unitAr2 == "cm²" ) area2S = str( float(area1S) * 0.01 );
  if ( unitAr1 == "mm²" && unitAr2 == "in²" ) area2S = str( float(area1S) * 0.0015500031 );
  if ( unitAr1 == "mm²" && unitAr2 == "dm²" ) area2S = str( float(area1S) * 0.0001 );
  if ( unitAr1 == "mm²" && unitAr2 == "ft²" ) area2S = str( float(area1S) * 1.07639104 * pow(10, -5) );
  if ( unitAr1 == "mm²" && unitAr2 == "m²" ) area2S = str( float(area1S) * 1.0 * pow(10, -6) );
  if ( unitAr1 == "mm²" && unitAr2 == "are(a) / dam²" ) area2S = str( float(area1S) * 1.0 * pow(10, -8) );
  if ( unitAr1 == "mm²" && unitAr2 == "hectare(ha)" ) area2S = str( float(area1S) * 1.0 * pow(10, -10) ); 
  if ( unitAr1 == "mm²" && unitAr2 == "km²" ) area2S = str( float(area1S) * 1.0 * pow(10, -12) );
  if ( unitAr1 == "mm²" && unitAr2 == "square mile" ) area2S = str( float(area1S) * 3.86102159 * pow(10, -13) );
  
  if ( unitAr1 == "cm²" && unitAr2 == "mm²" ) area2S = str( float(area1S) * 100 );
  if ( unitAr1 == "cm²" && unitAr2 == "cm²" ) area2S = area1S;
  if ( unitAr1 == "cm²" && unitAr2 == "in²" ) area2S = str( float(area1S) * 0.15500031 );
  if ( unitAr1 == "cm²" && unitAr2 == "dm²" ) area2S = str( float(area1S) * 0.01 );
  if ( unitAr1 == "cm²" && unitAr2 == "ft²" ) area2S = str( float(area1S) * 0.00107639104 );
  if ( unitAr1 == "cm²" && unitAr2 == "m²" ) area2S = str( float(area1S) * 1.0 * pow(10, -4) );
  if ( unitAr1 == "cm²" && unitAr2 == "are(a) / dam²" ) area2S = str( float(area1S) * 1.0 * pow(10, -6) );
  if ( unitAr1 == "cm²" && unitAr2 == "hectare(ha)" ) area2S = str( float(area1S) * 1.0 * pow(10, -8) ); 
  if ( unitAr1 == "cm²" && unitAr2 == "km²" ) area2S = str( float(area1S) * 1.0 * pow(10, -10) );
  if ( unitAr1 == "cm²" && unitAr2 == "square mile" ) area2S = str( float(area1S) * 3.86102159 * pow(10, -11) );
  
  if ( unitAr1 == "in²" && unitAr2 == "mm²" ) area2S = str( float(area1S) * 645.16 );
  if ( unitAr1 == "in²" && unitAr2 == "cm²" ) area2S = str( float(area1S) * 6.4516 );
  if ( unitAr1 == "in²" && unitAr2 == "in²" ) area2S = area1S;
  if ( unitAr1 == "in²" && unitAr2 == "dm²" ) area2S = str( float(area1S) * 0.064516 );
  if ( unitAr1 == "in²" && unitAr2 == "ft²" ) area2S = str( float(area1S) * 0.00694444444 );
  if ( unitAr1 == "in²" && unitAr2 == "m²" ) area2S = str( float(area1S) * 0.00064516 );
  if ( unitAr1 == "in²" && unitAr2 == "are(a) / dam²" ) area2S = str( float(area1S) * 6.4516 * pow(10, -6) );
  if ( unitAr1 == "in²" && unitAr2 == "hectare(ha)" ) area2S = str( float(area1S) * 6.4516 * pow(10, -8) ); 
  if ( unitAr1 == "in²" && unitAr2 == "km²" ) area2S = str( float(area1S) * 6.4516 * pow(10, -10) );
  if ( unitAr1 == "in²" && unitAr2 == "square mile" ) area2S = str( float(area1S) * 2.49097669 * pow(10, -10) );
  
  if ( unitAr1 == "dm²" && unitAr2 == "mm²" ) area2S = str( float(area1S) * 1.0 * pow(10, 4) );
  if ( unitAr1 == "dm²" && unitAr2 == "cm²" ) area2S = str( float(area1S) * 100 );
  if ( unitAr1 == "dm²" && unitAr2 == "in²" ) area2S = str( float(area1S) * 15.500031 );
  if ( unitAr1 == "dm²" && unitAr2 == "dm²" ) area2S = area1S;
  if ( unitAr1 == "dm²" && unitAr2 == "ft²" ) area2S = str( float(area1S) * 0.107639104  );
  if ( unitAr1 == "dm²" && unitAr2 == "m²" ) area2S = str( float(area1S) * 0.01 );
  if ( unitAr1 == "dm²" && unitAr2 == "are(a) / dam²" ) area2S = str( float(area1S) * 0.0001 );
  if ( unitAr1 == "dm²" && unitAr2 == "hectare(ha)" ) area2S = str( float(area1S) * 1.0 * pow(10, -6) ); 
  if ( unitAr1 == "dm²" && unitAr2 == "km²" ) area2S = str( float(area1S) * 1.0 * pow(10, -8) );
  if ( unitAr1 == "dm²" && unitAr2 == "square mile" ) area2S = str( float(area1S) * 3.86102159 * pow(10, -9) );
  
  if ( unitAr1 == "ft²" && unitAr2 == "mm²" ) area2S = str( float(area1S) * 92903.04 );
  if ( unitAr1 == "ft²" && unitAr2 == "cm²" ) area2S = str( float(area1S) * 929.0304 );
  if ( unitAr1 == "ft²" && unitAr2 == "in²" ) area2S = str( float(area1S) * 144 );
  if ( unitAr1 == "ft²" && unitAr2 == "dm²" ) area2S = str( float(area1S) * 9.290304 );
  if ( unitAr1 == "ft²" && unitAr2 == "ft²" ) area2S = area1S;
  if ( unitAr1 == "ft²" && unitAr2 == "m²" ) area2S = str( float(area1S) * 0.09290304 );
  if ( unitAr1 == "ft²" && unitAr2 == "are(a) / dam²" ) area2S = str( float(area1S) * 0.0009290304 );
  if ( unitAr1 == "ft²" && unitAr2 == "hectare(ha)" ) area2S = str( float(area1S) * 9.290304 * pow(10, -6) ); 
  if ( unitAr1 == "ft²" && unitAr2 == "km²" ) area2S = str( float(area1S) * 9.290304 * 1.0 * pow(10, -8) );
  if ( unitAr1 == "ft²" && unitAr2 == "square mile" ) area2S = str( float(area1S) * 3.58700643  * pow(10, -8) );
  
  if ( unitAr1 == "m²" && unitAr2 == "mm²" ) area2S = str( float(area1S) * 1.0 * pow(10, 6) );
  if ( unitAr1 == "m²" && unitAr2 == "cm²" ) area2S = str( float(area1S) * 1.0 * pow(10, 4) );
  if ( unitAr1 == "m²" && unitAr2 == "in²" ) area2S = str( float(area1S) * 1550.0031 );
  if ( unitAr1 == "m²" && unitAr2 == "dm²" ) area2S = str( float(area1S) * 100 );
  if ( unitAr1 == "m²" && unitAr2 == "ft²" ) area2S = str( float(area1S) * 10.7639104 );
  if ( unitAr1 == "m²" && unitAr2 == "m²" ) area2S = area1S;
  if ( unitAr1 == "m²" && unitAr2 == "are(a) / dam²" ) area2S = str( float(area1S) * 0.01 );
  if ( unitAr1 == "m²" && unitAr2 == "hectare(ha)" ) area2S = str( float(area1S) * 1.0 * pow(10, -4) ); 
  if ( unitAr1 == "m²" && unitAr2 == "km²" ) area2S = str( float(area1S) * 1.0 * pow(10, -6) );
  if ( unitAr1 == "m²" && unitAr2 == "square mile" ) area2S = str( float(area1S) * 3.86102159 * pow(10, -7) );
  
  if ( unitAr1 == "are(a) / dam²" && unitAr2 == "mm²" ) area2S = str( float(area1S) * 1.0 * pow(10, 8) );
  if ( unitAr1 == "are(a) / dam²" && unitAr2 == "cm²" ) area2S = str( float(area1S) * 1.0 * pow(10, 6) );
  if ( unitAr1 == "are(a) / dam²" && unitAr2 == "in²" ) area2S = str( float(area1S) * 155000.31 );
  if ( unitAr1 == "are(a) / dam²" && unitAr2 == "dm²" ) area2S = str( float(area1S) * 1.0 * pow(10, 4));
  if ( unitAr1 == "are(a) / dam²" && unitAr2 == "ft²" ) area2S = str( float(area1S) * 1076.39104 );
  if ( unitAr1 == "are(a) / dam²" && unitAr2 == "m²" ) area2S = str( float(area1S) * 100 );
  if ( unitAr1 == "are(a) / dam²" && unitAr2 == "are(a) / dam²" ) area2S = area1S;
  if ( unitAr1 == "are(a) / dam²" && unitAr2 == "hectare(ha)" ) area2S = str( float(area1S) * 0.01 ); 
  if ( unitAr1 == "are(a) / dam²" && unitAr2 == "km²" ) area2S = str( float(area1S) * 1.0 * pow(10, -4) );
  if ( unitAr1 == "are(a) / dam²" && unitAr2 == "square mile" ) area2S = str( float(area1S) * 3.86102159 * pow(10, -5) );
  
  if ( unitAr1 == "hectare(ha)" && unitAr2 == "mm²" ) area2S = str( float(area1S) * 1.0 * pow(10, 10) );
  if ( unitAr1 == "hectare(ha)" && unitAr2 == "cm²" ) area2S = str( float(area1S) * 1.0 * pow(10, 8) );
  if ( unitAr1 == "hectare(ha)" && unitAr2 == "in²" ) area2S = str( float(area1S) * 15500031 );
  if ( unitAr1 == "hectare(ha)" && unitAr2 == "dm²" ) area2S = str( float(area1S) * 1.0 * pow(10, 6));
  if ( unitAr1 == "hectare(ha)" && unitAr2 == "ft²" ) area2S = str( float(area1S) * 107639.104 );
  if ( unitAr1 == "hectare(ha)" && unitAr2 == "m²" ) area2S = str( float(area1S) * 1.0 * pow(10, 4) );
  if ( unitAr1 == "hectare(ha)" && unitAr2 == "are(a) / dam²" ) area2S = str( float(area1S) * 100 );
  if ( unitAr1 == "hectare(ha)" && unitAr2 == "hectare(ha)" ) area2S = area1S; 
  if ( unitAr1 == "hectare(ha)" && unitAr2 == "km²" ) area2S = str( float(area1S) * 0.01 );
  if ( unitAr1 == "hectare(ha)" && unitAr2 == "square mile" ) area2S = str( float(area1S) * 0.00386102159 );
  
  if ( unitAr1 == "km²" && unitAr2 == "mm²" ) area2S = str( float(area1S) * 1.0 * pow(10, 12) );
  if ( unitAr1 == "km²" && unitAr2 == "cm²" ) area2S = str( float(area1S) * 1.0 * pow(10, 10) );
  if ( unitAr1 == "km²" && unitAr2 == "in²" ) area2S = str( float(area1S) * 1.5500031 * pow(10, 9) );
  if ( unitAr1 == "km²" && unitAr2 == "dm²" ) area2S = str( float(area1S) * 1.0 * pow(10, 8));
  if ( unitAr1 == "km²" && unitAr2 == "ft²" ) area2S = str( float(area1S) * 10763910.4 );
  if ( unitAr1 == "km²" && unitAr2 == "m²" ) area2S = str( float(area1S) * 1.0 * pow(10, 6) );
  if ( unitAr1 == "km²" && unitAr2 == "are(a) / dam²" ) area2S = str( float(area1S) * 1.0 * pow(10, 4) );
  if ( unitAr1 == "km²" && unitAr2 == "hectare(ha)" ) area2S = str( float(area1S) * 100 );
  if ( unitAr1 == "km²" && unitAr2 == "km²" ) area2S = area1S; 
  if ( unitAr1 == "km²" && unitAr2 == "square mile" ) area2S = str( float(area1S) * 0.386102159 );
  
  if ( unitAr1 == "square mile" && unitAr2 == "mm²" ) area2S = str( float(area1S) * 2.58998811 * pow(10, 12)  );
  if ( unitAr1 == "square mile" && unitAr2 == "cm²" ) area2S = str( float(area1S) * 2.58998811 * pow(10, 10) );
  if ( unitAr1 == "square mile" && unitAr2 == "in²" ) area2S = str( float(area1S) * 40144896 * 100 );
  if ( unitAr1 == "square mile" && unitAr2 == "dm²" ) area2S = str( float(area1S) * 2.58998811 * pow(10, 8)  );
  if ( unitAr1 == "square mile" && unitAr2 == "ft²" ) area2S = str( float(area1S) * 27878400 );
  if ( unitAr1 == "square mile" && unitAr2 == "m²" ) area2S = str( float(area1S) * 2.58998811 * pow(10, 6)  );
  if ( unitAr1 == "square mile" && unitAr2 == "are(a) / dam²" ) area2S = str( float(area1S) * 2.58998811 * pow(10, 4) );
  if ( unitAr1 == "square mile" && unitAr2 == "hectare(ha)" ) area2S = str( float(area1S) * 258.998811 );
  if ( unitAr1 == "square mile" && unitAr2 == "km²" ) area2S = str( float(area1S) * 2.58998811 );
  if ( unitAr1 == "square mile" && unitAr2 == "square mile" ) area2S = area1S; 
}