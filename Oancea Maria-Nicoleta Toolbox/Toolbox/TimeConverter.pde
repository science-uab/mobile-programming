/*
  created by Oancea Maria-Nicoleta
  email: oanceamarianicoleta@gmail.com
  MIT license
*/

String time1S = "";
String time2S = "";

String unitT1 = "";
String unitT2 = "";

//the function, where the time converter interface is created
void timeConverter(){
  strokeWeight(3);
  stroke(#0000ff);
  fill(#0000ff);
  textAlign(CENTER, TOP);
  textSize(height/20);
  imageMode(CORNER);
  rect(0, 0, width, height/10 );
  fill(#ffffff);
  text("Time Converter", width/2+20, height/30);
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
  text(time1S, 20, height/6.8);  
  text(time2S, width/2+40, height/6.8);  
  textSize(height/25);
  text(unitT1, 20, height/5);  
  text(unitT2, width/2+40, height/5);

 if (valueKeyboard.length() <= 15 ) time1S = valueKeyboard; 
 if (unitT1 != "" && unitT2 != "" && time1S != "" ) convertsTime();
  
  textSize(height/35);
  noFill();
  rect(10, height/4, width/2-40, 13*height/20);
  rect(width/2+30, height/4, width/2-40, 13*height/20);
  noStroke();
  if (mouseX > 10 && mouseX < width/2-30 && mouseY > height/4 && mouseY <  height/4+height/20 ) fill(#aaaaaa);
  else fill(#ffffff); 
  rect(10, height/4, width/2-40, height/20);
  fill(#000000);
  text("nanosecond", 20, height/3.8); 
  if (mouseX > 10 && mouseX < width/2-30 && mouseY > height/4+height/20 && mouseY <  height/4+2*height/20 ) fill(#aaaaaa);
  else fill(#ffffff); 
  rect(10, height/4+height/20, width/2-40, height/20);
  fill(#000000);
  text("microsecond", 20, height/3.8+height/20); 
  if (mouseX > 10 && mouseX < width/2-30 && mouseY > height/4+2*height/20 && mouseY <  height/4+3*height/20 ) fill(#aaaaaa);
  else fill(#ffffff); 
  rect(10, height/4+2*height/20, width/2-40, height/20);
  fill(#000000);
  text("millisecond", 20, height/3.8+2*height/20); 
  if (mouseX > 10 && mouseX < width/2-30 && mouseY > height/4+3*height/20 && mouseY <  height/4+4*height/20 ) fill(#aaaaaa);
  else fill(#ffffff); 
  rect(10, height/4+3*height/20, width/2-40, height/20);
  fill(#000000);
  text("second", 20, height/3.8+3*height/20); 
  if (mouseX > 10 && mouseX < width/2-30 && mouseY > height/4+4*height/20 && mouseY <  height/4+5*height/20 ) fill(#aaaaaa);
  else fill(#ffffff); 
  rect(10, height/4+4*height/20, width/2-40, height/20);
  fill(#000000);
  text("minute", 20, height/3.8+4*height/20); 
  if (mouseX > 10 && mouseX < width/2-30 && mouseY > height/4+5*height/20 && mouseY <  height/4+6*height/20 ) fill(#aaaaaa);
  else fill(#ffffff); 
  rect(10, height/4+5*height/20, width/2-40, height/20);
  fill(#000000);
  text("hour", 20, height/3.8+5*height/20); 
  if (mouseX > 10 && mouseX < width/2-30 && mouseY > height/4+6*height/20 && mouseY <  height/4+7*height/20 ) fill(#aaaaaa);
  else fill(#ffffff); 
  rect(10, height/4+6*height/20, width/2-40, height/20);
  fill(#000000);
  text("day", 20, height/3.8+6*height/20); 
  if (mouseX > 10 && mouseX < width/2-30 && mouseY > height/4+7*height/20 && mouseY <  height/4+8*height/20 ) fill(#aaaaaa);
  else fill(#ffffff); 
  rect(10, height/4+7*height/20, width/2-40, height/20);
  fill(#000000);
  text("week", 20, height/3.8+7*height/20); 
  if (mouseX > 10 && mouseX < width/2-30 && mouseY > height/4+8*height/20 && mouseY <  height/4+9*height/20 ) fill(#aaaaaa);
  else fill(#ffffff); 
  rect(10, height/4+8*height/20, width/2-40, height/20);
  fill(#000000);
  text("month", 20, height/3.8+8*height/20); 
  if (mouseX > 10 && mouseX < width/2-30 && mouseY > height/4+9*height/20 && mouseY <  height/4+10*height/20 ) fill(#aaaaaa);
  else fill(#ffffff); 
  rect(10, height/4+9*height/20, width/2-40, height/20);
  fill(#000000);
  text("year", 20, height/3.8+9*height/20); 
  if (mouseX > 10 && mouseX < width/2-30 && mouseY > height/4+10*height/20 && mouseY <  height/4+11*height/20 ) fill(#aaaaaa);
  else fill(#ffffff); 
  rect(10, height/4+10*height/20, width/2-40, height/20);
  fill(#000000);
  text("decade", 20, height/3.8+10*height/20); 
  if (mouseX > 10 && mouseX < width/2-30 && mouseY > height/4+11*height/20 && mouseY <  height/4+12*height/20 ) fill(#aaaaaa);
  else fill(#ffffff); 
  rect(10, height/4+11*height/20, width/2-40, height/20);
  fill(#000000);
  text("century", 20, height/3.8+11*height/20); 
  if (mouseX > 10 && mouseX < width/2-30 && mouseY > height/4+12*height/20 && mouseY <  height/4+13*height/20 ) fill(#aaaaaa);
  else fill(#ffffff); 
  rect(10, height/4+12*height/20, width/2-40, height/20);
  fill(#000000);
  text("millennium", 20, height/3.8+12*height/20); 
  
  if (mouseX > width/2+30 && mouseX < width-10 && mouseY > height/4 && mouseY <  height/4+height/20 ) fill(#aaaaaa);
  else fill(#ffffff); 
  rect(width/2+30, height/4, width/2-40, height/20);
  fill(#000000);
  text("nanosecond", width/2+40, height/3.8); 
  if (mouseX > width/2+30 && mouseX < width-10 && mouseY > height/4+height/20 && mouseY <  height/4+2*height/20 ) fill(#aaaaaa);
  else fill(#ffffff); 
  rect(width/2+30, height/4+height/20, width/2-40, height/20);
  fill(#000000);
  text("microsecond", width/2+40, height/3.8+height/20); 
  if (mouseX > width/2+30 && mouseX < width-10 && mouseY > height/4+2*height/20 && mouseY <  height/4+3*height/20 ) fill(#aaaaaa);
  else fill(#ffffff); 
  rect(width/2+30, height/4+2*height/20, width/2-40, height/20);
  fill(#000000);
  text("millisecond", width/2+40, height/3.8+2*height/20); 
  if (mouseX > width/2+30 && mouseX < width-10 && mouseY > height/4+3*height/20 && mouseY <  height/4+4*height/20 ) fill(#aaaaaa);
  else fill(#ffffff); 
  rect(width/2+30, height/4+3*height/20, width/2-40, height/20);
  fill(#000000);
  text("second", width/2+40, height/3.8+3*height/20); 
  if (mouseX > width/2+30 && mouseX < width-10 && mouseY > height/4+4*height/20 && mouseY <  height/4+5*height/20 ) fill(#aaaaaa);
  else fill(#ffffff); 
  rect(width/2+30, height/4+4*height/20, width/2-40, height/20);
  fill(#000000);
  text("minute", width/2+40, height/3.8+4*height/20); 
  if (mouseX > width/2+30 && mouseX < width-10 && mouseY > height/4+5*height/20 && mouseY <  height/4+6*height/20 ) fill(#aaaaaa);
  else fill(#ffffff); 
  rect(width/2+30, height/4+5*height/20, width/2-40, height/20);
  fill(#000000);
  text("hour", width/2+40, height/3.8+5*height/20); 
  if (mouseX > width/2+30 && mouseX < width-10 && mouseY > height/4+6*height/20 && mouseY <  height/4+7*height/20 ) fill(#aaaaaa);
  else fill(#ffffff); 
  rect(width/2+30, height/4+6*height/20, width/2-40, height/20);
  fill(#000000);
  text("day", width/2+40, height/3.8+6*height/20); 
  if (mouseX > width/2+30 && mouseX < width-10 && mouseY > height/4+7*height/20 && mouseY <  height/4+8*height/20 ) fill(#aaaaaa);
  else fill(#ffffff); 
  rect(width/2+30, height/4+7*height/20, width/2-40, height/20);
  fill(#000000);
  text("week", width/2+40, height/3.8+7*height/20); 
  if (mouseX > width/2+30 && mouseX < width-10 && mouseY > height/4+8*height/20 && mouseY <  height/4+9*height/20 ) fill(#aaaaaa);
  else fill(#ffffff); 
  rect(width/2+30, height/4+8*height/20, width/2-40, height/20);
  fill(#000000);
  text("month", width/2+40, height/3.8+8*height/20); 
  if (mouseX > width/2+30 && mouseX < width-10 && mouseY > height/4+9*height/20 && mouseY <  height/4+10*height/20 ) fill(#aaaaaa);
  else fill(#ffffff); 
  rect(width/2+30, height/4+9*height/20, width/2-40, height/20);
  fill(#000000);
  text("year", width/2+40, height/3.8+9*height/20); 
  if (mouseX > width/2+30 && mouseX < width-10 && mouseY > height/4+10*height/20 && mouseY <  height/4+11*height/20 ) fill(#aaaaaa);
  else fill(#ffffff); 
  rect(width/2+30, height/4+10*height/20, width/2-40, height/20);
  fill(#000000);
  text("decade", width/2+40, height/3.8+10*height/20); 
  if (mouseX > width/2+30 && mouseX < width-10 && mouseY > height/4+11*height/20 && mouseY <  height/4+12*height/20 ) fill(#aaaaaa);
  else fill(#ffffff); 
  rect(width/2+30, height/4+11*height/20, width/2-40, height/20);
  fill(#000000);
  text("century", width/2+40, height/3.8+11*height/20); 
  if (mouseX > width/2+30 && mouseX < width-10 && mouseY > height/4+12*height/20 && mouseY <  height/4+13*height/20 ) fill(#aaaaaa);
  else fill(#ffffff); 
  rect(width/2+30, height/4+12*height/20, width/2-40, height/20);
  fill(#000000);
  text("millennium", width/2+40, height/3.8+12*height/20); 
}

//the function, where defines actions on the time converter page
void timeConverterClick(){
  if ( mouseX > width/36 && mouseX < width/36+width/6.5 && mouseY > height/60 && mouseY < height/60+height/15 ) {
    page = 7;
    activeKeyboard = false;
    unitT1 = unitT2 = time1S = time2S = valueKeyboard = "";
  }

  if ( mouseX > 10 && mouseX < width/2-30 && mouseY > height/7 && mouseY < height/7+height/12 ) activeKeyboard = true;
  
  if(!activeKeyboard) {
    if (mouseX > 10 && mouseX < width/2-30 && mouseY > height/4 && mouseY <  height/4+height/20 ) unitT1 = "nanosecond";
    if (mouseX > 10 && mouseX < width/2-30 && mouseY > height/4+height/20 && mouseY <  height/4+2*height/20 ) unitT1 = "microsecond";
    if (mouseX > 10 && mouseX < width/2-30 && mouseY > height/4+2*height/20 && mouseY <  height/4+3*height/20 ) unitT1 = "millisecond";
    if (mouseX > 10 && mouseX < width/2-30 && mouseY > height/4+3*height/20 && mouseY <  height/4+4*height/20 ) unitT1 = "second";
    if (mouseX > 10 && mouseX < width/2-30 && mouseY > height/4+4*height/20 && mouseY <  height/4+5*height/20 ) unitT1 = "minute";
    if (mouseX > 10 && mouseX < width/2-30 && mouseY > height/4+5*height/20 && mouseY <  height/4+6*height/20 ) unitT1 = "hour";
    if (mouseX > 10 && mouseX < width/2-30 && mouseY > height/4+6*height/20 && mouseY <  height/4+7*height/20 ) unitT1 = "day";
    if (mouseX > 10 && mouseX < width/2-30 && mouseY > height/4+7*height/20 && mouseY <  height/4+8*height/20 ) unitT1 = "week";
    if (mouseX > 10 && mouseX < width/2-30 && mouseY > height/4+8*height/20 && mouseY <  height/4+9*height/20 ) unitT1 = "month"; 
    if (mouseX > 10 && mouseX < width/2-30 && mouseY > height/4+9*height/20 && mouseY <  height/4+10*height/20 ) unitT1 = "year"; 
    if (mouseX > 10 && mouseX < width/2-30 && mouseY > height/4+10*height/20 && mouseY <  height/4+11*height/20 ) unitT1 = "decade";   
    if (mouseX > 10 && mouseX < width/2-30 && mouseY > height/4+11*height/20 && mouseY <  height/4+12*height/20 ) unitT1 = "century"; 
    if (mouseX > 10 && mouseX < width/2-30 && mouseY > height/4+12*height/20 && mouseY <  height/4+13*height/20 ) unitT1 = "millennium"; 
    
    if (mouseX > width/2+30 && mouseX < width-10 && mouseY > height/4 && mouseY <  height/4+height/20 ) unitT2 = "nanosecond";
    if (mouseX > width/2+30 && mouseX < width-10 && mouseY > height/4+height/20 && mouseY <  height/4+2*height/20 ) unitT2 = "microsecond";
    if (mouseX > width/2+30 && mouseX < width-10 && mouseY > height/4+2*height/20 && mouseY <  height/4+3*height/20 ) unitT2 = "millisecond";
    if (mouseX > width/2+30 && mouseX < width-10 && mouseY > height/4+3*height/20 && mouseY <  height/4+4*height/20 ) unitT2 = "second";
    if (mouseX > width/2+30 && mouseX < width-10 && mouseY > height/4+4*height/20 && mouseY <  height/4+5*height/20 ) unitT2 = "minute";
    if (mouseX > width/2+30 && mouseX < width-10 && mouseY > height/4+5*height/20 && mouseY <  height/4+6*height/20 ) unitT2 = "hour";
    if (mouseX > width/2+30 && mouseX < width-10 && mouseY > height/4+6*height/20 && mouseY <  height/4+7*height/20 ) unitT2 = "day";
    if (mouseX > width/2+30 && mouseX < width-10 && mouseY > height/4+7*height/20 && mouseY <  height/4+8*height/20 ) unitT2 = "week";
    if (mouseX > width/2+30 && mouseX < width-10 && mouseY > height/4+8*height/20 && mouseY <  height/4+9*height/20 ) unitT2 = "month"; 
    if (mouseX > width/2+30 && mouseX < width-10 && mouseY > height/4+9*height/20 && mouseY <  height/4+10*height/20 ) unitT2 = "year";  
    if (mouseX > width/2+30 && mouseX < width-10 && mouseY > height/4+10*height/20 && mouseY <  height/4+11*height/20 ) unitT2 = "decade"; 
    if (mouseX > width/2+30 && mouseX < width-10 && mouseY > height/4+11*height/20 && mouseY <  height/4+12*height/20 ) unitT2 = "century"; 
    if (mouseX > width/2+30 && mouseX < width-10 && mouseY > height/4+12*height/20 && mouseY <  height/4+13*height/20 ) unitT2 = "millennium";
  }
}

//the function in which an angle is converted from unit1 to unit2
void convertsTime(){  
  if ( unitT1 == "nanosecond" && unitT2 == "nanosecond" ) time2S = time1S;
  if ( unitT1 == "nanosecond" && unitT2 == "microsecond" ) time2S = str( float(time1S) * 1.0 * pow(10, -3) );
  if ( unitT1 == "nanosecond" && unitT2 == "millisecond" ) time2S = str( float(time1S) * 1.0 * pow(10, -6) );
  if ( unitT1 == "nanosecond" && unitT2 == "second" ) time2S = str( float(time1S) * 1.0 * pow(10, -9) );
  if ( unitT1 == "nanosecond" && unitT2 == "minute" ) time2S = str( float(time1S) * 1.666666666667 * pow(10, -11) );
  if ( unitT1 == "nanosecond" && unitT2 == "hour" ) time2S = str( float(time1S) * 2.777777777778 * pow(10, -13) );
  if ( unitT1 == "nanosecond" && unitT2 == "day" ) time2S = str( float(time1S) * 1.15740741 * pow(10, -14) );
  if ( unitT1 == "nanosecond" && unitT2 == "week" ) time2S = str( float(time1S) * 1.65343915 * pow(10, -15) ); 
  if ( unitT1 == "nanosecond" && unitT2 == "month" ) time2S = str( float(time1S) * 3.80265176 * pow(10, -16) );
  if ( unitT1 == "nanosecond" && unitT2 == "year" ) time2S = str( float(time1S) * 3.16887646 * pow(10, -17) );
  if ( unitT1 == "nanosecond" && unitT2 == "decade" ) time2S = str( float(time1S) * 3.16887646 * pow(10, -18) );
  if ( unitT1 == "nanosecond" && unitT2 == "century" ) time2S = str( float(time1S) * 3.16887646 * pow(10, -19) );
  if ( unitT1 == "nanosecond" && unitT2 == "millennium" ) time2S = str( float(time1S) * 3.16887646 * pow(10, -20) );
  
  if ( unitT1 == "microsecond" && unitT2 == "nanosecond" ) time2S = str( float(time1S) * 1.0 * pow(10, 3) );
  if ( unitT1 == "microsecond" && unitT2 == "microsecond" ) time2S = time1S ;
  if ( unitT1 == "microsecond" && unitT2 == "millisecond" ) time2S = str( float(time1S) * 1.0 * pow(10, -3) );
  if ( unitT1 == "microsecond" && unitT2 == "second" ) time2S = str( float(time1S) * 1.0 * pow(10, -6) );
  if ( unitT1 == "microsecond" && unitT2 == "minute" ) time2S = str( float(time1S) * 1.666666666667 * pow(10, -8) );
  if ( unitT1 == "microsecond" && unitT2 == "hour" ) time2S = str( float(time1S) * 2.777777777778 * pow(10, -10) );
  if ( unitT1 == "microsecond" && unitT2 == "day" ) time2S = str( float(time1S) * 1.15740741 * pow(10, -11) );
  if ( unitT1 == "microsecond" && unitT2 == "week" ) time2S = str( float(time1S) * 1.65343915 * pow(10, -12) ); 
  if ( unitT1 == "microsecond" && unitT2 == "month" ) time2S = str( float(time1S) * 3.80265176 * pow(10, -13) );
  if ( unitT1 == "microsecond" && unitT2 == "year" ) time2S = str( float(time1S) * 3.16887646 * pow(10, -14) );
  if ( unitT1 == "microsecond" && unitT2 == "decade" ) time2S = str( float(time1S) * 3.16887646 * pow(10, -15) );
  if ( unitT1 == "microsecond" && unitT2 == "century" ) time2S = str( float(time1S) * 3.16887646 * pow(10, -16) );
  if ( unitT1 == "microsecond" && unitT2 == "millennium" ) time2S = str( float(time1S) * 3.16887646 * pow(10, -17) );
  
  if ( unitT1 == "millisecond" && unitT2 == "nanosecond" ) time2S = str( float(time1S) * 1.0 * pow(10, 6) );
  if ( unitT1 == "millisecond" && unitT2 == "microsecond" )  time2S = str( float(time1S) * 1.0 * pow(10, 3) );
  if ( unitT1 == "millisecond" && unitT2 == "millisecond" ) time2S = time1S;
  if ( unitT1 == "millisecond" && unitT2 == "second" ) time2S = str( float(time1S) * 1.0 * pow(10, -3) );
  if ( unitT1 == "millisecond" && unitT2 == "minute" ) time2S = str( float(time1S) * 1.66666667 * pow(10, -5) );
  if ( unitT1 == "millisecond" && unitT2 == "hour" ) time2S = str( float(time1S) * 2.77777778 * pow(10, -7) );
  if ( unitT1 == "millisecond" && unitT2 == "day" ) time2S = str( float(time1S) * 1.15740741 * pow(10, -8) );
  if ( unitT1 == "millisecond" && unitT2 == "week" ) time2S = str( float(time1S) * 1.65343915 * pow(10, -9) ); 
  if ( unitT1 == "millisecond" && unitT2 == "month" ) time2S = str( float(time1S) * 3.80265176 * pow(10, -10) );
  if ( unitT1 == "millisecond" && unitT2 == "year" ) time2S = str( float(time1S) * 3.16887646 * pow(10, -11) );
  if ( unitT1 == "millisecond" && unitT2 == "decade" ) time2S = str( float(time1S) * 3.16887646 * pow(10, -12) );
  if ( unitT1 == "millisecond" && unitT2 == "century" ) time2S = str( float(time1S) * 3.16887646 * pow(10, -13) );
  if ( unitT1 == "millisecond" && unitT2 == "millennium" ) time2S = str( float(time1S) * 3.16887646 * pow(10, -14) );
  
  if ( unitT1 == "second" && unitT2 == "nanosecond" ) time2S = str( float(time1S) * 1.0 * pow(10, 9) );
  if ( unitT1 == "second" && unitT2 == "microsecond" )  time2S = str( float(time1S) * 1.0 * pow(10, 6) );
  if ( unitT1 == "second" && unitT2 == "millisecond" ) time2S = str( float(time1S) * 1.0 * pow(10, 3) );
  if ( unitT1 == "second" && unitT2 == "second" ) time2S = time1S;
  if ( unitT1 == "second" && unitT2 == "minute" ) time2S = str( float(time1S) * 0.0166666667 );
  if ( unitT1 == "second" && unitT2 == "hour" ) time2S = str( float(time1S) * 0.000277777778 );
  if ( unitT1 == "second" && unitT2 == "day" ) time2S = str( float(time1S) * 1.15740741 * pow(10, -5) );
  if ( unitT1 == "second" && unitT2 == "week" ) time2S = str( float(time1S) * 1.65343915 * pow(10, -6) ); 
  if ( unitT1 == "second" && unitT2 == "month" ) time2S = str( float(time1S) * 3.80265176 * pow(10, -7) );
  if ( unitT1 == "second" && unitT2 == "year" ) time2S = str( float(time1S) * 3.16887646 * pow(10, -8) );
  if ( unitT1 == "second" && unitT2 == "decade" ) time2S = str( float(time1S) * 3.16887646 * pow(10, -9) );
  if ( unitT1 == "second" && unitT2 == "century" ) time2S = str( float(time1S) * 3.16887646 * pow(10, -10) );
  if ( unitT1 == "second" && unitT2 == "millennium" ) time2S = str( float(time1S) * 3.16887646 * pow(10, -11) );
  
  if ( unitT1 == "minute" && unitT2 == "nanosecond" ) time2S = str( float(time1S) * 6 * pow(10, 10) );
  if ( unitT1 == "minute" && unitT2 == "microsecond" )  time2S = str( float(time1S) * 6 * pow(10, 7) );
  if ( unitT1 == "minute" && unitT2 == "millisecond" ) time2S = str( float(time1S) * 6 * pow(10, 4) );
  if ( unitT1 == "minute" && unitT2 == "second" ) time2S = str( float(time1S) * 6 * pow(10, 1) );
  if ( unitT1 == "minute" && unitT2 == "minute" ) time2S = time1S;
  if ( unitT1 == "minute" && unitT2 == "hour" ) time2S = str( float(time1S) * 0.0166666667 );
  if ( unitT1 == "minute" && unitT2 == "day" ) time2S = str( float(time1S) * 0.000694444444 );
  if ( unitT1 == "minute" && unitT2 == "week" ) time2S = str( float(time1S) * 9.92063492 * pow(10, -5) ); 
  if ( unitT1 == "minute" && unitT2 == "month" ) time2S = str( float(time1S) * 2.28159105 * pow(10, -5) );
  if ( unitT1 == "minute" && unitT2 == "year" ) time2S = str( float(time1S) * 1.90132588 * pow(10, -6) );
  if ( unitT1 == "minute" && unitT2 == "decade" ) time2S = str( float(time1S) * 1.90132588 * pow(10, -7) );
  if ( unitT1 == "minute" && unitT2 == "century" ) time2S = str( float(time1S) * 1.90132588 * pow(10, -8) );
  if ( unitT1 == "minute" && unitT2 == "millennium" ) time2S = str( float(time1S) * 1.90132588 * pow(10, -9) );
  
  if ( unitT1 == "hour" && unitT2 == "nanosecond" ) time2S = str( float(time1S) * 36 * pow(10, 11) );
  if ( unitT1 == "hour" && unitT2 == "microsecond" )  time2S = str( float(time1S) * 36 * pow(10, 8) );
  if ( unitT1 == "hour" && unitT2 == "millisecond" ) time2S = str( float(time1S) * 36 * pow(10, 5) );
  if ( unitT1 == "hour" && unitT2 == "second" ) time2S = str( float(time1S) * 3600 );
  if ( unitT1 == "hour" && unitT2 == "minute" ) time2S = str( float(time1S) * 60  );
  if ( unitT1 == "hour" && unitT2 == "hour" ) time2S = time1S;
  if ( unitT1 == "hour" && unitT2 == "day" ) time2S = str( float(time1S) * 0.0416666667 );
  if ( unitT1 == "hour" && unitT2 == "week" ) time2S = str( float(time1S) * 0.00595238095 ); 
  if ( unitT1 == "hour" && unitT2 == "month" ) time2S = str( float(time1S) * 0.00136895463 );
  if ( unitT1 == "hour" && unitT2 == "year" ) time2S = str( float(time1S) * 0.000114079553 );
  if ( unitT1 == "hour" && unitT2 == "decade" ) time2S = str( float(time1S) * 1.14079553 * pow(10, -5) );
  if ( unitT1 == "hour" && unitT2 == "century" ) time2S = str( float(time1S) * 1.14079553 * pow(10, -6) );
  if ( unitT1 == "hour" && unitT2 == "millennium" ) time2S = str( float(time1S) * 1.14079553 * pow(10, -7) );
  
  if ( unitT1 == "day" && unitT2 == "nanosecond" ) time2S = str( float(time1S) * 8.64 * pow(10, 13) );
  if ( unitT1 == "day" && unitT2 == "microsecond" )  time2S = str( float(time1S) * 8.64 * pow(10, 10) );
  if ( unitT1 == "day" && unitT2 == "millisecond" ) time2S = str( float(time1S) * 8.64 * pow(10, 7) );
  if ( unitT1 == "day" && unitT2 == "second" ) time2S = str( float(time1S) * 8.64 * pow(10, 4) );
  if ( unitT1 == "day" && unitT2 == "minute" ) time2S = str( float(time1S) * 1440 );
  if ( unitT1 == "day" && unitT2 == "hour" ) time2S = str( float(time1S) * 24 );
  if ( unitT1 == "day" && unitT2 == "day" ) time2S = time1S;
  if ( unitT1 == "day" && unitT2 == "week" ) time2S = str( float(time1S) * 0.142857143 ); 
  if ( unitT1 == "day" && unitT2 == "month" ) time2S = str( float(time1S) * 0.0328549112 );
  if ( unitT1 == "day" && unitT2 == "year" ) time2S = str( float(time1S) * 0.00273790926 );
  if ( unitT1 == "day" && unitT2 == "decade" ) time2S = str( float(time1S) * 2.73790926 * pow(10, -4) );
  if ( unitT1 == "day" && unitT2 == "century" ) time2S = str( float(time1S) * 2.73790926 * pow(10, -5) );
  if ( unitT1 == "day" && unitT2 == "millennium" ) time2S = str( float(time1S) * 2.73790926 * pow(10, -6) );
  
  if ( unitT1 == "week" && unitT2 == "nanosecond" ) time2S = str( float(time1S) * 6.04800 * pow(10, 14) );
  if ( unitT1 == "week" && unitT2 == "microsecond" )  time2S = str( float(time1S) * 6.048 * pow(10, 11) );
  if ( unitT1 == "week" && unitT2 == "millisecond" ) time2S = str( float(time1S) * 6.048 * pow(10, 8) );
  if ( unitT1 == "week" && unitT2 == "second" ) time2S = str( float(time1S) * 6.048 * pow(10, 5) );
  if ( unitT1 == "week" && unitT2 == "minute" ) time2S = str( float(time1S) * 10080 );
  if ( unitT1 == "week" && unitT2 == "hour" ) time2S = str( float(time1S) * 168 );
  if ( unitT1 == "week" && unitT2 == "day" ) time2S = str( float(time1S) * 7 );
  if ( unitT1 == "week" && unitT2 == "week" ) time2S = time1S; 
  if ( unitT1 == "week" && unitT2 == "month" ) time2S = str( float(time1S) * 0.229984378 );
  if ( unitT1 == "week" && unitT2 == "year" ) time2S = str( float(time1S) * 0.0191653649 );
  if ( unitT1 == "week" && unitT2 == "decade" ) time2S = str( float(time1S) * 1.91653649 * pow(10, -3) );
  if ( unitT1 == "week" && unitT2 == "century" ) time2S = str( float(time1S) * 1.91653649 * pow(10, -4) );
  if ( unitT1 == "week" && unitT2 == "millennium" ) time2S = str( float(time1S) * 1.91653649 * pow(10, -5) );
  
  if ( unitT1 == "month" && unitT2 == "nanosecond" ) time2S = str( float(time1S) * 2.62974383  * pow(10, 15) );
  if ( unitT1 == "month" && unitT2 == "microsecond" )  time2S = str( float(time1S) * 2.62974383  * pow(10, 12) );
  if ( unitT1 == "month" && unitT2 == "millisecond" ) time2S = str( float(time1S) * 2.62974383  * pow(10, 9) );
  if ( unitT1 == "month" && unitT2 == "second" ) time2S = str( float(time1S) * 2629743.83 );
  if ( unitT1 == "month" && unitT2 == "minute" ) time2S = str( float(time1S) * 43829.0639 );
  if ( unitT1 == "month" && unitT2 == "hour" ) time2S = str( float(time1S) * 730.484398  );
  if ( unitT1 == "month" && unitT2 == "day" ) time2S = str( float(time1S) * 30.4368499 );
  if ( unitT1 == "month" && unitT2 == "week" ) time2S = str( float(time1S) * 4.34812141 ); 
  if ( unitT1 == "month" && unitT2 == "month" ) time2S = time1S;
  if ( unitT1 == "month" && unitT2 == "year" ) time2S = str( float(time1S) * 0.0833333333 );
  if ( unitT1 == "month" && unitT2 == "decade" ) time2S = str( float(time1S) * 8.33333333 * pow(10, -3) );
  if ( unitT1 == "month" && unitT2 == "century" ) time2S = str( float(time1S) * 8.33333333 * pow(10, -4) );
  if ( unitT1 == "month" && unitT2 == "millennium" ) time2S = str( float(time1S) * 8.33333333 * pow(10, -5) );
  
  if ( unitT1 == "year" && unitT2 == "nanosecond" ) time2S = str( float(time1S) * 3.1556926 * pow(10, 16) );
  if ( unitT1 == "year" && unitT2 == "microsecond" )  time2S = str( float(time1S) * 3.1556926 * pow(10, 13) );
  if ( unitT1 == "year" && unitT2 == "millisecond" ) time2S = str( float(time1S) * 3.1556926 * pow(10, 10) );
  if ( unitT1 == "year" && unitT2 == "second" ) time2S = str( float(time1S) * 3.1556926 * pow(10, 7) );
  if ( unitT1 == "year" && unitT2 == "minute" ) time2S = str( float(time1S) * 525948.766 );
  if ( unitT1 == "year" && unitT2 == "hour" ) time2S = str( float(time1S) * 8765.81277 );
  if ( unitT1 == "year" && unitT2 == "day" ) time2S = str( float(time1S) * 365.242199 );
  if ( unitT1 == "year" && unitT2 == "week" ) time2S = str( float(time1S) * 52.177457 ); 
  if ( unitT1 == "year" && unitT2 == "month" ) time2S = str( float(time1S) * 12 );
  if ( unitT1 == "year" && unitT2 == "year" ) time2S = time1S;
  if ( unitT1 == "year" && unitT2 == "decade" ) time2S = str( float(time1S) * 0.1 );
  if ( unitT1 == "year" && unitT2 == "century" ) time2S = str( float(time1S) * 0.01 );
  if ( unitT1 == "year" && unitT2 == "millennium" ) time2S = str( float(time1S) * 0.001 );
  
  if ( unitT1 == "decade" && unitT2 == "nanosecond" ) time2S = str( float(time1S) * 3.1556926 * pow(10, 17) );
  if ( unitT1 == "decade" && unitT2 == "microsecond" )  time2S = str( float(time1S) * 3.1556926 * pow(10, 14) );
  if ( unitT1 == "decade" && unitT2 == "millisecond" ) time2S = str( float(time1S) * 3.1556926 * pow(10, 11) );
  if ( unitT1 == "decade" && unitT2 == "second" ) time2S = str( float(time1S) * 3.1556926 * pow(10, 5) );
  if ( unitT1 == "decade" && unitT2 == "minute" ) time2S = str( float(time1S) * 5259487.66 );
  if ( unitT1 == "decade" && unitT2 == "hour" ) time2S = str( float(time1S) * 87658.1277 );
  if ( unitT1 == "decade" && unitT2 == "day" ) time2S = str( float(time1S) * 3652.42199 );
  if ( unitT1 == "decade" && unitT2 == "week" ) time2S = str( float(time1S) * 521.77457  ); 
  if ( unitT1 == "decade" && unitT2 == "month" ) time2S = str( float(time1S) * 120 );
  if ( unitT1 == "decade" && unitT2 == "year" ) time2S = str( float(time1S) * 10 );
  if ( unitT1 == "decade" && unitT2 == "decade" ) time2S = time1S;
  if ( unitT1 == "decade" && unitT2 == "century" ) time2S = str( float(time1S) * 0.1 );
  if ( unitT1 == "decade" && unitT2 == "millennium" ) time2S = str( float(time1S) * 0.01 );
  
  if ( unitT1 == "century" && unitT2 == "nanosecond" ) time2S = str( float(time1S) * 3.1556926 * pow(10, 18) );
  if ( unitT1 == "century" && unitT2 == "microsecond" )  time2S = str( float(time1S) * 3.1556926 * pow(10, 15) );
  if ( unitT1 == "century" && unitT2 == "millisecond" ) time2S = str( float(time1S) * 3.1556926 * pow(10, 12) );
  if ( unitT1 == "century" && unitT2 == "second" ) time2S = str( float(time1S) * 3.1556926 * pow(10, 9) );
  if ( unitT1 == "century" && unitT2 == "minute" ) time2S = str( float(time1S) * 52594876.6 );
  if ( unitT1 == "century" && unitT2 == "hour" ) time2S = str( float(time1S) * 876581.277 );
  if ( unitT1 == "century" && unitT2 == "day" ) time2S = str( float(time1S) * 36524.2199 );
  if ( unitT1 == "century" && unitT2 == "week" ) time2S = str( float(time1S) * 5217.7457 ); 
  if ( unitT1 == "century" && unitT2 == "month" ) time2S = str( float(time1S) * 1200 );
  if ( unitT1 == "century" && unitT2 == "year" ) time2S = str( float(time1S) * 100 );
  if ( unitT1 == "century" && unitT2 == "decade" ) time2S = str( float(time1S) * 10 );
  if ( unitT1 == "century" && unitT2 == "century" ) time2S = time1S;
  if ( unitT1 == "century" && unitT2 == "millennium" ) time2S = str( float(time1S) * 0.1 );
  
  if ( unitT1 == "millennium" && unitT2 == "nanosecond" ) time2S = str( float(time1S) * 3.1556926 * pow(10, 19) );
  if ( unitT1 == "millennium" && unitT2 == "microsecond" )  time2S = str( float(time1S) * 3.1556926 * pow(10, 16) );
  if ( unitT1 == "millennium" && unitT2 == "millisecond" ) time2S = str( float(time1S) * 3.1556926 * pow(10, 13) );
  if ( unitT1 == "millennium" && unitT2 == "second" ) time2S = str( float(time1S) * 3.1556926 * pow(10, 10) );
  if ( unitT1 == "millennium" && unitT2 == "minute" ) time2S = str( float(time1S) * 525948766 );
  if ( unitT1 == "millennium" && unitT2 == "hour" ) time2S = str( float(time1S) * 8765812.77 );
  if ( unitT1 == "millennium" && unitT2 == "day" ) time2S = str( float(time1S) * 365242.199 );
  if ( unitT1 == "millennium" && unitT2 == "week" ) time2S = str( float(time1S) * 52177.457 ); 
  if ( unitT1 == "millennium" && unitT2 == "month" ) time2S = str( float(time1S) * 12000 );
  if ( unitT1 == "millennium" && unitT2 == "year" ) time2S = str( float(time1S) * 1000 );
  if ( unitT1 == "millennium" && unitT2 == "decade" ) time2S = str( float(time1S) * 100 );
  if ( unitT1 == "millennium" && unitT2 == "century" ) time2S = str( float(time1S) * 10 );
  if ( unitT1 == "millennium" && unitT2 == "millennium" ) time2S = time1S;
}