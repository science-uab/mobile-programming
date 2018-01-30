/*
  created by Oancea Maria-Nicoleta
  email: oanceamarianicoleta@gmail.com
  MIT license
*/

ClipboardManager clipboard;
ClipData clip;
Uri uri;
Intent intentSearch;

color getColor;

//the function where the interface for the color picker page is created
void colorPicker(){
  strokeWeight(3);
  stroke(#0000ff);
  fill(#0000ff);
  textAlign(CENTER, TOP);
  textSize(height/20);
  imageMode(CORNER);
  rect(0, 0, width, height/10 );
  fill(#ffffff);
  text("Color Picker", width/2, height/30);
  image(backImg, width/36, height/60, width/6.5, height/15);
  
  //if the camera is turned on the code below is performed, if the camera is turned off then this is start
  if (camera != null && camera.isStarted()){
    imageMode(CENTER);
    pushMatrix();
    translate(width/2, height/2.5);
    rotate(HALF_PI);
    image(camera, 0, 0, height/2, width-100);
    image(gridImg, 0, 0, height/2, width-100);
    popMatrix();

    PImage imgCamera = get(0, 0, width, height);
    getColor = imgCamera.get( (int)(width/2), (int)(height/2.5) );
    stroke(#000000);
    fill(getColor);
    rect(width/15+5, height/1.48 ,width/5 ,height/12);
    fill(#000000);
    textAlign(LEFT, TOP);
    textSize(height/28);
    text( "Color: #" + hex(getColor, 6),  width/3, height/1.42);
    fill(#ff0000);
    text( "Red: "+red(getColor),  width/15+5, height/1.27);
    fill(#00ff00);
    text( "Green: "+green(getColor),  width/15+5, height/1.2);
    fill(#0000ff);
    text( "Blue: " +blue(getColor),  width/15+5, height/1.13);
    
    strokeWeight(6);
    stroke(#b3b3b3);
    textAlign(CENTER, TOP);
    textSize(height/30);
    if (mouseX > width/2 && mouseX < width-40 && mouseY > height/1.25 && mouseY <  height/1.25+height/15 ) fill(#d9d9d9);
    else fill(#ffffff); 
    rect(width/2, height/1.25, width/2-40, height/15, 15);
    fill(#000000);
    text("COPY COLOR", 2.88*width/4, height/1.215);  
    
    if (mouseX > width/2 && mouseX < width-40 && mouseY > height/1.12 && mouseY <  height/1.12+height/15 ) fill(#d9d9d9);
    else fill(#ffffff); 
    rect(width/2, height/1.12, width/2-40, height/15, 15);
    fill(#000000);
    text("SEARCH COLOR", 2.88*width/4, height/1.1);  
  }
  else
  {
    if (camera != null) camera.start();
  }
}

//the function, where defines actions for the color picker page
void colorPickerClick(){
  if ( mouseX > width/36 && mouseX < width/36+width/6.5 && mouseY > height/60 && mouseY < height/60+height/15 ) {
    page = 0;
    camera.stop();
  }
  
  //the color code is copied to the clipboard by pressing the appropriate button
  if (mouseX > width/2 && mouseX < width-40 && mouseY > height/1.25 && mouseY <  height/1.25+height/15 ) {
     activity.runOnUiThread(new Runnable(){
      public void run(){
        clipboard = (ClipboardManager) activity.getSystemService(Context.CLIPBOARD_SERVICE);
        clip = android.content.ClipData.newPlainText("Color copied", "#" + hex(getColor, 6));
        clipboard.setPrimaryClip(clip);
        Toast.makeText(context, "Color copied",Toast.LENGTH_SHORT).show();
      }
    });  
  }
  
  //the color code is searched on google by pressing the appropriate button
  if (mouseX > width/2 && mouseX < width-40 && mouseY > height/1.12 && mouseY <  height/1.12+height/15 ){
     activity.runOnUiThread(new Runnable(){
      public void run(){
        uri = Uri.parse("https://www.google.com/search?q=%23" + hex(getColor, 6) );
        intentSearch = new Intent(Intent.ACTION_VIEW, uri);
        activity.startActivity(intentSearch);
      }
    }); 
    camera.stop();
  }
  
}