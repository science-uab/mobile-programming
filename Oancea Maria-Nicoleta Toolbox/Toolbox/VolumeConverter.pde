/*
  created by Oancea Maria-Nicoleta
  email: oanceamarianicoleta@gmail.com
  MIT license
*/

String volume1S = "";
String volume2S = "";

String unitV1 = "";
String unitV2 = "";

//the function, where the volume converter interface is created
void volumeConverter(){
  strokeWeight(3);
  stroke(#0000ff);
  fill(#0000ff);
  textAlign(CENTER, TOP);
  textSize(height/20);
  imageMode(CORNER);
  rect(0, 0, width, height/10 );
  fill(#ffffff);
  text("Volume Converter", width/2+40, height/30);
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
  text(volume1S, 20, height/6.8);  
  text(volume2S, width/2+40, height/6.8);  
  textSize(height/30);
  text(unitV1, 20, height/5);  
  text(unitV2, width/2+40, height/5);

 if (valueKeyboard.length() <= 15 ) volume1S = valueKeyboard; 
 if (unitV1 != "" && unitV2 != "" && volume1S != "" ) convertsVolume();
  
  textSize(height/35);
  noFill();
  rect(10, height/4, width/2-40, 11*height/20);
  rect(width/2+30, height/4, width/2-40, 11*height/20);
  noStroke();
  if (mouseX > 10 && mouseX < width/2-30 && mouseY > height/4 && mouseY <  height/4+height/20 ) fill(#aaaaaa);
  else fill(#ffffff); 
  rect(10, height/4, width/2-40, height/20);
  fill(#000000);
  text("microliter / mm³", 20, height/3.8); 
  if (mouseX > 10 && mouseX < width/2-30 && mouseY > height/4+height/20 && mouseY <  height/4+2*height/20 ) fill(#aaaaaa);
  else fill(#ffffff); 
  rect(10, height/4+height/20, width/2-40, height/20);
  fill(#000000);
  text("ml / cm³", 20, height/3.8+height/20); 
  if (mouseX > 10 && mouseX < width/2-30 && mouseY > height/4+2*height/20 && mouseY <  height/4+3*height/20 ) fill(#aaaaaa);
  else fill(#ffffff); 
  rect(10, height/4+2*height/20, width/2-40, height/20);
  fill(#000000);
  text("centiliter (cl)", 20, height/3.8+2*height/20); 
  if (mouseX > 10 && mouseX < width/2-30 && mouseY > height/4+3*height/20 && mouseY <  height/4+4*height/20 ) fill(#aaaaaa);
  else fill(#ffffff); 
  rect(10, height/4+3*height/20, width/2-40, height/20);
  fill(#000000);
  text("deciliter (dl)", 20, height/3.8+3*height/20); 
  if (mouseX > 10 && mouseX < width/2-30 && mouseY > height/4+4*height/20 && mouseY <  height/4+5*height/20 ) fill(#aaaaaa);
  else fill(#ffffff); 
  rect(10, height/4+4*height/20, width/2-40, height/20);
  fill(#000000);
  text("liter(l) / dm³", 20, height/3.8+4*height/20); 
  if (mouseX > 10 && mouseX < width/2-30 && mouseY > height/4+5*height/20 && mouseY <  height/4+6*height/20 ) fill(#aaaaaa);
  else fill(#ffffff); 
  rect(10, height/4+5*height/20, width/2-40, height/20);
  fill(#000000);
  text("decaliter(dal)", 20, height/3.8+5*height/20); 
  if (mouseX > 10 && mouseX < width/2-30 && mouseY > height/4+6*height/20 && mouseY <  height/4+7*height/20 ) fill(#aaaaaa);
  else fill(#ffffff); 
  rect(10, height/4+6*height/20, width/2-40, height/20);
  fill(#000000);
  text("hectoliter(hl)", 20, height/3.8+6*height/20); 
  if (mouseX > 10 && mouseX < width/2-30 && mouseY > height/4+7*height/20 && mouseY <  height/4+8*height/20 ) fill(#aaaaaa);
  else fill(#ffffff); 
  rect(10, height/4+7*height/20, width/2-40, height/20);
  fill(#000000);
  text("kiloliter(kl) / m³", 20, height/3.8+7*height/20); 
  if (mouseX > 10 && mouseX < width/2-30 && mouseY > height/4+8*height/20 && mouseY <  height/4+9*height/20 ) fill(#aaaaaa);
  else fill(#ffffff); 
  rect(10, height/4+8*height/20, width/2-40, height/20);
  fill(#000000);
  text("dam³", 20, height/3.8+8*height/20); 
  if (mouseX > 10 && mouseX < width/2-30 && mouseY > height/4+9*height/20 && mouseY <  height/4+10*height/20 ) fill(#aaaaaa);
  else fill(#ffffff); 
  rect(10, height/4+9*height/20, width/2-40, height/20);
  fill(#000000);
  text("hm³", 20, height/3.8+9*height/20); 
  if (mouseX > 10 && mouseX < width/2-30 && mouseY > height/4+10*height/20 && mouseY <  height/4+11*height/20 ) fill(#aaaaaa);
  else fill(#ffffff); 
  rect(10, height/4+10*height/20, width/2-40, height/20);
  fill(#000000);
  text("km³", 20, height/3.8+10*height/20); 
  
  if (mouseX > width/2+30 && mouseX < width-10 && mouseY > height/4 && mouseY <  height/4+height/20 ) fill(#aaaaaa);
  else fill(#ffffff); 
  rect(width/2+30, height/4, width/2-40, height/20);
  fill(#000000);
  text("microliter / mm³", width/2+40, height/3.8); 
  if (mouseX > width/2+30 && mouseX < width-10 && mouseY > height/4+height/20 && mouseY <  height/4+2*height/20 ) fill(#aaaaaa);
  else fill(#ffffff); 
  rect(width/2+30, height/4+height/20, width/2-40, height/20);
  fill(#000000);
  text("ml / cm³", width/2+40, height/3.8+height/20); 
  if (mouseX > width/2+30 && mouseX < width-10 && mouseY > height/4+2*height/20 && mouseY <  height/4+3*height/20 ) fill(#aaaaaa);
  else fill(#ffffff); 
  rect(width/2+30, height/4+2*height/20, width/2-40, height/20);
  fill(#000000);
  text("centiliter (cl)", width/2+40, height/3.8+2*height/20); 
  if (mouseX > width/2+30 && mouseX < width-10 && mouseY > height/4+3*height/20 && mouseY <  height/4+4*height/20 ) fill(#aaaaaa);
  else fill(#ffffff); 
  rect(width/2+30, height/4+3*height/20, width/2-40, height/20);
  fill(#000000);
  text("deciliter (dl)", width/2+40, height/3.8+3*height/20); 
  if (mouseX > width/2+30 && mouseX < width-10 && mouseY > height/4+4*height/20 && mouseY <  height/4+5*height/20 ) fill(#aaaaaa);
  else fill(#ffffff); 
  rect(width/2+30, height/4+4*height/20, width/2-40, height/20);
  fill(#000000);
  text("liter(l) / dm³", width/2+40, height/3.8+4*height/20); 
  if (mouseX > width/2+30 && mouseX < width-10 && mouseY > height/4+5*height/20 && mouseY <  height/4+6*height/20 ) fill(#aaaaaa);
  else fill(#ffffff); 
  rect(width/2+30, height/4+5*height/20, width/2-40, height/20);
  fill(#000000);
  text("decaliter(dal)", width/2+40, height/3.8+5*height/20); 
  if (mouseX > width/2+30 && mouseX < width-10 && mouseY > height/4+6*height/20 && mouseY <  height/4+7*height/20 ) fill(#aaaaaa);
  else fill(#ffffff); 
  rect(width/2+30, height/4+6*height/20, width/2-40, height/20);
  fill(#000000);
  text("hectoliter(hl)", width/2+40, height/3.8+6*height/20); 
  if (mouseX > width/2+30 && mouseX < width-10 && mouseY > height/4+7*height/20 && mouseY <  height/4+8*height/20 ) fill(#aaaaaa);
  else fill(#ffffff); 
  rect(width/2+30, height/4+7*height/20, width/2-40, height/20);
  fill(#000000);
  text("kiloliter(kl) / m³", width/2+40, height/3.8+7*height/20); 
  if (mouseX > width/2+30 && mouseX < width-10 && mouseY > height/4+8*height/20 && mouseY <  height/4+9*height/20 ) fill(#aaaaaa);
  else fill(#ffffff); 
  rect(width/2+30, height/4+8*height/20, width/2-40, height/20);
  fill(#000000);
  text("dam³", width/2+40, height/3.8+8*height/20); 
  if (mouseX > width/2+30 && mouseX < width-10 && mouseY > height/4+9*height/20 && mouseY <  height/4+10*height/20 ) fill(#aaaaaa);
  else fill(#ffffff); 
  rect(width/2+30, height/4+9*height/20, width/2-40, height/20);
  fill(#000000);
  text("hm³", width/2+40, height/3.8+9*height/20); 
  if (mouseX > width/2+30 && mouseX < width-10 && mouseY > height/4+10*height/20 && mouseY <  height/4+11*height/20 ) fill(#aaaaaa);
  else fill(#ffffff); 
  rect(width/2+30, height/4+10*height/20, width/2-40, height/20);
  fill(#000000);
  text("km³", width/2+40, height/3.8+10*height/20); 

}

//the function, where defines actions on the volume converter page
void volumeConverterClick(){
  if ( mouseX > width/36 && mouseX < width/36+width/6.5 && mouseY > height/60 && mouseY < height/60+height/15 ) {
    page = 7;
    activeKeyboard = false;
    unitV1 = unitV2 = volume1S = volume2S = valueKeyboard = "";
  }

  if ( mouseX > 10 && mouseX < width/2-30 && mouseY > height/7 && mouseY < height/7+height/12 ) activeKeyboard = true;
  
  if(!activeKeyboard) {
    if (mouseX > 10 && mouseX < width/2-30 && mouseY > height/4 && mouseY <  height/4+height/20 ) unitV1 = "microliter / mm³";
    if (mouseX > 10 && mouseX < width/2-30 && mouseY > height/4+height/20 && mouseY <  height/4+2*height/20 ) unitV1 = "ml / cm³";
    if (mouseX > 10 && mouseX < width/2-30 && mouseY > height/4+2*height/20 && mouseY <  height/4+3*height/20 ) unitV1 = "centiliter (cl)";
    if (mouseX > 10 && mouseX < width/2-30 && mouseY > height/4+3*height/20 && mouseY <  height/4+4*height/20 ) unitV1 = "deciliter (dl)";
    if (mouseX > 10 && mouseX < width/2-30 && mouseY > height/4+4*height/20 && mouseY <  height/4+5*height/20 ) unitV1 = "liter(l) / dm³";
    if (mouseX > 10 && mouseX < width/2-30 && mouseY > height/4+5*height/20 && mouseY <  height/4+6*height/20 ) unitV1 = "decaliter(dal)";
    if (mouseX > 10 && mouseX < width/2-30 && mouseY > height/4+6*height/20 && mouseY <  height/4+7*height/20 ) unitV1 = "hectoliter(hl)";
    if (mouseX > 10 && mouseX < width/2-30 && mouseY > height/4+7*height/20 && mouseY <  height/4+8*height/20 ) unitV1 = "kiloliter(kl) / m³";
    if (mouseX > 10 && mouseX < width/2-30 && mouseY > height/4+8*height/20 && mouseY <  height/4+9*height/20 ) unitV1 = "dam³"; 
    if (mouseX > 10 && mouseX < width/2-30 && mouseY > height/4+9*height/20 && mouseY <  height/4+10*height/20 ) unitV1 = "hm³"; 
    if (mouseX > 10 && mouseX < width/2-30 && mouseY > height/4+10*height/20 && mouseY <  height/4+11*height/20 ) unitV1 = "km³"; 
    
    if (mouseX > width/2+30 && mouseX < width-10 && mouseY > height/4 && mouseY <  height/4+height/20 ) unitV2 = "microliter / mm³";
    if (mouseX > width/2+30 && mouseX < width-10 && mouseY > height/4+height/20 && mouseY <  height/4+2*height/20 ) unitV2 = "ml / cm³";
    if (mouseX > width/2+30 && mouseX < width-10 && mouseY > height/4+2*height/20 && mouseY <  height/4+3*height/20 ) unitV2 = "centiliter (cl)";
    if (mouseX > width/2+30 && mouseX < width-10 && mouseY > height/4+3*height/20 && mouseY <  height/4+4*height/20 ) unitV2 = "deciliter (dl)";
    if (mouseX > width/2+30 && mouseX < width-10 && mouseY > height/4+4*height/20 && mouseY <  height/4+5*height/20 ) unitV2 = "liter(l) / dm³";
    if (mouseX > width/2+30 && mouseX < width-10 && mouseY > height/4+5*height/20 && mouseY <  height/4+6*height/20 ) unitV2 = "decaliter(dal)";
    if (mouseX > width/2+30 && mouseX < width-10 && mouseY > height/4+6*height/20 && mouseY <  height/4+7*height/20 ) unitV2 = "hectoliter(hl)";
    if (mouseX > width/2+30 && mouseX < width-10 && mouseY > height/4+7*height/20 && mouseY <  height/4+8*height/20 ) unitV2 = "kiloliter(kl) / m³";
    if (mouseX > width/2+30 && mouseX < width-10 && mouseY > height/4+8*height/20 && mouseY <  height/4+9*height/20 ) unitV2 = "dam³"; 
    if (mouseX > width/2+30 && mouseX < width-10 && mouseY > height/4+9*height/20 && mouseY <  height/4+10*height/20 ) unitV2 = "hm³";  
    if (mouseX > width/2+30 && mouseX < width-10 && mouseY > height/4+10*height/20 && mouseY <  height/4+11*height/20 ) unitV2 = "km³"; 
  }
}

//the function in which a volume is converted from unit1 to unit2
void convertsVolume(){  
  if ( unitV1 == "microliter / mm³" && unitV2 == "microliter / mm³" ) volume2S = volume1S;
  if ( unitV1 == "microliter / mm³" && unitV2 == "ml / cm³" ) volume2S = str( float(volume1S) * 1.0 * pow(10, -3) );
  if ( unitV1 == "microliter / mm³" && unitV2 == "centiliter (cl)" ) volume2S = str( float(volume1S) * 1.0 * pow(10, -4) );
  if ( unitV1 == "microliter / mm³" && unitV2 == "deciliter (dl)" ) volume2S = str( float(volume1S) * 1.0 * pow(10, -5) );
  if ( unitV1 == "microliter / mm³" && unitV2 == "liter(l) / dm³" ) volume2S = str( float(volume1S) * 1.0 * pow(10, -6) );
  if ( unitV1 == "microliter / mm³" && unitV2 == "decaliter(dal)" ) volume2S = str( float(volume1S) * 1.0 * pow(10, -7) );
  if ( unitV1 == "microliter / mm³" && unitV2 == "hectoliter(hl)" ) volume2S = str( float(volume1S) * 1.0 * pow(10, -8) );
  if ( unitV1 == "microliter / mm³" && unitV2 == "kiloliter(kl) / m³" ) volume2S = str( float(volume1S) * 1.0 * pow(10, -9) ); 
  if ( unitV1 == "microliter / mm³" && unitV2 == "dam³" ) volume2S = str( float(volume1S) * 1.0 * pow(10, -12) );
  if ( unitV1 == "microliter / mm³" && unitV2 == "hm³" ) volume2S = str( float(volume1S) * 1.0 * pow(10, -15) );
  if ( unitV1 == "microliter / mm³" && unitV2 == "km³" ) volume2S = str( float(volume1S) * 1.0 * pow(10, -18) );
  
  if ( unitV1 == "ml / cm³" && unitV2 == "microliter / mm³" ) volume2S = str( float(volume1S) * 1.0 * pow(10, 3) );
  if ( unitV1 == "ml / cm³" && unitV2 == "ml / cm³" ) volume2S = volume1S ;
  if ( unitV1 == "ml / cm³" && unitV2 == "centiliter (cl)" ) volume2S = str( float(volume1S) * 0.1 );
  if ( unitV1 == "ml / cm³" && unitV2 == "deciliter (dl)" ) volume2S = str( float(volume1S) * 0.01 );
  if ( unitV1 == "ml / cm³" && unitV2 == "liter(l) / dm³" ) volume2S = str( float(volume1S) * 1.0 * pow(10, -3) );
  if ( unitV1 == "ml / cm³" && unitV2 == "decaliter(dal)" ) volume2S = str( float(volume1S) * 1.0 * pow(10, -4) );
  if ( unitV1 == "ml / cm³" && unitV2 == "hectoliter(hl)" ) volume2S = str( float(volume1S) * 1.0 * pow(10, -5) );
  if ( unitV1 == "ml / cm³" && unitV2 == "kiloliter(kl) / m³" ) volume2S = str( float(volume1S) * 1.0 * pow(10, -6) ); 
  if ( unitV1 == "ml / cm³" && unitV2 == "dam³" ) volume2S = str( float(volume1S) * 1.0 * pow(10, -9) );
  if ( unitV1 == "ml / cm³" && unitV2 == "hm³" ) volume2S = str( float(volume1S) * 1.0 * pow(10, -12) );
  if ( unitV1 == "ml / cm³" && unitV2 == "km³" ) volume2S = str( float(volume1S) * 1.0 * pow(10, -15) );
  
  if ( unitV1 == "centiliter (cl)" && unitV2 == "microliter / mm³" ) volume2S = str( float(volume1S) * 1.0 * pow(10, 4) );
  if ( unitV1 == "centiliter (cl)" && unitV2 == "ml / cm³" )  volume2S = str( float(volume1S) * 10 );
  if ( unitV1 == "centiliter (cl)" && unitV2 == "centiliter (cl)" ) volume2S = volume1S;
  if ( unitV1 == "centiliter (cl)" && unitV2 == "deciliter (dl)" ) volume2S = str( float(volume1S) * 0.1 );
  if ( unitV1 == "centiliter (cl)" && unitV2 == "liter(l) / dm³" ) volume2S = str( float(volume1S) * 0.01 );
  if ( unitV1 == "centiliter (cl)" && unitV2 == "decaliter(dal)" ) volume2S = str( float(volume1S) * 1.0 * pow(10, -3) );
  if ( unitV1 == "centiliter (cl)" && unitV2 == "hectoliter(hl)" ) volume2S = str( float(volume1S) * 1.0 * pow(10, -4) );
  if ( unitV1 == "centiliter (cl)" && unitV2 == "kiloliter(kl) / m³" ) volume2S = str( float(volume1S) * 1.0 * pow(10, -5) ); 
  if ( unitV1 == "centiliter (cl)" && unitV2 == "dam³" ) volume2S = str( float(volume1S) * 1.0 * pow(10, -8) );
  if ( unitV1 == "centiliter (cl)" && unitV2 == "hm³" ) volume2S = str( float(volume1S) * 1.0 * pow(10, -11) );
  if ( unitV1 == "centiliter (cl)" && unitV2 == "km³" ) volume2S = str( float(volume1S) * 1.0 * pow(10, -14) );
  
  if ( unitV1 == "deciliter (dl)" && unitV2 == "microliter / mm³" ) volume2S = str( float(volume1S) * 1.0 * pow(10, 5) );
  if ( unitV1 == "deciliter (dl)" && unitV2 == "ml / cm³" )  volume2S = str( float(volume1S) * 100 );
  if ( unitV1 == "deciliter (dl)" && unitV2 == "centiliter (cl)" ) volume2S = str( float(volume1S) * 10 );
  if ( unitV1 == "deciliter (dl)" && unitV2 == "deciliter (dl)" ) volume2S = volume1S;
  if ( unitV1 == "deciliter (dl)" && unitV2 == "liter(l) / dm³" ) volume2S = str( float(volume1S) * 0.1 );
  if ( unitV1 == "deciliter (dl)" && unitV2 == "decaliter(dal)" ) volume2S = str( float(volume1S) * 1.0 * pow(10, -2) );
  if ( unitV1 == "deciliter (dl)" && unitV2 == "hectoliter(hl)" ) volume2S = str( float(volume1S) * 1.0 * pow(10, -3) );
  if ( unitV1 == "deciliter (dl)" && unitV2 == "kiloliter(kl) / m³" ) volume2S = str( float(volume1S) * 1.0 * pow(10, -4) ); 
  if ( unitV1 == "deciliter (dl)" && unitV2 == "dam³" ) volume2S = str( float(volume1S) * 1.0 * pow(10, -7) );
  if ( unitV1 == "deciliter (dl)" && unitV2 == "hm³" ) volume2S = str( float(volume1S) * 1.0 * pow(10, -10) );
  if ( unitV1 == "deciliter (dl)" && unitV2 == "km³" ) volume2S = str( float(volume1S) * 1.0 * pow(10, -13) );
  
  if ( unitV1 == "liter(l) / dm³" && unitV2 == "microliter / mm³" ) volume2S = str( float(volume1S) * 1.0 * pow(10, 6) );
  if ( unitV1 == "liter(l) / dm³" && unitV2 == "ml / cm³" )  volume2S = str( float(volume1S) * 1.0 * pow(10, 3) );
  if ( unitV1 == "liter(l) / dm³" && unitV2 == "centiliter (cl)" ) volume2S = str( float(volume1S) * 100 );
  if ( unitV1 == "liter(l) / dm³" && unitV2 == "deciliter (dl)" ) volume2S = str( float(volume1S) * 10 );
  if ( unitV1 == "liter(l) / dm³" && unitV2 == "liter(l) / dm³" ) volume2S = volume1S;
  if ( unitV1 == "liter(l) / dm³" && unitV2 == "decaliter(dal)" ) volume2S = str( float(volume1S) * 0.1 );
  if ( unitV1 == "liter(l) / dm³" && unitV2 == "hectoliter(hl)" ) volume2S = str( float(volume1S) * 0.01 );
  if ( unitV1 == "liter(l) / dm³" && unitV2 == "kiloliter(kl) / m³" ) volume2S = str( float(volume1S) * 1.0 * pow(10, -3) ); 
  if ( unitV1 == "liter(l) / dm³" && unitV2 == "dam³" ) volume2S = str( float(volume1S) * 1.0 * pow(10, -6) );
  if ( unitV1 == "liter(l) / dm³" && unitV2 == "hm³" ) volume2S = str( float(volume1S) * 1.0 * pow(10, -9) );
  if ( unitV1 == "liter(l) / dm³" && unitV2 == "km³" ) volume2S = str( float(volume1S) * 1.0 * pow(10, -12) );
  
  if ( unitV1 == "decaliter(dal)" && unitV2 == "microliter / mm³" ) volume2S = str( float(volume1S) * 1.0 * pow(10, 7) );
  if ( unitV1 == "decaliter(dal)" && unitV2 == "ml / cm³" )  volume2S = str( float(volume1S) * 1.0 * pow(10, 4) );
  if ( unitV1 == "decaliter(dal)" && unitV2 == "centiliter (cl)" ) volume2S = str( float(volume1S) * 1.0 * pow(10, 3) );
  if ( unitV1 == "decaliter(dal)" && unitV2 == "deciliter (dl)" ) volume2S = str( float(volume1S) * 100 );
  if ( unitV1 == "decaliter(dal)" && unitV2 == "liter(l) / dm³" ) volume2S = str( float(volume1S) * 10 );
  if ( unitV1 == "decaliter(dal)" && unitV2 == "decaliter(dal)" ) volume2S = volume1S;
  if ( unitV1 == "decaliter(dal)" && unitV2 == "hectoliter(hl)" ) volume2S = str( float(volume1S) * 0.1 );
  if ( unitV1 == "decaliter(dal)" && unitV2 == "kiloliter(kl) / m³" ) volume2S = str( float(volume1S) * 1.0 * pow(10, -2) ); 
  if ( unitV1 == "decaliter(dal)" && unitV2 == "dam³" ) volume2S = str( float(volume1S) * 1.0 * pow(10, -5) );
  if ( unitV1 == "decaliter(dal)" && unitV2 == "hm³" ) volume2S = str( float(volume1S) * 1.0 * pow(10, -8) );
  if ( unitV1 == "decaliter(dal)" && unitV2 == "km³" ) volume2S = str( float(volume1S) * 1.0 * pow(10, -11) );
  
  if ( unitV1 == "hectoliter(hl)" && unitV2 == "microliter / mm³" ) volume2S = str( float(volume1S) * 1.0 * pow(10, 8) );
  if ( unitV1 == "hectoliter(hl)" && unitV2 == "ml / cm³" )  volume2S = str( float(volume1S) * 1.0 * pow(10, 5) );
  if ( unitV1 == "hectoliter(hl)" && unitV2 == "centiliter (cl)" ) volume2S = str( float(volume1S) * 1.0 * pow(10, 4) );
  if ( unitV1 == "hectoliter(hl)" && unitV2 == "deciliter (dl)" ) volume2S = str( float(volume1S) * 1.0 * pow(10, 3) );
  if ( unitV1 == "hectoliter(hl)" && unitV2 == "liter(l) / dm³" ) volume2S = str( float(volume1S) * 100 );
  if ( unitV1 == "hectoliter(hl)" && unitV2 == "decaliter(dal)" ) volume2S = str( float(volume1S) * 10 );
  if ( unitV1 == "hectoliter(hl)" && unitV2 == "hectoliter(hl)" ) volume2S = volume1S;
  if ( unitV1 == "hectoliter(hl)" && unitV2 == "kiloliter(kl) / m³" ) volume2S = str( float(volume1S) * 0.1 ); 
  if ( unitV1 == "hectoliter(hl)" && unitV2 == "dam³" ) volume2S = str( float(volume1S) * 1.0 * pow(10, -4) );
  if ( unitV1 == "hectoliter(hl)" && unitV2 == "hm³" ) volume2S = str( float(volume1S) * 1.0 * pow(10, -7) );
  if ( unitV1 == "hectoliter(hl)" && unitV2 == "km³" ) volume2S = str( float(volume1S) * 1.0 * pow(10, -10) );
  
  if ( unitV1 == "kiloliter(kl) / m³" && unitV2 == "microliter / mm³" ) volume2S = str( float(volume1S) * 1.0 * pow(10, 9) );
  if ( unitV1 == "kiloliter(kl) / m³" && unitV2 == "ml / cm³" )  volume2S = str( float(volume1S) * 1.0 * pow(10, 6) );
  if ( unitV1 == "kiloliter(kl) / m³" && unitV2 == "centiliter (cl)" ) volume2S = str( float(volume1S) * 1.0 * pow(10, 5) );
  if ( unitV1 == "kiloliter(kl) / m³" && unitV2 == "deciliter (dl)" ) volume2S = str( float(volume1S) * 1.0 * pow(10, 4) );
  if ( unitV1 == "kiloliter(kl) / m³" && unitV2 == "liter(l) / dm³" ) volume2S = str( float(volume1S) * 1.0 * pow(10, 3) );
  if ( unitV1 == "kiloliter(kl) / m³" && unitV2 == "decaliter(dal)" ) volume2S = str( float(volume1S) * 100 );
  if ( unitV1 == "kiloliter(kl) / m³" && unitV2 == "hectoliter(hl)" ) volume2S = str( float(volume1S) * 10 );
  if ( unitV1 == "kiloliter(kl) / m³" && unitV2 == "kiloliter(kl) / m³" ) volume2S = volume1S; 
  if ( unitV1 == "kiloliter(kl) / m³" && unitV2 == "dam³" ) volume2S = str( float(volume1S) * 1.0 * pow(10, -3) );
  if ( unitV1 == "kiloliter(kl) / m³" && unitV2 == "hm³" ) volume2S = str( float(volume1S) * 1.0 * pow(10, -6) );
  if ( unitV1 == "kiloliter(kl) / m³" && unitV2 == "km³" ) volume2S = str( float(volume1S) * 1.0 * pow(10, -9) );
  
  if ( unitV1 == "dam³" && unitV2 == "microliter / mm³" ) volume2S = str( float(volume1S) * 1.0 * pow(10, 12) );
  if ( unitV1 == "dam³" && unitV2 == "ml / cm³" )  volume2S = str( float(volume1S) * 1.0 * pow(10, 9) );
  if ( unitV1 == "dam³" && unitV2 == "centiliter (cl)" ) volume2S = str( float(volume1S) * 1.0 * pow(10, 8) );
  if ( unitV1 == "dam³" && unitV2 == "deciliter (dl)" ) volume2S = str( float(volume1S) * 1.0 * pow(10, 7) );
  if ( unitV1 == "dam³" && unitV2 == "liter(l) / dm³" ) volume2S = str( float(volume1S) * 1.0 * pow(10, 6) );
  if ( unitV1 == "dam³" && unitV2 == "decaliter(dal)" ) volume2S = str( float(volume1S) * 1.0 * pow(10, 5) );
  if ( unitV1 == "dam³" && unitV2 == "hectoliter(hl)" ) volume2S = str( float(volume1S) * 1.0 * pow(10, 4) );
  if ( unitV1 == "dam³" && unitV2 == "kiloliter(kl) / m³" ) volume2S = str( float(volume1S) * 1.0 * pow(10, 3) ); 
  if ( unitV1 == "dam³" && unitV2 == "dam³" ) volume2S = volume1S;
  if ( unitV1 == "dam³" && unitV2 == "hm³" ) volume2S = str( float(volume1S) * 1.0 * pow(10, -3) );
  if ( unitV1 == "dam³" && unitV2 == "km³" ) volume2S = str( float(volume1S) * 1.0 * pow(10, -6) );
  
  if ( unitV1 == "hm³" && unitV2 == "microliter / mm³" ) volume2S = str( float(volume1S) * 1.0 * pow(10, 15) );
  if ( unitV1 == "hm³" && unitV2 == "ml / cm³" )  volume2S = str( float(volume1S) * 1.0 * pow(10, 12) );
  if ( unitV1 == "hm³" && unitV2 == "centiliter (cl)" ) volume2S = str( float(volume1S) * 1.0 * pow(10, 11) );
  if ( unitV1 == "hm³" && unitV2 == "deciliter (dl)" ) volume2S = str( float(volume1S) * 1.0 * pow(10, 10) );
  if ( unitV1 == "hm³" && unitV2 == "liter(l) / dm³" ) volume2S = str( float(volume1S) * 1.0 * pow(10, 6) );
  if ( unitV1 == "hm³" && unitV2 == "decaliter(dal)" ) volume2S = str( float(volume1S) * 1.0 * pow(10, 8) );
  if ( unitV1 == "hm³" && unitV2 == "hectoliter(hl)" ) volume2S = str( float(volume1S) * 1.0 * pow(10, 7) );
  if ( unitV1 == "hm³" && unitV2 == "kiloliter(kl) / m³" ) volume2S = str( float(volume1S) * 1.0 * pow(10, 6) ); 
  if ( unitV1 == "hm³" && unitV2 == "dam³" ) volume2S = str( float(volume1S) * 1.0 * pow(10, 3) );
  if ( unitV1 == "hm³" && unitV2 == "hm³" ) volume2S = volume1S;
  if ( unitV1 == "hm³" && unitV2 == "km³" ) volume2S = str( float(volume1S) * 1.0 * pow(10, -3) );
  
  if ( unitV1 == "km³" && unitV2 == "microliter / mm³" ) volume2S = str( float(volume1S) * 1.0 * pow(10, 18) );
  if ( unitV1 == "km³" && unitV2 == "ml / cm³" )  volume2S = str( float(volume1S) * 1.0 * pow(10, 15) );
  if ( unitV1 == "km³" && unitV2 == "centiliter (cl)" ) volume2S = str( float(volume1S) * 1.0 * pow(10, 14) );
  if ( unitV1 == "km³" && unitV2 == "deciliter (dl)" ) volume2S = str( float(volume1S) * 1.0 * pow(10, 13) );
  if ( unitV1 == "km³" && unitV2 == "liter(l) / dm³" ) volume2S = str( float(volume1S) * 1.0 * pow(10, 12) );
  if ( unitV1 == "km³" && unitV2 == "decaliter(dal)" ) volume2S = str( float(volume1S) * 1.0 * pow(10, 11) );
  if ( unitV1 == "km³" && unitV2 == "hectoliter(hl)" ) volume2S = str( float(volume1S) * 1.0 * pow(10, 10) );
  if ( unitV1 == "km³" && unitV2 == "kiloliter(kl) / m³" ) volume2S = str( float(volume1S) * 1.0 * pow(10, 9) ); 
  if ( unitV1 == "km³" && unitV2 == "dam³" ) volume2S = str( float(volume1S) * 1.0 * pow(10, 6) );
  if ( unitV1 == "km³" && unitV2 == "hm³" ) volume2S = str( float(volume1S) * 1.0 * pow(10, 3) );
  if ( unitV1 == "km³" && unitV2 == "km³" ) volume2S = volume1S;
   
}