/*
  created by Oancea Maria-Nicoleta
  email: oanceamarianicoleta@gmail.com
  MIT license
*/

String weight1S = "";
String weight2S = "";

String unitW1 = "";
String unitW2 = "";

//the function, where the weight converter interface is created
void weightConverter(){
  strokeWeight(3);
  stroke(#0000ff);
  fill(#0000ff);
  textAlign(CENTER, TOP);
  textSize(height/20);
  imageMode(CORNER);
  rect(0, 0, width, height/10 );
  fill(#ffffff);
  text("Weight Converter", width/2+40, height/30);
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
  text(weight1S, 20, height/6.8);  
  text(weight2S, width/2+40, height/6.8);  
  textSize(height/27);
  text(unitW1, 20, height/5);  
  text(unitW2, width/2+40, height/5);

 if (valueKeyboard.length() <= 15 ) weight1S = valueKeyboard; 
 if (unitW1 != "" && unitW2 != "" && weight1S != "" ) convertsWeight();
  
  textSize(height/35);
  noFill();
  rect(10, height/4, width/2-40, 8*height/20);
  rect(width/2+30, height/4, width/2-40, 8*height/20);
  noStroke();
  if (mouseX > 10 && mouseX < width/2-30 && mouseY > height/4 && mouseY <  height/4+height/20 ) fill(#aaaaaa);
  else fill(#ffffff); 
  rect(10, height/4, width/2-40, height/20);
  fill(#000000);
  text("milligram (mg)", 20, height/3.8); 
  if (mouseX > 10 && mouseX < width/2-30 && mouseY > height/4+height/20 && mouseY <  height/4+2*height/20 ) fill(#aaaaaa);
  else fill(#ffffff); 
  rect(10, height/4+height/20, width/2-40, height/20);
  fill(#000000);
  text("centigram (cg)", 20, height/3.8+height/20); 
  if (mouseX > 10 && mouseX < width/2-30 && mouseY > height/4+2*height/20 && mouseY <  height/4+3*height/20 ) fill(#aaaaaa);
  else fill(#ffffff); 
  rect(10, height/4+2*height/20, width/2-40, height/20);
  fill(#000000);
  text("decigram (dg)", 20, height/3.8+2*height/20); 
  if (mouseX > 10 && mouseX < width/2-30 && mouseY > height/4+3*height/20 && mouseY <  height/4+4*height/20 ) fill(#aaaaaa);
  else fill(#ffffff); 
  rect(10, height/4+3*height/20, width/2-40, height/20);
  fill(#000000);
  text("gram (g)", 20, height/3.8+3*height/20); 
  if (mouseX > 10 && mouseX < width/2-30 && mouseY > height/4+4*height/20 && mouseY <  height/4+5*height/20 ) fill(#aaaaaa);
  else fill(#ffffff); 
  rect(10, height/4+4*height/20, width/2-40, height/20);
  fill(#000000);
  text("decagram (dag)", 20, height/3.8+4*height/20); 
  if (mouseX > 10 && mouseX < width/2-30 && mouseY > height/4+5*height/20 && mouseY <  height/4+6*height/20 ) fill(#aaaaaa);
  else fill(#ffffff); 
  rect(10, height/4+5*height/20, width/2-40, height/20);
  fill(#000000);
  text("hectogram (hg)", 20, height/3.8+5*height/20); 
  if (mouseX > 10 && mouseX < width/2-30 && mouseY > height/4+6*height/20 && mouseY <  height/4+7*height/20 ) fill(#aaaaaa);
  else fill(#ffffff); 
  rect(10, height/4+6*height/20, width/2-40, height/20);
  fill(#000000);
  text("kilogram (kg)", 20, height/3.8+6*height/20); 
  if (mouseX > 10 && mouseX < width/2-30 && mouseY > height/4+7*height/20 && mouseY <  height/4+8*height/20 ) fill(#aaaaaa);
  else fill(#ffffff); 
  rect(10, height/4+7*height/20, width/2-40, height/20);
  fill(#000000);
  text("tonne (t)", 20, height/3.8+7*height/20); 
  
  if (mouseX > width/2+30 && mouseX < width-10 && mouseY > height/4 && mouseY <  height/4+height/20 ) fill(#aaaaaa);
  else fill(#ffffff); 
  rect(width/2+30, height/4, width/2-40, height/20);
  fill(#000000);
  text("milligram (mg)", width/2+40, height/3.8); 
  if (mouseX > width/2+30 && mouseX < width-10 && mouseY > height/4+height/20 && mouseY <  height/4+2*height/20 ) fill(#aaaaaa);
  else fill(#ffffff); 
  rect(width/2+30, height/4+height/20, width/2-40, height/20);
  fill(#000000);
  text("centigram (cg)", width/2+40, height/3.8+height/20); 
  if (mouseX > width/2+30 && mouseX < width-10 && mouseY > height/4+2*height/20 && mouseY <  height/4+3*height/20 ) fill(#aaaaaa);
  else fill(#ffffff); 
  rect(width/2+30, height/4+2*height/20, width/2-40, height/20);
  fill(#000000);
  text("decigram (dg)", width/2+40, height/3.8+2*height/20); 
  if (mouseX > width/2+30 && mouseX < width-10 && mouseY > height/4+3*height/20 && mouseY <  height/4+4*height/20 ) fill(#aaaaaa);
  else fill(#ffffff); 
  rect(width/2+30, height/4+3*height/20, width/2-40, height/20);
  fill(#000000);
  text("gram (g)", width/2+40, height/3.8+3*height/20); 
  if (mouseX > width/2+30 && mouseX < width-10 && mouseY > height/4+4*height/20 && mouseY <  height/4+5*height/20 ) fill(#aaaaaa);
  else fill(#ffffff); 
  rect(width/2+30, height/4+4*height/20, width/2-40, height/20);
  fill(#000000);
  text("decagram (dag)", width/2+40, height/3.8+4*height/20); 
  if (mouseX > width/2+30 && mouseX < width-10 && mouseY > height/4+5*height/20 && mouseY <  height/4+6*height/20 ) fill(#aaaaaa);
  else fill(#ffffff); 
  rect(width/2+30, height/4+5*height/20, width/2-40, height/20);
  fill(#000000);
  text("hectogram (hg)", width/2+40, height/3.8+5*height/20); 
  if (mouseX > width/2+30 && mouseX < width-10 && mouseY > height/4+6*height/20 && mouseY <  height/4+7*height/20 ) fill(#aaaaaa);
  else fill(#ffffff); 
  rect(width/2+30, height/4+6*height/20, width/2-40, height/20);
  fill(#000000);
  text("kilogram (kg)", width/2+40, height/3.8+6*height/20); 
  if (mouseX > width/2+30 && mouseX < width-10 && mouseY > height/4+7*height/20 && mouseY <  height/4+8*height/20 ) fill(#aaaaaa);
  else fill(#ffffff); 
  rect(width/2+30, height/4+7*height/20, width/2-40, height/20);
  fill(#000000);
  text("tonne (t)", width/2+40, height/3.8+7*height/20); 

}

//the function, where defines actions on the weight converter page
void weightConverterClick(){
  if ( mouseX > width/36 && mouseX < width/36+width/6.5 && mouseY > height/60 && mouseY < height/60+height/15 ) {
    page = 7;
    activeKeyboard = false;
    unitW1 = unitW2 = weight1S = weight2S = valueKeyboard = "";
  }

  if ( mouseX > 10 && mouseX < width/2-30 && mouseY > height/7 && mouseY < height/7+height/12 ) activeKeyboard = true;
  
  if(!activeKeyboard) {
    if (mouseX > 10 && mouseX < width/2-30 && mouseY > height/4 && mouseY <  height/4+height/20 ) unitW1 = "milligram (mg)";
    if (mouseX > 10 && mouseX < width/2-30 && mouseY > height/4+height/20 && mouseY <  height/4+2*height/20 ) unitW1 = "centigram (cg)";
    if (mouseX > 10 && mouseX < width/2-30 && mouseY > height/4+2*height/20 && mouseY <  height/4+3*height/20 ) unitW1 = "decigram (dg)";
    if (mouseX > 10 && mouseX < width/2-30 && mouseY > height/4+3*height/20 && mouseY <  height/4+4*height/20 ) unitW1 = "gram (g)";
    if (mouseX > 10 && mouseX < width/2-30 && mouseY > height/4+4*height/20 && mouseY <  height/4+5*height/20 ) unitW1 = "decagram (dag)";
    if (mouseX > 10 && mouseX < width/2-30 && mouseY > height/4+5*height/20 && mouseY <  height/4+6*height/20 ) unitW1 = "hectogram (hg)";
    if (mouseX > 10 && mouseX < width/2-30 && mouseY > height/4+6*height/20 && mouseY <  height/4+7*height/20 ) unitW1 = "kilogram (kg)";
    if (mouseX > 10 && mouseX < width/2-30 && mouseY > height/4+7*height/20 && mouseY <  height/4+8*height/20 ) unitW1 = "tonne (t)";
    
    if (mouseX > width/2+30 && mouseX < width-10 && mouseY > height/4 && mouseY <  height/4+height/20 ) unitW2 = "milligram (mg)";
    if (mouseX > width/2+30 && mouseX < width-10 && mouseY > height/4+height/20 && mouseY <  height/4+2*height/20 ) unitW2 = "centigram (cg)";
    if (mouseX > width/2+30 && mouseX < width-10 && mouseY > height/4+2*height/20 && mouseY <  height/4+3*height/20 ) unitW2 = "decigram (dg)";
    if (mouseX > width/2+30 && mouseX < width-10 && mouseY > height/4+3*height/20 && mouseY <  height/4+4*height/20 ) unitW2 = "gram (g)";
    if (mouseX > width/2+30 && mouseX < width-10 && mouseY > height/4+4*height/20 && mouseY <  height/4+5*height/20 ) unitW2 = "decagram (dag)";
    if (mouseX > width/2+30 && mouseX < width-10 && mouseY > height/4+5*height/20 && mouseY <  height/4+6*height/20 ) unitW2 = "hectogram (hg)";
    if (mouseX > width/2+30 && mouseX < width-10 && mouseY > height/4+6*height/20 && mouseY <  height/4+7*height/20 ) unitW2 = "kilogram (kg)";
    if (mouseX > width/2+30 && mouseX < width-10 && mouseY > height/4+7*height/20 && mouseY <  height/4+8*height/20 ) unitW2 = "tonne (t)";
  }
}

//the function in which an weight is converted from unit1 to unit2
void convertsWeight(){  
  if ( unitW1 == "milligram (mg)" && unitW2 == "milligram (mg)" ) weight2S = weight1S;
  if ( unitW1 == "milligram (mg)" && unitW2 == "centigram (cg)" ) weight2S = str( float(weight1S) * 0.1 );
  if ( unitW1 == "milligram (mg)" && unitW2 == "decigram (dg)" ) weight2S = str( float(weight1S) * 0.01 );
  if ( unitW1 == "milligram (mg)" && unitW2 == "gram (g)" ) weight2S = str( float(weight1S) * 1.0 * pow(10, -3) );
  if ( unitW1 == "milligram (mg)" && unitW2 == "decagram (dag)" ) weight2S = str( float(weight1S) * 1.0 * pow(10, -4) );
  if ( unitW1 == "milligram (mg)" && unitW2 == "hectogram (hg)" ) weight2S = str( float(weight1S) * 1.0 * pow(10, -5) );
  if ( unitW1 == "milligram (mg)" && unitW2 == "kilogram (kg)" ) weight2S = str( float(weight1S) * 1.0 * pow(10, -6) );
  if ( unitW1 == "milligram (mg)" && unitW2 == "tonne (t)" ) weight2S = str( float(weight1S) * 1.0 * pow(10, -9) ); 
  
  if ( unitW1 == "centigram (cg)" && unitW2 == "milligram (mg)" ) weight2S = str( float(weight1S) * 10 );
  if ( unitW1 == "centigram (cg)" && unitW2 == "centigram (cg)" ) weight2S = weight1S ;
  if ( unitW1 == "centigram (cg)" && unitW2 == "decigram (dg)" ) weight2S = str( float(weight1S) * 0.1 );
  if ( unitW1 == "centigram (cg)" && unitW2 == "gram (g)" ) weight2S = str( float(weight1S) * 0.01 );
  if ( unitW1 == "centigram (cg)" && unitW2 == "decagram (dag)" ) weight2S = str( float(weight1S) * 1.0 * pow(10, -3) );
  if ( unitW1 == "centigram (cg)" && unitW2 == "hectogram (hg)" ) weight2S = str( float(weight1S) * 1.0 * pow(10, -4) );
  if ( unitW1 == "centigram (cg)" && unitW2 == "kilogram (kg)" ) weight2S = str( float(weight1S) * 1.0 * pow(10, -5) );
  if ( unitW1 == "centigram (cg)" && unitW2 == "tonne (t)" ) weight2S = str( float(weight1S) * 1.0 * pow(10, -8) ); 
  
  if ( unitW1 == "decigram (dg)" && unitW2 == "milligram (mg)" ) weight2S = str( float(weight1S) * 100 );
  if ( unitW1 == "decigram (dg)" && unitW2 == "centigram (cg)" )  weight2S = str( float(weight1S) * 10 );
  if ( unitW1 == "decigram (dg)" && unitW2 == "decigram (dg)" ) weight2S = weight1S;
  if ( unitW1 == "decigram (dg)" && unitW2 == "gram (g)" ) weight2S = str( float(weight1S) * 0.1 );
  if ( unitW1 == "decigram (dg)" && unitW2 == "decagram (dag)" ) weight2S = str( float(weight1S) * 0.01 );
  if ( unitW1 == "decigram (dg)" && unitW2 == "hectogram (hg)" ) weight2S = str( float(weight1S) * 1.0 * pow(10, -3) );
  if ( unitW1 == "decigram (dg)" && unitW2 == "kilogram (kg)" ) weight2S = str( float(weight1S) * 1.0 * pow(10, -4) );
  if ( unitW1 == "decigram (dg)" && unitW2 == "tonne (t)" ) weight2S = str( float(weight1S) * 1.0 * pow(10, -7) ); 
  
  if ( unitW1 == "gram (g)" && unitW2 == "milligram (mg)" ) weight2S = str( float(weight1S) * 1.0 * pow(10, 3) );
  if ( unitW1 == "gram (g)" && unitW2 == "centigram (cg)" )  weight2S = str( float(weight1S) * 100 );
  if ( unitW1 == "gram (g)" && unitW2 == "decigram (dg)" ) weight2S = str( float(weight1S) * 10 );
  if ( unitW1 == "gram (g)" && unitW2 == "gram (g)" ) weight2S = weight1S;
  if ( unitW1 == "gram (g)" && unitW2 == "decagram (dag)" ) weight2S = str( float(weight1S) * 0.1 );
  if ( unitW1 == "gram (g)" && unitW2 == "hectogram (hg)" ) weight2S = str( float(weight1S) * 1.0 * pow(10, -2) );
  if ( unitW1 == "gram (g)" && unitW2 == "kilogram (kg)" ) weight2S = str( float(weight1S) * 1.0 * pow(10, -3) );
  if ( unitW1 == "gram (g)" && unitW2 == "tonne (t)" ) weight2S = str( float(weight1S) * 1.0 * pow(10, -6) ); 
  
  if ( unitW1 == "decagram (dag)" && unitW2 == "milligram (mg)" ) weight2S = str( float(weight1S) * 1.0 * pow(10, 4) );
  if ( unitW1 == "decagram (dag)" && unitW2 == "centigram (cg)" )  weight2S = str( float(weight1S) * 1.0 * pow(10, 3) );
  if ( unitW1 == "decagram (dag)" && unitW2 == "decigram (dg)" ) weight2S = str( float(weight1S) * 100 );
  if ( unitW1 == "decagram (dag)" && unitW2 == "gram (g)" ) weight2S = str( float(weight1S) * 10 );
  if ( unitW1 == "decagram (dag)" && unitW2 == "decagram (dag)" ) weight2S = weight1S;
  if ( unitW1 == "decagram (dag)" && unitW2 == "hectogram (hg)" ) weight2S = str( float(weight1S) * 0.1 );
  if ( unitW1 == "decagram (dag)" && unitW2 == "kilogram (kg)" ) weight2S = str( float(weight1S) * 0.01 );
  if ( unitW1 == "decagram (dag)" && unitW2 == "tonne (t)" ) weight2S = str( float(weight1S) * 1.0 * pow(10, -5) ); 
  
  if ( unitW1 == "hectogram (hg)" && unitW2 == "milligram (mg)" ) weight2S = str( float(weight1S) * 1.0 * pow(10, 5) );
  if ( unitW1 == "hectogram (hg)" && unitW2 == "centigram (cg)" )  weight2S = str( float(weight1S) * 1.0 * pow(10, 4) );
  if ( unitW1 == "hectogram (hg)" && unitW2 == "decigram (dg)" ) weight2S = str( float(weight1S) * 1.0 * pow(10, 3) );
  if ( unitW1 == "hectogram (hg)" && unitW2 == "gram (g)" ) weight2S = str( float(weight1S) * 100 );
  if ( unitW1 == "hectogram (hg)" && unitW2 == "decagram (dag)" ) weight2S = str( float(weight1S) * 10 );
  if ( unitW1 == "hectogram (hg)" && unitW2 == "hectogram (hg)" ) weight2S = weight1S;
  if ( unitW1 == "hectogram (hg)" && unitW2 == "kilogram (kg)" ) weight2S = str( float(weight1S) * 0.1 );
  if ( unitW1 == "hectogram (hg)" && unitW2 == "tonne (t)" ) weight2S = str( float(weight1S) * 1.0 * pow(10, -4) ); 
  
  if ( unitW1 == "kilogram (kg)" && unitW2 == "milligram (mg)" ) weight2S = str( float(weight1S) * 1.0 * pow(10, 6) );
  if ( unitW1 == "kilogram (kg)" && unitW2 == "centigram (cg)" )  weight2S = str( float(weight1S) * 1.0 * pow(10, 5) );
  if ( unitW1 == "kilogram (kg)" && unitW2 == "decigram (dg)" ) weight2S = str( float(weight1S) * 1.0 * pow(10, 4) );
  if ( unitW1 == "kilogram (kg)" && unitW2 == "gram (g)" ) weight2S = str( float(weight1S) * 1.0 * pow(10, 3) );
  if ( unitW1 == "kilogram (kg)" && unitW2 == "decagram (dag)" ) weight2S = str( float(weight1S) * 100 );
  if ( unitW1 == "kilogram (kg)" && unitW2 == "hectogram (hg)" ) weight2S = str( float(weight1S) * 10 );
  if ( unitW1 == "kilogram (kg)" && unitW2 == "kilogram (kg)" ) weight2S = weight1S;
  if ( unitW1 == "kilogram (kg)" && unitW2 == "tonne (t)" ) weight2S = str( float(weight1S) * 0.001 ); 
  
  if ( unitW1 == "tonne (t)" && unitW2 == "milligram (mg)" ) weight2S = str( float(weight1S) * 1.0 * pow(10, 9) );
  if ( unitW1 == "tonne (t)" && unitW2 == "centigram (cg)" )  weight2S = str( float(weight1S) * 1.0 * pow(10, 8) );
  if ( unitW1 == "tonne (t)" && unitW2 == "decigram (dg)" ) weight2S = str( float(weight1S) * 1.0 * pow(10, 7) );
  if ( unitW1 == "tonne (t)" && unitW2 == "gram (g)" ) weight2S = str( float(weight1S) * 1.0 * pow(10, 6) );
  if ( unitW1 == "tonne (t)" && unitW2 == "decagram (dag)" ) weight2S = str( float(weight1S) * 1.0 * pow(10, 5) );
  if ( unitW1 == "tonne (t)" && unitW2 == "hectogram (hg)" ) weight2S = str( float(weight1S) * 1.0 * pow(10, 4) );
  if ( unitW1 == "tonne (t)" && unitW2 == "kilogram (kg)" ) weight2S = str( float(weight1S) * 1.0 * pow(10, 3) );
  if ( unitW1 == "tonne (t)" && unitW2 == "tonne (t)" ) weight2S = weight1S; 
  
}