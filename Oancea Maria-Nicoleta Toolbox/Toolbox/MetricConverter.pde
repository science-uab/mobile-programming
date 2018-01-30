/*
  created by Oancea Maria-Nicoleta
  email: oanceamarianicoleta@gmail.com
  MIT license
*/

String metric1S = "";
String metric2S = "";

String unitM1 = "";
String unitM2 = "";

//the function, where the metric converter interface is created
void metricConverter(){
  strokeWeight(3);
  stroke(#0000ff);
  fill(#0000ff);
  textAlign(CENTER, TOP);
  textSize(height/20);
  imageMode(CORNER);
  rect(0, 0, width, height/10 );
  fill(#ffffff);
  text("Metric Converter", width/2+20, height/30);
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
  text(metric1S, 20, height/6.8);  
  text(metric2S, width/2+40, height/6.8);  
  textSize(height/25);
  text(unitM1, 20, height/5);  
  text(unitM2, width/2+40, height/5);

 if (valueKeyboard.length() <= 15 ) metric1S = valueKeyboard; 
 if (unitM1 != "" && unitM2 != "" && metric1S != "" ) convertsMetric();
  
  textSize(height/35);
  noFill();
  rect(10, height/4, width/2-40, 13*height/20);
  rect(width/2+30, height/4, width/2-40, 13*height/20);
  noStroke();
  if (mouseX > 10 && mouseX < width/2-30 && mouseY > height/4 && mouseY <  height/4+height/20 ) fill(#aaaaaa);
  else fill(#ffffff); 
  rect(10, height/4, width/2-40, height/20);
  fill(#000000);
  text("pico (p)", 20, height/3.8); 
  if (mouseX > 10 && mouseX < width/2-30 && mouseY > height/4+height/20 && mouseY <  height/4+2*height/20 ) fill(#aaaaaa);
  else fill(#ffffff); 
  rect(10, height/4+height/20, width/2-40, height/20);
  fill(#000000);
  text("nano (n)", 20, height/3.8+height/20); 
  if (mouseX > 10 && mouseX < width/2-30 && mouseY > height/4+2*height/20 && mouseY <  height/4+3*height/20 ) fill(#aaaaaa);
  else fill(#ffffff); 
  rect(10, height/4+2*height/20, width/2-40, height/20);
  fill(#000000);
  text("micro (µ)", 20, height/3.8+2*height/20); 
  if (mouseX > 10 && mouseX < width/2-30 && mouseY > height/4+3*height/20 && mouseY <  height/4+4*height/20 ) fill(#aaaaaa);
  else fill(#ffffff); 
  rect(10, height/4+3*height/20, width/2-40, height/20);
  fill(#000000);
  text("milli (m)", 20, height/3.8+3*height/20); 
  if (mouseX > 10 && mouseX < width/2-30 && mouseY > height/4+4*height/20 && mouseY <  height/4+5*height/20 ) fill(#aaaaaa);
  else fill(#ffffff); 
  rect(10, height/4+4*height/20, width/2-40, height/20);
  fill(#000000);
  text("centi (c)", 20, height/3.8+4*height/20); 
  if (mouseX > 10 && mouseX < width/2-30 && mouseY > height/4+5*height/20 && mouseY <  height/4+6*height/20 ) fill(#aaaaaa);
  else fill(#ffffff); 
  rect(10, height/4+5*height/20, width/2-40, height/20);
  fill(#000000);
  text("deci (d)", 20, height/3.8+5*height/20); 
  if (mouseX > 10 && mouseX < width/2-30 && mouseY > height/4+6*height/20 && mouseY <  height/4+7*height/20 ) fill(#aaaaaa);
  else fill(#ffffff); 
  rect(10, height/4+6*height/20, width/2-40, height/20);
  fill(#000000);
  text("base", 20, height/3.8+6*height/20); 
  if (mouseX > 10 && mouseX < width/2-30 && mouseY > height/4+7*height/20 && mouseY <  height/4+8*height/20 ) fill(#aaaaaa);
  else fill(#ffffff); 
  rect(10, height/4+7*height/20, width/2-40, height/20);
  fill(#000000);
  text("deca (da)", 20, height/3.8+7*height/20); 
  if (mouseX > 10 && mouseX < width/2-30 && mouseY > height/4+8*height/20 && mouseY <  height/4+9*height/20 ) fill(#aaaaaa);
  else fill(#ffffff); 
  rect(10, height/4+8*height/20, width/2-40, height/20);
  fill(#000000);
  text("hecto (h)", 20, height/3.8+8*height/20); 
  if (mouseX > 10 && mouseX < width/2-30 && mouseY > height/4+9*height/20 && mouseY <  height/4+10*height/20 ) fill(#aaaaaa);
  else fill(#ffffff); 
  rect(10, height/4+9*height/20, width/2-40, height/20);
  fill(#000000);
  text("kilo (k)", 20, height/3.8+9*height/20); 
  if (mouseX > 10 && mouseX < width/2-30 && mouseY > height/4+10*height/20 && mouseY <  height/4+11*height/20 ) fill(#aaaaaa);
  else fill(#ffffff); 
  rect(10, height/4+10*height/20, width/2-40, height/20);
  fill(#000000);
  text("mega (M)", 20, height/3.8+10*height/20); 
  if (mouseX > 10 && mouseX < width/2-30 && mouseY > height/4+11*height/20 && mouseY <  height/4+12*height/20 ) fill(#aaaaaa);
  else fill(#ffffff); 
  rect(10, height/4+11*height/20, width/2-40, height/20);
  fill(#000000);
  text("giga (G)", 20, height/3.8+11*height/20); 
  if (mouseX > 10 && mouseX < width/2-30 && mouseY > height/4+12*height/20 && mouseY <  height/4+13*height/20 ) fill(#aaaaaa);
  else fill(#ffffff); 
  rect(10, height/4+12*height/20, width/2-40, height/20);
  fill(#000000);
  text("tera (T)", 20, height/3.8+12*height/20); 
  
  if (mouseX > width/2+30 && mouseX < width-10 && mouseY > height/4 && mouseY <  height/4+height/20 ) fill(#aaaaaa);
  else fill(#ffffff); 
  rect(width/2+30, height/4, width/2-40, height/20);
  fill(#000000);
  text("pico (p)", width/2+40, height/3.8); 
  if (mouseX > width/2+30 && mouseX < width-10 && mouseY > height/4+height/20 && mouseY <  height/4+2*height/20 ) fill(#aaaaaa);
  else fill(#ffffff); 
  rect(width/2+30, height/4+height/20, width/2-40, height/20);
  fill(#000000);
  text("nano (n)", width/2+40, height/3.8+height/20); 
  if (mouseX > width/2+30 && mouseX < width-10 && mouseY > height/4+2*height/20 && mouseY <  height/4+3*height/20 ) fill(#aaaaaa);
  else fill(#ffffff); 
  rect(width/2+30, height/4+2*height/20, width/2-40, height/20);
  fill(#000000);
  text("micro (µ)", width/2+40, height/3.8+2*height/20); 
  if (mouseX > width/2+30 && mouseX < width-10 && mouseY > height/4+3*height/20 && mouseY <  height/4+4*height/20 ) fill(#aaaaaa);
  else fill(#ffffff); 
  rect(width/2+30, height/4+3*height/20, width/2-40, height/20);
  fill(#000000);
  text("milli (m)", width/2+40, height/3.8+3*height/20); 
  if (mouseX > width/2+30 && mouseX < width-10 && mouseY > height/4+4*height/20 && mouseY <  height/4+5*height/20 ) fill(#aaaaaa);
  else fill(#ffffff); 
  rect(width/2+30, height/4+4*height/20, width/2-40, height/20);
  fill(#000000);
  text("centi (c)", width/2+40, height/3.8+4*height/20); 
  if (mouseX > width/2+30 && mouseX < width-10 && mouseY > height/4+5*height/20 && mouseY <  height/4+6*height/20 ) fill(#aaaaaa);
  else fill(#ffffff); 
  rect(width/2+30, height/4+5*height/20, width/2-40, height/20);
  fill(#000000);
  text("deci (d)", width/2+40, height/3.8+5*height/20); 
  if (mouseX > width/2+30 && mouseX < width-10 && mouseY > height/4+6*height/20 && mouseY <  height/4+7*height/20 ) fill(#aaaaaa);
  else fill(#ffffff); 
  rect(width/2+30, height/4+6*height/20, width/2-40, height/20);
  fill(#000000);
  text("base", width/2+40, height/3.8+6*height/20); 
  if (mouseX > width/2+30 && mouseX < width-10 && mouseY > height/4+7*height/20 && mouseY <  height/4+8*height/20 ) fill(#aaaaaa);
  else fill(#ffffff); 
  rect(width/2+30, height/4+7*height/20, width/2-40, height/20);
  fill(#000000);
  text("deca (da)", width/2+40, height/3.8+7*height/20); 
  if (mouseX > width/2+30 && mouseX < width-10 && mouseY > height/4+8*height/20 && mouseY <  height/4+9*height/20 ) fill(#aaaaaa);
  else fill(#ffffff); 
  rect(width/2+30, height/4+8*height/20, width/2-40, height/20);
  fill(#000000);
  text("hecto (h)", width/2+40, height/3.8+8*height/20); 
  if (mouseX > width/2+30 && mouseX < width-10 && mouseY > height/4+9*height/20 && mouseY <  height/4+10*height/20 ) fill(#aaaaaa);
  else fill(#ffffff); 
  rect(width/2+30, height/4+9*height/20, width/2-40, height/20);
  fill(#000000);
  text("kilo (k)", width/2+40, height/3.8+9*height/20); 
  if (mouseX > width/2+30 && mouseX < width-10 && mouseY > height/4+10*height/20 && mouseY <  height/4+11*height/20 ) fill(#aaaaaa);
  else fill(#ffffff); 
  rect(width/2+30, height/4+10*height/20, width/2-40, height/20);
  fill(#000000);
  text("mega (M)", width/2+40, height/3.8+10*height/20); 
  if (mouseX > width/2+30 && mouseX < width-10 && mouseY > height/4+11*height/20 && mouseY <  height/4+12*height/20 ) fill(#aaaaaa);
  else fill(#ffffff); 
  rect(width/2+30, height/4+11*height/20, width/2-40, height/20);
  fill(#000000);
  text("giga (G)", width/2+40, height/3.8+11*height/20); 
  if (mouseX > width/2+30 && mouseX < width-10 && mouseY > height/4+12*height/20 && mouseY <  height/4+13*height/20 ) fill(#aaaaaa);
  else fill(#ffffff); 
  rect(width/2+30, height/4+12*height/20, width/2-40, height/20);
  fill(#000000);
  text("tera (T)", width/2+40, height/3.8+12*height/20); 
}

//the function, where defines actions on the metric converter page
void metricConverterClick(){
  if ( mouseX > width/36 && mouseX < width/36+width/6.5 && mouseY > height/60 && mouseY < height/60+height/15 ) {
    page = 7;
    activeKeyboard = false;
    unitM1 = unitM2 = metric1S = metric2S = valueKeyboard = "";
  }

  if ( mouseX > 10 && mouseX < width/2-30 && mouseY > height/7 && mouseY < height/7+height/12 ) activeKeyboard = true;
  
  if(!activeKeyboard) {
    if (mouseX > 10 && mouseX < width/2-30 && mouseY > height/4 && mouseY <  height/4+height/20 ) unitM1 = "pico (p)";
    if (mouseX > 10 && mouseX < width/2-30 && mouseY > height/4+height/20 && mouseY <  height/4+2*height/20 ) unitM1 = "nano (n)";
    if (mouseX > 10 && mouseX < width/2-30 && mouseY > height/4+2*height/20 && mouseY <  height/4+3*height/20 ) unitM1 = "micro (µ)";
    if (mouseX > 10 && mouseX < width/2-30 && mouseY > height/4+3*height/20 && mouseY <  height/4+4*height/20 ) unitM1 = "milli (m)";
    if (mouseX > 10 && mouseX < width/2-30 && mouseY > height/4+4*height/20 && mouseY <  height/4+5*height/20 ) unitM1 = "centi (c)";
    if (mouseX > 10 && mouseX < width/2-30 && mouseY > height/4+5*height/20 && mouseY <  height/4+6*height/20 ) unitM1 = "deci (d)";
    if (mouseX > 10 && mouseX < width/2-30 && mouseY > height/4+6*height/20 && mouseY <  height/4+7*height/20 ) unitM1 = "base";
    if (mouseX > 10 && mouseX < width/2-30 && mouseY > height/4+7*height/20 && mouseY <  height/4+8*height/20 ) unitM1 = "deca (da)";
    if (mouseX > 10 && mouseX < width/2-30 && mouseY > height/4+8*height/20 && mouseY <  height/4+9*height/20 ) unitM1 = "hecto (h)"; 
    if (mouseX > 10 && mouseX < width/2-30 && mouseY > height/4+9*height/20 && mouseY <  height/4+10*height/20 ) unitM1 = "kilo (k)"; 
    if (mouseX > 10 && mouseX < width/2-30 && mouseY > height/4+10*height/20 && mouseY <  height/4+11*height/20 ) unitM1 = "mega (M)";   
    if (mouseX > 10 && mouseX < width/2-30 && mouseY > height/4+11*height/20 && mouseY <  height/4+12*height/20 ) unitM1 = "giga (G)"; 
    if (mouseX > 10 && mouseX < width/2-30 && mouseY > height/4+12*height/20 && mouseY <  height/4+13*height/20 ) unitM1 = "tera (T)"; 
    
    if (mouseX > width/2+30 && mouseX < width-10 && mouseY > height/4 && mouseY <  height/4+height/20 ) unitM2 = "pico (p)";
    if (mouseX > width/2+30 && mouseX < width-10 && mouseY > height/4+height/20 && mouseY <  height/4+2*height/20 ) unitM2 = "nano (n)";
    if (mouseX > width/2+30 && mouseX < width-10 && mouseY > height/4+2*height/20 && mouseY <  height/4+3*height/20 ) unitM2 = "micro (µ)";
    if (mouseX > width/2+30 && mouseX < width-10 && mouseY > height/4+3*height/20 && mouseY <  height/4+4*height/20 ) unitM2 = "milli (m)";
    if (mouseX > width/2+30 && mouseX < width-10 && mouseY > height/4+4*height/20 && mouseY <  height/4+5*height/20 ) unitM2 = "centi (c)";
    if (mouseX > width/2+30 && mouseX < width-10 && mouseY > height/4+5*height/20 && mouseY <  height/4+6*height/20 ) unitM2 = "deci (d)";
    if (mouseX > width/2+30 && mouseX < width-10 && mouseY > height/4+6*height/20 && mouseY <  height/4+7*height/20 ) unitM2 = "base";
    if (mouseX > width/2+30 && mouseX < width-10 && mouseY > height/4+7*height/20 && mouseY <  height/4+8*height/20 ) unitM2 = "deca (da)";
    if (mouseX > width/2+30 && mouseX < width-10 && mouseY > height/4+8*height/20 && mouseY <  height/4+9*height/20 ) unitM2 = "hecto (h)"; 
    if (mouseX > width/2+30 && mouseX < width-10 && mouseY > height/4+9*height/20 && mouseY <  height/4+10*height/20 ) unitM2 = "kilo (k)";  
    if (mouseX > width/2+30 && mouseX < width-10 && mouseY > height/4+10*height/20 && mouseY <  height/4+11*height/20 ) unitM2 = "mega (M)"; 
    if (mouseX > width/2+30 && mouseX < width-10 && mouseY > height/4+11*height/20 && mouseY <  height/4+12*height/20 ) unitM2 = "giga (G)"; 
    if (mouseX > width/2+30 && mouseX < width-10 && mouseY > height/4+12*height/20 && mouseY <  height/4+13*height/20 ) unitM2 = "tera (T)";
  }
}

//the function in which an length is converted from unit1 to unit2
void convertsMetric(){  
  if ( unitM1 == "pico (p)" && unitM2 == "pico (p)" ) metric2S = metric1S;
  if ( unitM1 == "pico (p)" && unitM2 == "nano (n)" ) metric2S = str( float(metric1S) * 1.0 * pow(10, -3) );
  if ( unitM1 == "pico (p)" && unitM2 == "micro (µ)" ) metric2S = str( float(metric1S) * 1.0 * pow(10, -6) );
  if ( unitM1 == "pico (p)" && unitM2 == "milli (m)" ) metric2S = str( float(metric1S) * 1.0 * pow(10, -9) );
  if ( unitM1 == "pico (p)" && unitM2 == "centi (c)" ) metric2S = str( float(metric1S) * 1.0 * pow(10, -10) );
  if ( unitM1 == "pico (p)" && unitM2 == "deci (d)" ) metric2S = str( float(metric1S) * 1.0 * pow(10, -11) );
  if ( unitM1 == "pico (p)" && unitM2 == "base" ) metric2S = str( float(metric1S) * 1.0 * pow(10, -12) );
  if ( unitM1 == "pico (p)" && unitM2 == "deca (da)" ) metric2S = str( float(metric1S) * 1.0 * pow(10, -13) ); 
  if ( unitM1 == "pico (p)" && unitM2 == "hecto (h)" ) metric2S = str( float(metric1S) * 1.0 * pow(10, -14) );
  if ( unitM1 == "pico (p)" && unitM2 == "kilo (k)" ) metric2S = str( float(metric1S) * 1.0 * pow(10, -15) );
  if ( unitM1 == "pico (p)" && unitM2 == "mega (M)" ) metric2S = str( float(metric1S) * 1.0 * pow(10, -18) );
  if ( unitM1 == "pico (p)" && unitM2 == "giga (G)" ) metric2S = str( float(metric1S) * 1.0 * pow(10, -21) );
  if ( unitM1 == "pico (p)" && unitM2 == "tera (T)" ) metric2S = str( float(metric1S) * 1.0 * pow(10, -24) );
  
  if ( unitM1 == "nano (n)" && unitM2 == "pico (p)" ) metric2S = str( float(metric1S) * 1.0 * pow(10, 3) );
  if ( unitM1 == "nano (n)" && unitM2 == "nano (n)" ) metric2S = metric1S ;
  if ( unitM1 == "nano (n)" && unitM2 == "micro (µ)" ) metric2S = str( float(metric1S) * 1.0 * pow(10, -3) );
  if ( unitM1 == "nano (n)" && unitM2 == "milli (m)" ) metric2S = str( float(metric1S) * 1.0 * pow(10, -6) );
  if ( unitM1 == "nano (n)" && unitM2 == "centi (c)" ) metric2S = str( float(metric1S) * 1.0 * pow(10, -7) );
  if ( unitM1 == "nano (n)" && unitM2 == "deci (d)" ) metric2S = str( float(metric1S) * 1.0 * pow(10, -8) );
  if ( unitM1 == "nano (n)" && unitM2 == "base" ) metric2S = str( float(metric1S) * 1.0 * pow(10, -9) );
  if ( unitM1 == "nano (n)" && unitM2 == "deca (da)" ) metric2S = str( float(metric1S) * 1.0 * pow(10, -10) ); 
  if ( unitM1 == "nano (n)" && unitM2 == "hecto (h)" ) metric2S = str( float(metric1S) * 1.0 * pow(10, -11) );
  if ( unitM1 == "nano (n)" && unitM2 == "kilo (k)" ) metric2S = str( float(metric1S) * 1.0 * pow(10, -12) );
  if ( unitM1 == "nano (n)" && unitM2 == "mega (M)" ) metric2S = str( float(metric1S) * 1.0 * pow(10, -15) );
  if ( unitM1 == "nano (n)" && unitM2 == "giga (G)" ) metric2S = str( float(metric1S) * 1.0 * pow(10, -18) );
  if ( unitM1 == "nano (n)" && unitM2 == "tera (T)" ) metric2S = str( float(metric1S) * 1.0 * pow(10, -21) );
  
  if ( unitM1 == "micro (µ)" && unitM2 == "pico (p)" ) metric2S = str( float(metric1S) * 1.0 * pow(10, 6) );
  if ( unitM1 == "micro (µ)" && unitM2 == "nano (n)" )  metric2S = str( float(metric1S) * 1.0 * pow(10, 3) );
  if ( unitM1 == "micro (µ)" && unitM2 == "micro (µ)" ) metric2S = metric1S;
  if ( unitM1 == "micro (µ)" && unitM2 == "milli (m)" ) metric2S = str( float(metric1S) * 1.0 * pow(10, -3) );
  if ( unitM1 == "micro (µ)" && unitM2 == "centi (c)" ) metric2S = str( float(metric1S) * 1.0 * pow(10, -4) );
  if ( unitM1 == "micro (µ)" && unitM2 == "deci (d)" ) metric2S = str( float(metric1S) * 1.0 * pow(10, -5) );
  if ( unitM1 == "micro (µ)" && unitM2 == "base" ) metric2S = str( float(metric1S) * 1.0 * pow(10, -6) );
  if ( unitM1 == "micro (µ)" && unitM2 == "deca (da)" ) metric2S = str( float(metric1S) * 1.0 * pow(10, -7) ); 
  if ( unitM1 == "micro (µ)" && unitM2 == "hecto (h)" ) metric2S = str( float(metric1S) * 1.0 * pow(10, -8) );
  if ( unitM1 == "micro (µ)" && unitM2 == "kilo (k)" ) metric2S = str( float(metric1S) * 1.0 * pow(10, -9) );
  if ( unitM1 == "micro (µ)" && unitM2 == "mega (M)" ) metric2S = str( float(metric1S) * 1.0 * pow(10, -12) );
  if ( unitM1 == "micro (µ)" && unitM2 == "giga (G)" ) metric2S = str( float(metric1S) * 1.0 * pow(10, -15) );
  if ( unitM1 == "micro (µ)" && unitM2 == "tera (T)" ) metric2S = str( float(metric1S) * 1.0 * pow(10, -18) );
  
  if ( unitM1 == "milli (m)" && unitM2 == "pico (p)" ) metric2S = str( float(metric1S) * 1.0 * pow(10, 9) );
  if ( unitM1 == "milli (m)" && unitM2 == "nano (n)" )  metric2S = str( float(metric1S) * 1.0 * pow(10, 6) );
  if ( unitM1 == "milli (m)" && unitM2 == "micro (µ)" ) metric2S = str( float(metric1S) * 1.0 * pow(10, 3) );
  if ( unitM1 == "milli (m)" && unitM2 == "milli (m)" ) metric2S = metric1S;
  if ( unitM1 == "milli (m)" && unitM2 == "centi (c)" ) metric2S = str( float(metric1S) * 1.0 * pow(10, -1) );
  if ( unitM1 == "milli (m)" && unitM2 == "deci (d)" ) metric2S = str( float(metric1S) * 1.0 * pow(10, -2) );
  if ( unitM1 == "milli (m)" && unitM2 == "base" ) metric2S = str( float(metric1S) * 1.0 * pow(10, -3) );
  if ( unitM1 == "milli (m)" && unitM2 == "deca (da)" ) metric2S = str( float(metric1S) * 1.0 * pow(10, -4) ); 
  if ( unitM1 == "milli (m)" && unitM2 == "hecto (h)" ) metric2S = str( float(metric1S) * 1.0 * pow(10, -5) );
  if ( unitM1 == "milli (m)" && unitM2 == "kilo (k)" ) metric2S = str( float(metric1S) * 1.0 * pow(10, -6) );
  if ( unitM1 == "milli (m)" && unitM2 == "mega (M)" ) metric2S = str( float(metric1S) * 1.0 * pow(10, -9) );
  if ( unitM1 == "milli (m)" && unitM2 == "giga (G)" ) metric2S = str( float(metric1S) * 1.0 * pow(10, -12) );
  if ( unitM1 == "milli (m)" && unitM2 == "tera (T)" ) metric2S = str( float(metric1S) * 1.0 * pow(10, -15) );
  
  if ( unitM1 == "centi (c)" && unitM2 == "pico (p)" ) metric2S = str( float(metric1S) * 1.0 * pow(10, 10) );
  if ( unitM1 == "centi (c)" && unitM2 == "nano (n)" )  metric2S = str( float(metric1S) * 1.0 * pow(10, 7) );
  if ( unitM1 == "centi (c)" && unitM2 == "micro (µ)" ) metric2S = str( float(metric1S) * 1.0 * pow(10, 4) );
  if ( unitM1 == "centi (c)" && unitM2 == "milli (m)" ) metric2S = str( float(metric1S) * 1.0 * pow(10, 1) );
  if ( unitM1 == "centi (c)" && unitM2 == "centi (c)" ) metric2S = metric1S;
  if ( unitM1 == "centi (c)" && unitM2 == "deci (d)" ) metric2S = str( float(metric1S) * 1.0 * pow(10, -1) );
  if ( unitM1 == "centi (c)" && unitM2 == "base" ) metric2S = str( float(metric1S) * 1.0 * pow(10, -2) );
  if ( unitM1 == "centi (c)" && unitM2 == "deca (da)" ) metric2S = str( float(metric1S) * 1.0 * pow(10, -3) ); 
  if ( unitM1 == "centi (c)" && unitM2 == "hecto (h)" ) metric2S = str( float(metric1S) * 1.0 * pow(10, -4) );
  if ( unitM1 == "centi (c)" && unitM2 == "kilo (k)" ) metric2S = str( float(metric1S) * 1.0 * pow(10, -5) );
  if ( unitM1 == "centi (c)" && unitM2 == "mega (M)" ) metric2S = str( float(metric1S) * 1.0 * pow(10, -8) );
  if ( unitM1 == "centi (c)" && unitM2 == "giga (G)" ) metric2S = str( float(metric1S) * 1.0 * pow(10, -11) );
  if ( unitM1 == "centi (c)" && unitM2 == "tera (T)" ) metric2S = str( float(metric1S) * 1.0 * pow(10, -14) );
  
  if ( unitM1 == "deci (d)" && unitM2 == "pico (p)" ) metric2S = str( float(metric1S) * 1.0 * pow(10, 11) );
  if ( unitM1 == "deci (d)" && unitM2 == "nano (n)" )  metric2S = str( float(metric1S) * 1.0 * pow(10, 8) );
  if ( unitM1 == "deci (d)" && unitM2 == "micro (µ)" ) metric2S = str( float(metric1S) * 1.0 * pow(10, 5) );
  if ( unitM1 == "deci (d)" && unitM2 == "milli (m)" ) metric2S = str( float(metric1S) * 1.0 * pow(10, 2) );
  if ( unitM1 == "deci (d)" && unitM2 == "centi (c)" ) metric2S = str( float(metric1S) * 1.0 * pow(10, 1) );
  if ( unitM1 == "deci (d)" && unitM2 == "deci (d)" ) metric2S = metric1S;
  if ( unitM1 == "deci (d)" && unitM2 == "base" ) metric2S = str( float(metric1S) * 1.0 * pow(10, -1) );
  if ( unitM1 == "deci (d)" && unitM2 == "deca (da)" ) metric2S = str( float(metric1S) * 1.0 * pow(10, -2) ); 
  if ( unitM1 == "deci (d)" && unitM2 == "hecto (h)" ) metric2S = str( float(metric1S) * 1.0 * pow(10, -3) );
  if ( unitM1 == "deci (d)" && unitM2 == "kilo (k)" ) metric2S = str( float(metric1S) * 1.0 * pow(10, -4) );
  if ( unitM1 == "deci (d)" && unitM2 == "mega (M)" ) metric2S = str( float(metric1S) * 1.0 * pow(10, -7) );
  if ( unitM1 == "deci (d)" && unitM2 == "giga (G)" ) metric2S = str( float(metric1S) * 1.0 * pow(10, -10) );
  if ( unitM1 == "deci (d)" && unitM2 == "tera (T)" ) metric2S = str( float(metric1S) * 1.0 * pow(10, -13) );
  
  if ( unitM1 == "base" && unitM2 == "pico (p)" ) metric2S = str( float(metric1S) * 1.0 * pow(10, 12) );
  if ( unitM1 == "base" && unitM2 == "nano (n)" )  metric2S = str( float(metric1S) * 1.0 * pow(10, 9) );
  if ( unitM1 == "base" && unitM2 == "micro (µ)" ) metric2S = str( float(metric1S) * 1.0 * pow(10, 6) );
  if ( unitM1 == "base" && unitM2 == "milli (m)" ) metric2S = str( float(metric1S) * 1.0 * pow(10, 3) );
  if ( unitM1 == "base" && unitM2 == "centi (c)" ) metric2S = str( float(metric1S) * 1.0 * pow(10, 2) );
  if ( unitM1 == "base" && unitM2 == "deci (d)" ) metric2S = str( float(metric1S) * 1.0 * pow(10, 1) );
  if ( unitM1 == "base" && unitM2 == "base" ) metric2S = metric1S;
  if ( unitM1 == "base" && unitM2 == "deca (da)" ) metric2S = str( float(metric1S) * 1.0 * pow(10, -1) ); 
  if ( unitM1 == "base" && unitM2 == "hecto (h)" ) metric2S = str( float(metric1S) * 1.0 * pow(10, -2) );
  if ( unitM1 == "base" && unitM2 == "kilo (k)" ) metric2S = str( float(metric1S) * 1.0 * pow(10, -3) );
  if ( unitM1 == "base" && unitM2 == "mega (M)" ) metric2S = str( float(metric1S) * 1.0 * pow(10, -6) );
  if ( unitM1 == "base" && unitM2 == "giga (G)" ) metric2S = str( float(metric1S) * 1.0 * pow(10, -9) );
  if ( unitM1 == "base" && unitM2 == "tera (T)" ) metric2S = str( float(metric1S) * 1.0 * pow(10, -12) );
  
  if ( unitM1 == "deca (da)" && unitM2 == "pico (p)" ) metric2S = str( float(metric1S) * 1.0 * pow(10, 13) );
  if ( unitM1 == "deca (da)" && unitM2 == "nano (n)" )  metric2S = str( float(metric1S) * 1.0 * pow(10, 10) );
  if ( unitM1 == "deca (da)" && unitM2 == "micro (µ)" ) metric2S = str( float(metric1S) * 1.0 * pow(10, 7) );
  if ( unitM1 == "deca (da)" && unitM2 == "milli (m)" ) metric2S = str( float(metric1S) * 1.0 * pow(10, 4) );
  if ( unitM1 == "deca (da)" && unitM2 == "centi (c)" ) metric2S = str( float(metric1S) * 1.0 * pow(10, 3) );
  if ( unitM1 == "deca (da)" && unitM2 == "deci (d)" ) metric2S = str( float(metric1S) * 1.0 * pow(10, 2) );
  if ( unitM1 == "deca (da)" && unitM2 == "base" ) metric2S = str( float(metric1S) * 1.0 * pow(10, 1) );
  if ( unitM1 == "deca (da)" && unitM2 == "deca (da)" ) metric2S = metric1S; 
  if ( unitM1 == "deca (da)" && unitM2 == "hecto (h)" ) metric2S = str( float(metric1S) * 1.0 * pow(10, -1) );
  if ( unitM1 == "deca (da)" && unitM2 == "kilo (k)" ) metric2S = str( float(metric1S) * 1.0 * pow(10, -2) );
  if ( unitM1 == "deca (da)" && unitM2 == "mega (M)" ) metric2S = str( float(metric1S) * 1.0 * pow(10, -5) );
  if ( unitM1 == "deca (da)" && unitM2 == "giga (G)" ) metric2S = str( float(metric1S) * 1.0 * pow(10, -8) );
  if ( unitM1 == "deca (da)" && unitM2 == "tera (T)" ) metric2S = str( float(metric1S) * 1.0 * pow(10, -11) );
  
  if ( unitM1 == "hecto (h)" && unitM2 == "pico (p)" ) metric2S = str( float(metric1S) * 1.0 * pow(10, 14) );
  if ( unitM1 == "hecto (h)" && unitM2 == "nano (n)" )  metric2S = str( float(metric1S) * 1.0 * pow(10, 11) );
  if ( unitM1 == "hecto (h)" && unitM2 == "micro (µ)" ) metric2S = str( float(metric1S) * 1.0 * pow(10, 8) );
  if ( unitM1 == "hecto (h)" && unitM2 == "milli (m)" ) metric2S = str( float(metric1S) * 1.0 * pow(10, 5) );
  if ( unitM1 == "hecto (h)" && unitM2 == "centi (c)" ) metric2S = str( float(metric1S) * 1.0 * pow(10, 4) );
  if ( unitM1 == "hecto (h)" && unitM2 == "deci (d)" ) metric2S = str( float(metric1S) * 1.0 * pow(10, 3) );
  if ( unitM1 == "hecto (h)" && unitM2 == "base" ) metric2S = str( float(metric1S) * 1.0 * pow(10, 2) );
  if ( unitM1 == "hecto (h)" && unitM2 == "deca (da)" ) metric2S = str( float(metric1S) * 1.0 * pow(10, 1) ); 
  if ( unitM1 == "hecto (h)" && unitM2 == "hecto (h)" ) metric2S = metric1S;
  if ( unitM1 == "hecto (h)" && unitM2 == "kilo (k)" ) metric2S = str( float(metric1S) * 1.0 * pow(10, -1) );
  if ( unitM1 == "hecto (h)" && unitM2 == "mega (M)" ) metric2S = str( float(metric1S) * 1.0 * pow(10, -4) );
  if ( unitM1 == "hecto (h)" && unitM2 == "giga (G)" ) metric2S = str( float(metric1S) * 1.0 * pow(10, -7) );
  if ( unitM1 == "hecto (h)" && unitM2 == "tera (T)" ) metric2S = str( float(metric1S) * 1.0 * pow(10, -10) );
  
  if ( unitM1 == "kilo (k)" && unitM2 == "pico (p)" ) metric2S = str( float(metric1S) * 1.0 * pow(10, 15) );
  if ( unitM1 == "kilo (k)" && unitM2 == "nano (n)" )  metric2S = str( float(metric1S) * 1.0 * pow(10, 12) );
  if ( unitM1 == "kilo (k)" && unitM2 == "micro (µ)" ) metric2S = str( float(metric1S) * 1.0 * pow(10, 9) );
  if ( unitM1 == "kilo (k)" && unitM2 == "milli (m)" ) metric2S = str( float(metric1S) * 1.0 * pow(10, 6) );
  if ( unitM1 == "kilo (k)" && unitM2 == "centi (c)" ) metric2S = str( float(metric1S) * 1.0 * pow(10, 5) );
  if ( unitM1 == "kilo (k)" && unitM2 == "deci (d)" ) metric2S = str( float(metric1S) * 1.0 * pow(10, 4) );
  if ( unitM1 == "kilo (k)" && unitM2 == "base" ) metric2S = str( float(metric1S) * 1.0 * pow(10, 3) );
  if ( unitM1 == "kilo (k)" && unitM2 == "deca (da)" ) metric2S = str( float(metric1S) * 1.0 * pow(10, 2) ); 
  if ( unitM1 == "kilo (k)" && unitM2 == "hecto (h)" ) metric2S = str( float(metric1S) * 1.0 * pow(10, 1) );
  if ( unitM1 == "kilo (k)" && unitM2 == "kilo (k)" ) metric2S = metric1S;
  if ( unitM1 == "kilo (k)" && unitM2 == "mega (M)" ) metric2S = str( float(metric1S) * 1.0 * pow(10, -3) );
  if ( unitM1 == "kilo (k)" && unitM2 == "giga (G)" ) metric2S = str( float(metric1S) * 1.0 * pow(10, -6) );
  if ( unitM1 == "kilo (k)" && unitM2 == "tera (T)" ) metric2S = str( float(metric1S) * 1.0 * pow(10, -9) );
  
  if ( unitM1 == "mega (M)" && unitM2 == "pico (p)" ) metric2S = str( float(metric1S) * 1.0 * pow(10, 18) );
  if ( unitM1 == "mega (M)" && unitM2 == "nano (n)" )  metric2S = str( float(metric1S) * 1.0 * pow(10, 15) );
  if ( unitM1 == "mega (M)" && unitM2 == "micro (µ)" ) metric2S = str( float(metric1S) * 1.0 * pow(10, 12) );
  if ( unitM1 == "mega (M)" && unitM2 == "milli (m)" ) metric2S = str( float(metric1S) * 1.0 * pow(10, 9) );
  if ( unitM1 == "mega (M)" && unitM2 == "centi (c)" ) metric2S = str( float(metric1S) * 1.0 * pow(10, 8) );
  if ( unitM1 == "mega (M)" && unitM2 == "deci (d)" ) metric2S = str( float(metric1S) * 1.0 * pow(10, 7) );
  if ( unitM1 == "mega (M)" && unitM2 == "base" ) metric2S = str( float(metric1S) * 1.0 * pow(10, 6) );
  if ( unitM1 == "mega (M)" && unitM2 == "deca (da)" ) metric2S = str( float(metric1S) * 1.0 * pow(10, 5) ); 
  if ( unitM1 == "mega (M)" && unitM2 == "hecto (h)" ) metric2S = str( float(metric1S) * 1.0 * pow(10, 4) );
  if ( unitM1 == "mega (M)" && unitM2 == "kilo (k)" ) metric2S = str( float(metric1S) * 1.0 * pow(10, 3) );
  if ( unitM1 == "mega (M)" && unitM2 == "mega (M)" ) metric2S = metric1S;
  if ( unitM1 == "mega (M)" && unitM2 == "giga (G)" ) metric2S = str( float(metric1S) * 1.0 * pow(10, -3) );
  if ( unitM1 == "mega (M)" && unitM2 == "tera (T)" ) metric2S = str( float(metric1S) * 1.0 * pow(10, -6) );
  
  if ( unitM1 == "giga (G)" && unitM2 == "pico (p)" ) metric2S = str( float(metric1S) * 1.0 * pow(10, 21) );
  if ( unitM1 == "giga (G)" && unitM2 == "nano (n)" )  metric2S = str( float(metric1S) * 1.0 * pow(10, 18) );
  if ( unitM1 == "giga (G)" && unitM2 == "micro (µ)" ) metric2S = str( float(metric1S) * 1.0 * pow(10, 15) );
  if ( unitM1 == "giga (G)" && unitM2 == "milli (m)" ) metric2S = str( float(metric1S) * 1.0 * pow(10, 12) );
  if ( unitM1 == "giga (G)" && unitM2 == "centi (c)" ) metric2S = str( float(metric1S) * 1.0 * pow(10, 11) );
  if ( unitM1 == "giga (G)" && unitM2 == "deci (d)" ) metric2S = str( float(metric1S) * 1.0 * pow(10, 10) );
  if ( unitM1 == "giga (G)" && unitM2 == "base" ) metric2S = str( float(metric1S) * 1.0 * pow(10, 9) );
  if ( unitM1 == "giga (G)" && unitM2 == "deca (da)" ) metric2S = str( float(metric1S) * 1.0 * pow(10, 8) ); 
  if ( unitM1 == "giga (G)" && unitM2 == "hecto (h)" ) metric2S = str( float(metric1S) * 1.0 * pow(10, 7) );
  if ( unitM1 == "giga (G)" && unitM2 == "kilo (k)" ) metric2S = str( float(metric1S) * 1.0 * pow(10, 6) );
  if ( unitM1 == "giga (G)" && unitM2 == "mega (M)" ) metric2S = str( float(metric1S) * 1.0 * pow(10, 3) );
  if ( unitM1 == "giga (G)" && unitM2 == "giga (G)" ) metric2S = metric1S;
  if ( unitM1 == "giga (G)" && unitM2 == "tera (T)" ) metric2S = str( float(metric1S) * 1.0 * pow(10, -3) );
  
  if ( unitM1 == "tera (T)" && unitM2 == "pico (p)" ) metric2S = str( float(metric1S) * 1.0 * pow(10, 24) );
  if ( unitM1 == "tera (T)" && unitM2 == "nano (n)" )  metric2S = str( float(metric1S) * 1.0 * pow(10, 21) );
  if ( unitM1 == "tera (T)" && unitM2 == "micro (µ)" ) metric2S = str( float(metric1S) * 1.0 * pow(10, 18) );
  if ( unitM1 == "tera (T)" && unitM2 == "milli (m)" ) metric2S = str( float(metric1S) * 1.0 * pow(10, 15) );
  if ( unitM1 == "tera (T)" && unitM2 == "centi (c)" ) metric2S = str( float(metric1S) * 1.0 * pow(10, 14) );
  if ( unitM1 == "tera (T)" && unitM2 == "deci (d)" ) metric2S = str( float(metric1S) * 1.0 * pow(10, 13) );
  if ( unitM1 == "tera (T)" && unitM2 == "base" ) metric2S = str( float(metric1S) * 1.0 * pow(10, 12) );
  if ( unitM1 == "tera (T)" && unitM2 == "deca (da)" ) metric2S = str( float(metric1S) * 1.0 * pow(10, 11) ); 
  if ( unitM1 == "tera (T)" && unitM2 == "hecto (h)" ) metric2S = str( float(metric1S) * 1.0 * pow(10, 10) );
  if ( unitM1 == "tera (T)" && unitM2 == "kilo (k)" ) metric2S = str( float(metric1S) * 1.0 * pow(10, 9) );
  if ( unitM1 == "tera (T)" && unitM2 == "mega (M)" ) metric2S = str( float(metric1S) * 1.0 * pow(10, 6) );
  if ( unitM1 == "tera (T)" && unitM2 == "giga (G)" ) metric2S = str( float(metric1S) * 1.0 * pow(10, 3) );
  if ( unitM1 == "tera (T)" && unitM2 == "tera (T)" ) metric2S = metric1S;
}